// Inherit the parent event
event_inherited();

last_seen_target_x = 0		// position where target is and was last seen if no longer in-sight
last_seen_target_y = 0
targets = ds_list_create()	// list of characters that are potential targets
target = noone				// current target (body object)
target_x = 0				// position of current target
target_y = 0

state = "explore"

obstr_objects = tag_get_asset_ids("AIObstruction", asset_object) // array of objects that are considered obstructions for AI motion planning

// A* path
// This is a path that is used for the higher level motion planning
// RRT tree motion planning is used for lower level motion
astpath = undefined
astpath_point = 0 // path point currently closest to player
astpath_furthvis_point = 0 // furthest path point visible from player
astpath_cell_size = 16
astpath_targ_x = undefined // target coordinates of A* path
astpath_targ_y = undefined
astpath_costs = ds_list_create() // list that maps path points to costs
astpath_ths = ds_list_create() // list that maps path points to orientation values (thetas)

// RRT* motion planning
// This is the RTT tree that grows from current position
// Each step, segments are added to tree to explore optimal path
rrt_field = undefined // the current field we are using for motion planning, the RRT field is a function that maps x, y, th coordinate to an H cost and th angle pointing towards lowest cost
rrt_branch = undefined // current RRT* branch we're walking
rrt_dest = undefined // destination branch of RRT
rrt_branches = ds_list_create() // all branches of RRT
rrt_branches_open = ds_list_create() // list of branches that are still open, no connections at end point yet
rrt_tolerance = 50 // H cost below which motion is no longer necessary
rrt_powerlaw_p = 3 // p constant in power-law weighing for node-selection. p = 0 means uniform dist., p = 1 means mild preference for lower H cost, p = high means strong preference
rrt_gearshift_pen = 0 // penalty variables in G cost for gearshift or steershift between RRT node and its parent. The higher the shift penalties, the more it preserves momentum.
rrt_steershift_pen = 0
rrt_branch_completed = false // whether current branch we're walking has been completed
rrt_pause = false // pause rrt (for debugging purposes)
rrt_walk_timer = -1 // timer for keeping completion time of element in check
rrt_walk_maxtime = 80 // how many steps maximally to wait for completing element
rrt_repdrop_counter = 0 // counter increasing on each bundle addition
rrt_repdrop_every = 20 // after how many added bundle to add repulsion source
colslider = create_groundhigh(x, y, obj_ai_collision_slider) // create collision slider for checking collisions on planned RRT paths (it 'slides' over the RRT paths)
prune_count = 0

// Artificial potential field
apf_sources = ds_list_create() // list of APF source objects, attraction or repulsion sources
apf_target_attraction_timer = 0 // timer incrementing each step
apf_target_attraction_every = 40 // after how many steps to drop attraction sources at target


/* --- A* FUNCTIONS --- */

// Create A* path to target (defined outside)
function astpath_compute() {
	var body = character.body
	
	if (path_exists(astpath))
		path_delete(astpath) // delete old path if exists
	
	astpath = path_add()
	astpath_point = 0			// reset path point counter
	
	if (astpath_targ_x != undefined && astpath_targ_y != undefined) { // check if target was set
		if (!mp_grid_path(obj_ai_topology.grid, astpath, body.get_x(), body.get_y(), astpath_targ_x, astpath_targ_y, true)) { // try making path, if not succesful
			path_delete(astpath) // if not succesful
			astpath = undefined
		} else { // if succesful
			astpath_compute_path_attributes()
		}
	}
	
}

// When A* path is computed, this function computes path attributes
function astpath_compute_path_attributes() {
	ds_list_clear(astpath_costs) // clear lists keeping track of path point attributes
	ds_list_clear(astpath_ths)
	
	var _len = path_get_length(astpath) // total path length
	var _len_acc = 0 // accumulated length from start
	var _cost, _th, _pt_x, _pt_y, _pt_x_next, _pt_y_next
	for (var i = 0; i < path_get_number(astpath); i ++) {
		_pt_x = path_get_point_x(astpath, i)
		_pt_y = path_get_point_y(astpath, i)
		
		_cost = _len - _len_acc // compute path cost of point (total length minus accumulated length from start)
		
		if (i < path_get_number(astpath)-1) { // for all points except final point
			_pt_x_next = path_get_point_x(astpath, i+1)
			_pt_y_next = path_get_point_y(astpath, i+1)
		
			_th = point_direction(_pt_x, _pt_y, _pt_x_next, _pt_y_next) // compute angle to next point
			_len_acc += point_distance(_pt_x, _pt_y, _pt_x_next, _pt_y_next)
		}
		
		ds_list_add(astpath_costs, _cost)
		ds_list_add(astpath_ths, _th)
	}
}

// For a _x, _y, compute which point on A* path is the nearest
// Returns the index of that path point and the distance to it
function astpath_compute_nearest_point(_x, _y) {
	var _dist = infinity
	var _path_pt = 0 // index on path of nearest point
	for (var i = 0; i < path_get_number(astpath); i ++) {
		var _pt_x = path_get_point_x(astpath, i)
		var _pt_y = path_get_point_y(astpath, i)
		var _pt_dist = point_distance(_x, _y, _pt_x, _pt_y)
		if (_pt_dist < _dist) {
			_dist = _pt_dist
			_path_pt = i
		}
	}
	
	return [_path_pt, _dist]
}

// For a _x, _y, compute furthest point on A* path that is visible
// Returns the index of that path point
function astpath_compute_furthest_visible_point(_x, _y) {
	var _path_pt = 0 // index on path of nearest point
	for (var i = 0; i < path_get_number(astpath); i ++) {
		var _pt_x = path_get_point_x(astpath, i)
		var _pt_y = path_get_point_y(astpath, i)
		var _vis = line_movable(_pt_x, _pt_y)
		if (_vis) {
			_path_pt = i
		}
	}
	
	return _path_pt
}

/* --- RRT* FUNCTIONS --- */

// RRT H cost field based on distance to mouse (cursor)
function rrt_mouse_field(_x, _y, _th) {
	var _lowest_cost_dir = point_direction(_x, _y, mouse_x, mouse_y) // direction to lowest cost from point
	return [point_distance(_x, _y, mouse_x, mouse_y), _lowest_cost_dir]
}

// For given RRT branch, return H cost based on resistance/compliance with APF-manifold
function rrt_apf_manifold(_x, _y, _th) {
	var _ri;
	var _z = 0; var _fx = 0; var _fy = 0
	for (var i = 0; i < ds_list_size(apf_sources); i ++) {
		var _source = apf_sources[|i]
		var _Ri = _source.radius // radius of course
		var _Hi = _source.height // height of source
		var _A = !_source.rep_type * 2 - 1 // sign of source (-1 for repulsion 1 for attraction)
		
		_ri = point_distance(_x, _y, _source.x, _source.y)  // distance to source
		
		if (_ri <= _Ri) { // if falls within source radius
			_z += -_A * _Hi * sqr(1 - sqr(_ri) / sqr(_Ri)) // height on manifold of _x, _y point
			_fx += _A * 4 * _Hi / sqr(_Ri) * (1 - sqr(_ri) / sqr(_Ri)) * (_x - _source.x) // gradient in x and y directions of tangent plane at _x, _y
			_fy += _A * 4 * _Hi / sqr(_Ri) * (1 - sqr(_ri) / sqr(_Ri)) * (_y - _source.y)
		}
	}
	
	var _s = _fx * lengthdir_x(1, _th) + _fy * lengthdir_y(1, _th)
	var _slope = darctan(_s)
	
	if (_z == undefined || _fx == undefined ||_fy == undefined || _slope == undefined)
		_z = 0
	
	return [_z, -_fx, -_fy, _slope] // return height on manifold, normal vector (projected onto xy-plane), and the slope of tangent plane in direction of _th
}

// RRT target field, where AI approaches target and takes into account moving around walls
function rrt_approach_target_field(_x, _y, _th) {
	var _cost = 0
	
	var _target_dist = point_distance(_x, _y, target_x, target_y)
	var _target_dir = point_direction(_x, _y, target_x, target_y)
	var _line_collision = line_shootable(target_x, target_y)
	if (!_line_collision) {
		_cost += _target_dist
	}
	
	var _potential_vec_x = 0 // initialize potential vector
	var _potential_vec_y = 0
	for (var i = 0; i < ds_list_size(apf_sources); i ++) {
		var _source = apf_sources[|i]
		var _radius = _source.radius
		var _strength = _source.strength
		
		var _dist = point_distance(_x, _y, _source.x, _source.y) // direction from RTT element point to APF source
		var _dir = point_direction(_x, _y, _source.x, _source.y)
		
		_strength *= (_radius == 0) ? 0 : (max(_radius - _dist, 0) / _radius) // (normalised) source strength based on distance to source
		
		_potential_vec_x += lengthdir_x(_strength, _dir + _source.rep_type * 180) // add attraction/repulsion to potential vector
		_potential_vec_y += lengthdir_y(_strength, _dir + _source.rep_type * 180)
		
		if (_source.rep_type)
			_cost += _radius * _strength
		else {
			_cost += _radius * (1 - _strength)
		}
	}
	
	// project potential vector onto wall normals topology
	var _pot_dir = point_direction(0, 0, _potential_vec_x, _potential_vec_y) // direction of accumulated potential vector
	var _pot_dist = point_distance(0, 0, _potential_vec_x, _potential_vec_y) // length of potential vector
	
	var _cell_size = obj_ai_topology.cell_size
	var _cell_i = floor(_x / _cell_size) 
	var _cell_j = floor(_y / _cell_size)
	var _orientation = obj_ai_topology.orientations[# _cell_i, _cell_j]
	var _strength = obj_ai_topology.strengths[# _cell_i, _cell_j]
	var _proj_vec_dir = _pot_dir
	if (_orientation != undefined) {
	
		if (abs(angle_difference(_pot_dir, _orientation+180)) < abs(angle_difference(_pot_dir, _orientation))) { // since orientation is bi-directional, check if potential vector is closer to backwards version of orientation direction
			_orientation += 180
		}
	
		var _diff = angle_difference(_pot_dir, _orientation) // angle between orientation and potential vector
		var _par_proj = lengthdir_x(_pot_dir, _diff) // parallel projection onto orientation
		var _perp_proj = lengthdir_y(_pot_dir, _diff) // perpendicular projection onto orientation
		var _proj_vec_x = lengthdir_x(_par_proj, _orientation) + (1 - _strength) * lengthdir_x(_perp_proj, _orientation - 90) // compute projected vector as projected parallel to orientation plus perpendicular part that is weighted with strength (if 1 strength, completely parallel to orientation, if 0 strength it is just the original vector)
		var _proj_vec_y = lengthdir_y(_par_proj, _orientation) + (1 - _strength) * lengthdir_y(_perp_proj, _orientation - 90)
	
		_proj_vec_dir = point_direction(0, 0, _proj_vec_x, _proj_vec_y)
		if (point_distance(0, 0, _proj_vec_x, _proj_vec_y) > 0.001)
			_cost += degtorad(abs(angle_difference(_proj_vec_dir, _th))) * 18 // add (mis)alignment of current RRT element with projected vector to cost
			
	}
	
	return [_cost, _proj_vec_dir]
}

// RRT target field, where AI focuses its rotation (shooting direction) on target
function rrt_shoot_target_field(_x, _y, _th) {
	var _cost = 0
		
	var _line_collision = line_shootable(target_x, target_y)
	if (!_line_collision) {
		var _dist = point_distance(_x, _y, target_x, target_y)
			
		_cost += _dist
	}
		
	var _aim_precision = 3 // tolerance in which we are happy with shooting angle
	var _target_dir = point_direction(_x, _y, target_x, target_y)
	_cost += abs(angle_difference(_target_dir, _th)) / _aim_precision * rrt_tolerance
		
		
	return [_cost, _target_dir]
}

// RRT APF field
function rrt_apf_with_topology_constraints(_x, _y, _th) {
	var _cost = 0
	
	var _potential_vec_x = 0 // initialize potential vector
	var _potential_vec_y = 0
	for (var i = 0; i < ds_list_size(apf_sources); i ++) {
		var _source = apf_sources[|i]
		var _source_x = _source[0]
		var _source_y = _source[1]
		var _rep_radius = _source[2]
		var _rep_strength = _source[3]
		var _attr_radius = _source[4]
		var _attr_strength = _source[5]
		
		var _dist = point_distance(_x, _y, _source_x, _source_y) // direction from RTT element point to APF source
		var _dir = point_direction(_x, _y, _source_x, _source_y)
		
		_rep_strength *= (_rep_radius == 0) ? 0 : (max(_rep_radius - _dist, 0) / _rep_radius) // (normalised) repulsion strength based on distance to source
		_attr_strength *= (_attr_radius == 0) ? 0 : (max(_attr_radius - _dist, 0) / _attr_radius) // (normalised) attraction strength based on distance to source
		
		_potential_vec_x += lengthdir_x(_attr_strength, _dir) + lengthdir_x(_rep_strength, _dir + 180) // add attraction and repulsion to potential vector
		_potential_vec_y += lengthdir_y(_attr_strength, _dir) + lengthdir_y(_rep_strength, _dir + 180)
		
		_cost += _rep_radius * _rep_strength - _attr_radius * _attr_strength // add to cost positive influence of repulsion strength and negative influence of attraction strength
			// so the closer we are to repulsion source, the higher the cost, the further away the lower the cost
			// for the attraction source the other way around; the closer, the lower the cost, the further away the higher the cost
	}
	
	// project potential vector onto wall normals topology
	var _pot_dir = point_direction(0, 0, _potential_vec_x, _potential_vec_y) // direction of accumulated potential vector
	var _pot_dist = point_distance(0, 0, _potential_vec_x, _potential_vec_y) // length of potential vector
	
	var _cell_size = obj_ai_topology.cell_size
	var _cell_i = floor(_x / _cell_size) 
	var _cell_j = floor(_y / _cell_size)
	var _orientation = obj_ai_topology.orientations[# _cell_i, _cell_j]
	var _strength = obj_ai_topology.strengths[# _cell_i, _cell_j]
	var _proj_vec_dir = _pot_dir
	if (_orientation != undefined) {
	
		if (abs(angle_difference(_pot_dir, _orientation+180)) < abs(angle_difference(_pot_dir, _orientation))) { // since orientation is bi-directional, check if potential vector is closer to backwards version of orientation direction
			_orientation += 180
		}
	
		var _diff = angle_difference(_pot_dir, _orientation) // angle between orientation and potential vector
		var _par_proj = lengthdir_x(_pot_dist, _diff) // parallel projection onto orientation
		var _perp_proj = lengthdir_y(_pot_dist, _diff) // perpendicular projection onto orientation
		var _proj_vec_x = lengthdir_x(_par_proj, _orientation) + (1 - _strength) * lengthdir_x(_perp_proj, _orientation - 90) // compute projected vector as projected parallel to orientation plus perpendicular part that is weighted with strength (if 1 strength, completely parallel to orientation, if 0 strength it is just the original vector)
		var _proj_vec_y = lengthdir_y(_par_proj, _orientation) + (1 - _strength) * lengthdir_y(_perp_proj, _orientation - 90)
	
		_proj_vec_dir = point_direction(0, 0, _proj_vec_x, _proj_vec_y)
		if (point_distance(0, 0, _proj_vec_x, _proj_vec_y) > 0.001)
			_cost += abs(angle_difference(_proj_vec_dir, _th)) / 180 // add (mis)alignment of current RRT element with projected vector to cost
			
	}
	
	return [_cost, _proj_vec_dir] // return cost and the direction of the projected potential vector as the direction of lowest cost
}

// Repulsion to enemies
function rrt_enemy_repulsion(_x, _y, _th) {
	//var _enemy_attr_r = 200 // attraction and repulsion radii to and from enemy
	var _enemy_rep_r = 200 // repulsion radius from enemy
	var _cost = 0
	
	var _rep_vec_x = 0 // accumulated repulsion vector from all enemies
	var _rep_vec_y = 0
	for (var i = 0; i < ds_list_size(enemies); i ++) {
		var _enemy_body = enemies[|i].body
		var _dist = point_distance(_enemy_body.get_x(), _enemy_body.get_y(), _x, _y)
		var _dir = point_direction(_enemy_body.get_x(), _enemy_body.get_y(), _x, _y) // direction from enemy to point
		
		var _rep_strength = max(_enemy_rep_r - _dist, 0) / _enemy_rep_r // (normalised) repulsion strength based on distance to enemy
		_rep_vec_x += lengthdir_x(_rep_strength, _dir) // add to repulsion vector
		_rep_vec_y += lengthdir_y(_rep_strength, _dir)
		
		_cost += max(_enemy_rep_r - _dist, 0) // add repulsion distance cost
	}
		
	// compass topology penalty
	//var _cell_size = obj_ai_topology.cell_size
	//var _cell_i = floor(_x / _cell_size) 
	//var _cell_j = floor(_y / _cell_size)
	//var _compass = obj_ai_topology.compasses[# _cell_i, _cell_j]
	//if (_compass != undefined) { // if within grid range
	//	var _top_penalty = 0
	//	_top_penalty += _compass[0] * (1 - min(90, abs(angle_difference(90, _th))) / 90) // n
	//	_top_penalty += _compass[1] * (1 - min(90, abs(angle_difference(0, _th))) / 90) // e
	//	_top_penalty += _compass[2] * (1 - min(90, abs(angle_difference(270, _th))) / 90) // s
	//	_top_penalty += _compass[3] * (1 - min(90, abs(angle_difference(180, _th))) / 90) // w
	
	//	_cost += _top_penalty * 360
	//}
	
	// project repulsion vector onto wall normals topology
	var _rep_dir = point_direction(0, 0, _rep_vec_x, _rep_vec_y) // direction of accumulated repulsion vector
	var _rep_dist = point_distance(0, 0, _rep_vec_x, _rep_vec_y) // length of repulsion vector
	
	var _cell_size = obj_ai_topology.cell_size
	var _cell_i = floor(_x / _cell_size) 
	var _cell_j = floor(_y / _cell_size)
	var _orientation = obj_ai_topology.orientations[# _cell_i, _cell_j]
	var _strength = obj_ai_topology.strengths[# _cell_i, _cell_j]
	var _proj_vec_dir = _rep_dir
	if (_orientation != undefined) {
	
		if (abs(angle_difference(_rep_dir, _orientation+180)) < abs(angle_difference(_rep_dir, _orientation))) { // since orientation is bi-directional, check if repulsion vector is closer to backwards version of orientation direction
			_orientation += 180
		}
	
		var _diff = angle_difference(_rep_dir, _orientation) // angle between orientation and rep vector
		var _par_proj = lengthdir_x(_rep_dist, _diff) // parallel projection onto orientation
		var _perp_proj = lengthdir_y(_rep_dist, _diff) // perpendicular projection onto orientation
		var _proj_vec_x = lengthdir_x(_par_proj, _orientation) + (1 - _strength) * lengthdir_x(_perp_proj, _orientation - 90) // compute projected vector as projected parallel to orientation plus perpendicular part that is weighted with strength (if 1 strength, completely parallel to orientation, if 0 strength it is just the original vector)
		var _proj_vec_y = lengthdir_y(_par_proj, _orientation) + (1 - _strength) * lengthdir_y(_perp_proj, _orientation - 90)
	
		_proj_vec_dir = point_direction(0, 0, _proj_vec_x, _proj_vec_y)
		if (point_distance(0, 0, _proj_vec_x, _proj_vec_y) > 0.001)
			_cost += abs(angle_difference(_proj_vec_dir, _th)) // add (mis)alignment of current RRT element with projected vector to cost
			
	}
	
	return [_cost, _proj_vec_dir]
}

// Compute H cost of a path element based on its distance to nearest point in A* path
function rrt_compute_h_cost(_x_end, _y_end, _th_end) {
	var _nearest = astpath_compute_nearest_point(_x_end, _y_end) // find index of nearest point and distance to it
	var _nearest_pt = _nearest[0]
	var _nearest_dist = _nearest[1]
	
	var _th = astpath_ths[|_nearest_pt]
	return astpath_costs[|_nearest_pt] + _nearest_dist + abs(angle_difference(_th_end, _th)) // H cost is path cost of nearest point, plus distance to that point, plus difference in orientation of element end point and orientation of nearest path point
}

/* --- LINE/POINT FREE FUNCTIONS --- */

// Function to check whether line to target is not obstructed (by walls)
function line_movable(_target_x, _target_y) {
	var body = character.body
	
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		if (instance_exists(collision_line(body.get_x(), body.get_y(), _target_x, _target_y, obstr_objects[i], false, true)))
			return false
	}
	return true
}

// Function to check whether a point is not obstructed
function point_movable(_point_x, point_y) {
	var body = character.body
	
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		if (position_meeting(_point_x, point_y, obstr_objects[i]))
			return false
	}
	return true
}

// Function to check whether there is a line of fire with target
function line_shootable(_target_x, _target_y) {
	var body = character.body
	var weapon = character.weapon
	
	//var barrel_x = weapon.get_weapon_barrel_x(body)
	//var barrel_y = weapon.get_weapon_barrel_y(body)
	
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		var obstacles = ds_list_create()
		collision_line_list(body.get_x(), body.get_y(), _target_x, _target_y, obstr_objects[i], false, true, obstacles, false)
		for (var j = 0; j < ds_list_size(obstacles); j ++) {
			if (obstacles[|j].height == HL.high) {
				ds_list_destroy(obstacles) // cleanup
				return false
			}
		}
		ds_list_destroy(obstacles) // cleanup
	}
	return true
}

// Check shootable line of fire from any point
function line_shootable_arbitrary(_point_x, _point_y, _target_x, _target_y) {
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		var obstacles = ds_list_create()
		collision_line_list(_point_x, _point_y, _target_x, _target_y, obstr_objects[i], false, true, obstacles, false)
		for (var j = 0; j < ds_list_size(obstacles); j ++) {
			if (obstacles[|j].height == HL.high) {
				ds_list_destroy(obstacles) // cleanup
				return false
			}
		}	
		ds_list_destroy(obstacles) // cleanup
	}
	return true
}

// Choose shortest out of 2 paths: a path for walking to the target,
// and a path to a vantage point from which target can be shot
function shoot_path(_target_x, _target_y) {
	var body = character.body
	
	// Try making a walk path to target
	astpath_targ_x = _target_x
	astpath_targ_y = _target_y
	astpath_compute()
	
	var walk_path_length = astpath != undefined ? path_get_length(astpath) : infinity
		
	// Make path that goes over low objects, and try to find a line of fire on it
	// If found, chose this path
	var shoot_path = path_add()
	var shoot_path_length = 0
	if (mp_grid_path(grid_high, shoot_path, body.get_x(), body.get_y(), _target_x, _target_y, false)) {
		var traversal_point = 0
		while (true) { // loop trough path points until line of fire found
			var point_x = path_get_point_x(shoot_path, traversal_point)
			var point_y = path_get_point_y(shoot_path, traversal_point)
			
			if (!point_movable(point_x, point_y)) break // unreachable point, stop searching
			
			if (line_shootable_arbitrary(point_x, point_y, _target_x, _target_y)) { // if line of fire found
				if (shoot_path_length < walk_path_length) { // if it is shorter, replace path with shoot path
					if (astpath != undefined)
						path_delete(astpath) // remove old path
					astpath = shoot_path // set new path
					astpath_compute_path_attributes()
					break // break loop
				}
			}
			
			if (traversal_point > 0) { // add distance to previous point to total distance
				var prev_point_x = path_get_point_x(shoot_path, traversal_point - 1)
				var prev_point_y = path_get_point_y(shoot_path, traversal_point - 1)
				shoot_path_length += point_distance(prev_point_x, prev_point_y, point_x, point_y)
			}
			
			traversal_point ++ // traverse to next point
			if (traversal_point > path_get_number(shoot_path) - 1) // traversed entire path, stop
				break
		}
		if (shoot_path != astpath) // shoot_path was not chosen, delete it
			path_delete(shoot_path)
	}
}

// Function that returns turn input, given a target direction
function input_dir(_dir) {
	var body = character.body
	
	var dead_angle = 3
	var angle_diff = angle_difference(body.get_rotation(), _dir)
	if (angle_diff < -dead_angle) return 1
	if (angle_diff > dead_angle) return -1
	return 0
}

// Check barrel location of weapon to align weapon rotatation
function aim_weapon(_target_x, _target_y) {
	var body = character.body
	var weapon = character.weapon
	
	var barrel_x = weapon.get_weapon_barrel_x(body)
	var barrel_y = weapon.get_weapon_barrel_y(body)
	var desired_weapon_dir = point_direction(barrel_x, barrel_y, _target_x, _target_y)
	
	// Align weapon rotation
	var dead_angle = 4
	var angle_diff = angle_difference(weapon.get_weapon_rotation(body), desired_weapon_dir)
	if (angle_diff < -dead_angle) return 1
	if (angle_diff > dead_angle) return -1
	return 0
}