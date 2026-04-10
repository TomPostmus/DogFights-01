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

// Holonomic path
// This is a path that is used for the higher level motion planning
// RS path is used for lower level motion
holpath = undefined
holpath_point = 0
holpath_cell_size = 16

// A* river
astriver = undefined // rows of the 2D map (map in maps) that contain A* river cells, the map is dynamic in size, since cells are added to it dynamically
astriver_rows = ds_list_create() // list to track which rows are used in 2D A* river map
astriver_cols = ds_list_create() // list to track which columns are used in 2D A* river map
astriver_radius = 6 // how many cells the river spreads around the original A* path in each direction
astriver_build_i = 0 // at which point we're currently building

// RRT*
rrt_branch = undefined // current RRT* branch we're walking
rrt_branches = ds_list_create() // branches of RRT* tree

// Reeds Shepp path planning
rs_min_r = 50 // minimum turning radius for RS
rs_path = undefined // current RS path we're walking
rs_start = undefined // start pose for RS path
rs_target = undefined // target pose for RS path
rs_path_elem_i = 0 // index of RS we're currently walking

//Function to generate motion-planning grid
function generate_mp_grid(_cell_size) {
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	var grid = mp_grid_create(0, 0, room_width/_cell_size, room_height/_cell_size, _cell_size, _cell_size)
	for (var i = 0; i < array_length(objects); i ++) {
		mp_grid_add_instances(grid, objects[i], true)
	}
	return grid
}

// Generate mp grid with only high obstructions
function generate_mp_grid_high(_cell_size) {
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	var grid = mp_grid_create(0, 0, room_width/_cell_size, room_height/_cell_size, _cell_size, _cell_size)
	for (var i = 0; i < array_length(objects); i ++) {
		for (var j = 0; j < instance_number(objects[i]); j ++) {
			var obstacle = instance_find(objects[i], j)
			if (obstacle.height == HL.high)
				mp_grid_add_instances(grid, obstacle, true)
		}
	}
	return grid
}

//Define motion-planning grids
grid = generate_mp_grid(holpath_cell_size)
grid_high = generate_mp_grid_high(8)

// Function to check whether line to target is not obstructed (by walls)
function line_movable(_target_x, _target_y) {
	var body = player.body
	
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	for (var i = 0; i < array_length(objects); i ++) {
		if (instance_exists(collision_line(body.get_x(), body.get_y(), _target_x, _target_y, objects[i], false, true)))
			return false
	}
	return true
}

// Function to check whether a point is not obstructed
function point_movable(_point_x, point_y) {
	var body = player.body
	
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	for (var i = 0; i < array_length(objects); i ++) {
		if (position_meeting(_point_x, point_y, objects[i]))
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
	
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	for (var i = 0; i < array_length(objects); i ++) {
		var obstacles = ds_list_create()
		collision_line_list(body.get_x(), body.get_y(), _target_x, _target_y, objects[i], false, true, obstacles, false)
		for (var j = 0; j < ds_list_size(obstacles); j ++) {
			if (obstacles[|j].height == HL.high)
				return false
		}	
	}
	return true
}

// Check shootable line of fire from any point
function line_shootable_arbitrary(_point_x, _point_y, _target_x, _target_y) {
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	for (var i = 0; i < array_length(objects); i ++) {
		var obstacles = ds_list_create()
		collision_line_list(_point_x, _point_y, _target_x, _target_y, objects[i], false, true, obstacles, false)
		for (var j = 0; j < ds_list_size(obstacles); j ++) {
			if (obstacles[|j].height == HL.high)
				return false
		}	
	}
	return true
}

// Check if an RS path is free of collisions by player
function rs_path_free(_rs_path) {
	var _obstr_objects = tag_get_asset_ids("AIObstruction", asset_object)
	var _check_width = 5 // assumed width of player, check left and right from center line at _check_width away
	for (var i = 0; i < ds_list_size(_rs_path); i ++) {
		var _p_elem = _rs_path[|i]
		if (_p_elem.steering == RS_STRAIGHT) { // line path element
			
			for (var j = 0; j < array_length(_obstr_objects); j ++) {
				if (instance_exists(collision_line(_p_elem.x, _p_elem.y, _p_elem.x_end, _p_elem.y_end, _obstr_objects[j], false, true))) // check center line
					return false
				if (instance_exists(collision_line(
					_p_elem.x + lengthdir_x(_check_width, _p_elem.th + 90), 
					_p_elem.y + lengthdir_y(_check_width, _p_elem.th + 90), 
					_p_elem.x_end + lengthdir_x(_check_width, _p_elem.th + 90), 
					_p_elem.y_end + lengthdir_y(_check_width, _p_elem.th + 90), 
					_obstr_objects[j], false, true))) // check left line
					return false
				if (instance_exists(collision_line(
					_p_elem.x + lengthdir_x(_check_width, _p_elem.th - 90), 
					_p_elem.y + lengthdir_y(_check_width, _p_elem.th - 90), 
					_p_elem.x_end + lengthdir_x(_check_width, _p_elem.th - 90), 
					_p_elem.y_end + lengthdir_y(_check_width, _p_elem.th - 90), 
					_obstr_objects[j], false, true))) // check right line
					return false
			}
			
		} else { // arc path element
			
			with (_p_elem) {
			for (var j = 0; j < array_length(_obstr_objects); j ++) {
				var _precision = 20 // precision in degrees of arc drawing
				var _d_start = 0 // start of line segment
				var _d_end = gear * steering * _precision // end of line segment
				var _last_iter = false
				while (true) {
					if (abs(_d_end) > l) {
						_d_end = gear * steering * l // cap at length
						_last_iter = true
					}
					
					if (instance_exists(collision_line(
						center_x + lengthdir_x(r, th - steering * 90 + _d_start),
						center_y + lengthdir_y(r, th - steering * 90 + _d_start),
						center_x + lengthdir_x(r, th - steering * 90 + _d_end),
						center_y + lengthdir_y(r, th - steering * 90 + _d_end), _obstr_objects[j], false, true))) // check center line
						return false
						
					if (instance_exists(collision_line(
						center_x + lengthdir_x(r + _check_width, th - steering * 90 + _d_start), // draw from center
						center_y + lengthdir_y(r + _check_width, th - steering * 90 + _d_start),
						center_x + lengthdir_x(r + _check_width, th - steering * 90 + _d_end),
						center_y + lengthdir_y(r + _check_width, th - steering * 90 + _d_end), _obstr_objects[j], false, true))) // check outer line
						return false
						
					if (instance_exists(collision_line(
						center_x + lengthdir_x(r - _check_width, th - steering * 90 + _d_start), // draw from center
						center_y + lengthdir_y(r - _check_width, th - steering * 90 + _d_start),
						center_x + lengthdir_x(r - _check_width, th - steering * 90 + _d_end),
						center_y + lengthdir_y(r - _check_width, th - steering * 90 + _d_end), _obstr_objects[j], false, true))) // check inner line
						return false
		
					if (_last_iter)
						break
			
					_d_start += gear * steering * _precision
					_d_end += gear * steering * _precision
		
				}	
			}}
			
		}
	}
	return true
}

// Initialize A* river based on path
function astr_init(_path) {
	astriver = ds_map_create()
	ds_list_clear(astriver_rows) // clear tracking lists of which rows and cols are used
	ds_list_clear(astriver_cols)
	astriver_build_i = 0 // reset building index
	
	var _length = path_get_length(_path)
	var _th = 0 // angle of current path cell
	for (var i = 0; i < path_get_number(_path); i++) { // loop through path points
		var _pt_x = path_get_point_x(_path, i) // path point location
		var _pt_y = path_get_point_y(_path, i)
		var _cell_x = floor(_pt_x / holpath_cell_size) // find x and y index in grid of cell
		var _cell_y = floor(_pt_y / holpath_cell_size)
		
		// Compute cost
		var _cost = _length - i * holpath_cell_size // cost of cell (this breaks if I change path to allow diagonals in future, since I assume distance increases cell size with each path point)
		
		// Compute theta angle
		if (i < path_get_number(_path)-1) {
			var _pt_next_x = path_get_point_x(_path, i+1)
			var _pt_next_y = path_get_point_y(_path, i+1)
			var _cell_next_x = floor(_pt_next_x / holpath_cell_size)
			var _cell_next_y = floor(_pt_next_y / holpath_cell_size)
			_th = point_direction(_pt_x, _pt_y, _pt_next_x, _pt_next_y) // direction to next pt (from current pt)
		} // otherwise, for last path cell old _th value is used
		
		// Add to A* river 2D dynamic map
		if (!ds_map_exists(astriver, _cell_y)) { // check if row exists in 2D A* river map
			astriver[?_cell_y] = ds_map_create() // if not, create map
			ds_list_add(astriver_rows, _cell_y) // keep track that this row is being used
		}
		
		astriver[?_cell_y][?_cell_x] = _th // theta angle in this cell
		ds_list_add(astriver_cols, _cell_x) // keep track that this column is being used
	}
}

// Reset A* river
function astr_reset() {
	if (astriver != undefined) {
		for (var i = 0; i < ds_list_size(astriver_rows); i ++) { // destroy row maps in dynamic A* river 2D map
			var _row = astriver_rows[|i]
			ds_map_destroy(astriver[?_row])
		}
		ds_map_destroy(astriver)
		astriver = undefined
	}
}

// Reset RRT* tree
function rrt_reset() {
	for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
		var _branch = rrt_branches[|i]
		_branch.destroy()
		delete _branch
	}
	ds_list_clear(rrt_branches)
}

// Reset path
function reset_path() {
	if (holpath != undefined)
		path_delete(holpath)
	holpath = undefined
	rs_path = undefined // reset RS path also
	astr_reset()
	rrt_reset()
}

// Create holonomic path to target
function create_holonomic_path(_target_x, _target_y) {
	var body = player.body
	
	reset_path()
	
	holpath = path_add()
	holpath_point = 0			// reset path point counter
	if (!mp_grid_path(grid, holpath, body.get_x(), body.get_y(), _target_x, _target_y, true)) { // try making path
		path_delete(holpath) // if not succesful
		holpath = undefined
	} else { // if succesful
		astr_init(holpath) // initialize A* river
	}
	
}

// Choose shortest out of 2 paths: a path for walking to the target,
// and a path to a vantage point from which target can be shot
function shoot_path(_target_x, _target_y) {
	var body = player.body
	
	// Try making a walk path to target
	create_holonomic_path(_target_x, _target_y)
	var walk_path_length = holpath != undefined ? path_get_length(holpath) : infinity
		
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
					holpath = shoot_path // set new path
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
		if (shoot_path != holpath) // shoot_path was not chosen, delete it
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