event_inherited()

last_seen_target_x = 0		// position where target is and was last seen if no longer in-sight
last_seen_target_y = 0
targets = ds_list_create()	// list of bodies that are potential targets
target = noone				// current target (body object)
scope_w = 640
scope_h = 320
trigger_timer = 0			// timer that turns input_attack true on zero

state = "explore"

// Decision tree
dtree_timer = 0				// timer to call decision tree update
dtree_update_time = 60		// number of steps between each dtree update
conflict = false			// whether there are enemies to conflict with
fight_or_flight = ""		// when conflict, whether to fight, flight or await
path_recompute_timer = 0	// timer to recompute path when dealing with dynamic goal
path_recompute_time = 20	// number of steps between each path recompute

// A* path
// This is a path that is used for the higher level motion planning
// RS path is used for lower level motion
astpath = undefined
astpath_point = 0 // path point currently closest to player
astpath_furthvis_point = 0 // furthest path point visible from player
astpath_cell_size = 16
astpath_targ_x = undefined // target coordinates of A* path
astpath_targ_y = undefined
grid = undefined // motion planning grid
grid_high = undefined // motion planning grid for high objects

// RRT*
// This is the RTT tree that grows from current position
// Each step, segments are added to tree to explore optimal path
rrt_branch = undefined // current RRT* branch we're walking
rrt_branches = ds_list_create() // all branches of RRT* tree
rrt_open_branches = ds_list_create() // list of branches that are still open, no connections at end point yet
rrt_test_pt = undefined
rrt_completed = false // whether current branch we're walking has been completed
rrt_pause = false // pause rrt (for debugging purposes)
rrt_walk_timer = -1 // timer for keeping completion time of element in check
rrt_walk_maxtime = 60 // how many steps maximally to wait for completing element
rrt_arc_r = 50 // turning radius for arcs

colslider = create_groundhigh(x, y, obj_ai_collision_slider) // create collision slider for checking collisions on planned motion paths (it 'slides' over the motion paths)
obstr_objects = tag_get_asset_ids("AIObstruction", asset_object) // array of objects that are considered obstructions for AI motion planning

	
// Compute H cost (in A* terms) of a path element based on its distance to nearest point in A* path
function compute_h_cost(_x_end, _y_end, _th_end) {
	var _dist = infinity
	var _nearest_i = 0 // index on path of nearest point
	var _nearest_dist = 0
	var _path_n = path_get_number(astpath)
	for (var i = 0; i < _path_n; i ++) {
		var _pt_x = path_get_point_x(astpath, i)
		var _pt_y = path_get_point_y(astpath, i)
		var _pt_dist = point_distance(_x_end, _y_end, _pt_x, _pt_y)
		if (_pt_dist < _dist) {
			_dist = _pt_dist
			_nearest_i = i
		}
	}
	
	if (_dist != infinity) {
		var _path_total_cost = _path_n * astpath_cell_size
		var _p_cost = _path_total_cost - _nearest_i * astpath_cell_size // path cost of the nearest point (cost to end goal)
		var _h_cost = _p_cost + _dist
		
		// compute orientation cost of path element
		if (_nearest_i < _path_n-1) {
			var _pt_x = path_get_point_x(astpath, _nearest_i)
			var _pt_y = path_get_point_y(astpath, _nearest_i)
			var _pt_next_x = path_get_point_x(astpath, _nearest_i + 1)
			var _pt_next_y = path_get_point_y(astpath, _nearest_i + 1)
			var _pt_th = point_direction(_pt_x, _pt_y, _pt_next_x, _pt_next_y)
		} else { // last path point
			var _pt_x = path_get_point_x(astpath, _nearest_i)
			var _pt_y = path_get_point_y(astpath, _nearest_i)
			var _pt_prev_x = path_get_point_x(astpath, _nearest_i - 1)
			var _pt_prev_y = path_get_point_y(astpath, _nearest_i - 1)
			var _pt_th = point_direction(_pt_prev_x, _pt_prev_y, _pt_x, _pt_y)
		}
			
		_h_cost += 1 * abs(angle_difference(_th_end, _pt_th)) // add orientation cost to h_cost
		
		return _h_cost
	}
	
	return undefined
}

//Function to generate motion-planning grid
function generate_mp_grid(_cell_size) {
	var grid = mp_grid_create(0, 0, room_width/_cell_size, room_height/_cell_size, _cell_size, _cell_size)
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		mp_grid_add_instances(grid, obstr_objects[i], true)
	}
	return grid
}

// Generate mp grid with only high obstructions
function generate_mp_grid_high(_cell_size) {
	var grid = mp_grid_create(0, 0, room_width/_cell_size, room_height/_cell_size, _cell_size, _cell_size)
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		for (var j = 0; j < instance_number(obstr_objects[i]); j ++) {
			var obstacle = instance_find(obstr_objects[i], j)
			if (obstacle.height == HL.high)
				mp_grid_add_instances(grid, obstacle, true)
		}
	}
	return grid
}

// Function to check whether line to target is not obstructed (by walls)
function line_movable(_target_x, _target_y) {
	var body = player.body
	
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		if (instance_exists(collision_line(body.get_x(), body.get_y(), _target_x, _target_y, obstr_objects[i], false, true)))
			return false
	}
	return true
}

// Function to check whether a point is not obstructed
function point_movable(_point_x, point_y) {
	var body = player.body
	
	for (var i = 0; i < array_length(obstr_objects); i ++) {
		if (position_meeting(_point_x, point_y, obstr_objects[i]))
			return false
	}
	return true
}

// Function to check whether there is a line of fire with target
function line_shootable(_target_x, _target_y) {
	var body = player.body
	var weapon = player.weapon
	
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

// Reset RRT* tree
function rrt_reset() {
	if (rrt_branch != undefined) {
		rrt_mark_del(rrt_branch) // destroy current RRT branch (and thereby the full tree)
		rrt_branch = undefined
	}
}

// Reset path
function reset_path() {
	if (astpath != undefined)
		path_delete(astpath)
	astpath = undefined
	rrt_reset()
}

// Create A* path to target
function compute_astpath() { // create_holonomic_path
	var body = player.body
	
	reset_path()
	
	astpath = path_add()
	astpath_point = 0			// reset path point counter
	if (astpath_targ_x != undefined && astpath_targ_y != undefined) {
		if (!mp_grid_path(grid, astpath, body.get_x(), body.get_y(), astpath_targ_x, astpath_targ_y, true)) { // try making path
			path_delete(astpath) // if not succesful
			astpath = undefined
			astpath_targ_x = undefined
			astpath_targ_y = undefined
		}
	}
	
}

// Choose shortest out of 2 paths: a path for walking to the target,
// and a path to a vantage point from which target can be shot
function shoot_path(_target_x, _target_y) {
	var body = player.body
	
	// Try making a walk path to target
	astpath_targ_x = _target_x
	astpath_targ_y = _target_y
	compute_astpath()
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
					reset_path() // remove old path
					astpath = shoot_path // set new path
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
	var body = player.body
	
	var dead_angle = 3
	var angle_diff = angle_difference(body.get_rotation(), _dir)
	if (angle_diff < -dead_angle) return 1
	if (angle_diff > dead_angle) return -1
	return 0
}

// Check barrel location of weapon to align weapon rotatation
function aim_weapon(_target_x, _target_y) {
	var body = player.body
	var weapon = player.weapon
	
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

// Update decision tree state
function update_decision_tree() {
	var body = player.body
	var weapon = player.weapon
	var hp = player.hp

	conflict = instance_exists(target)
	if (conflict) {
		var fight = (hp.hp / hp.hp_max) - 0.5 * weapon.get_fire_unready()
		var flight = 1 - (hp.hp / hp.hp_max) + weapon.ammo_reserve == 0
		var await = 1 - 0.5 * (hp.hp / hp.hp_max) + 0.5 * weapon.get_fire_unready()
		var max_state = max(fight, flight, await)
		fight_or_flight = fight == max_state ? "fight" : (flight == max_state ? "flight" : "await")	
	}
}