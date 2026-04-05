event_inherited()

last_seen_target_x = 0		// position where target is and was last seen if no longer in-sight
last_seen_target_y = 0
targets = ds_list_create()	// list of bodies that are potential targets
target = noone				// current target (body object)
scope_w = 640
scope_h = 320
path = undefined
path_point = 0
trigger_timer = 0			// timer that turns input_attack true on zero

state = "explore"

// Decision tree
dtree_timer = 0				// timer to call decision tree update
dtree_update_time = 60		// number of steps between each dtree update
conflict = false			// whether there are enemies to conflict with
fight_or_flight = ""		// when conflict, whether to fight, flight or await
path_recompute_timer = 0	// timer to recompute path when dealing with dynamic goal
path_recompute_time = 20	// number of steps between each path recompute

// Reeds Shepp path planning
rs_min_r = 30 // minimum turning radius for RS
rs_path = undefined // current RS path we're walking
rs_start = undefined // start pose for RS path
rs_target = undefined // target pose for RS path

// Draw arc for RS path from start point _x, _y, returns end point
// Draws line segments with a certain precision for an arc starting at _start_ang (direction in line direction)
// with an arc length l (in radians) radius _r. _steering determines if its a left (1) or right (-1) steering arc
// _gear determines if it is going forwards or backwards
function draw_arc(_x, _y, _start_ang, _l, _r, _steering, _gear) {
	
	var _precision = 2 // precision in degrees of arc drawing
	_l = radtodeg(_l) // convert to degrees
	
	var _d_start = 0 // start of line segment
	var _d_end = _gear * _steering * _precision // end of line segment
	var _last_iter = false
	while (true) {
		if (abs(_d_end) > _l) {
			_d_end = _gear * _steering * _l // cap at length
			_last_iter = true
		}
		
		draw_line( // draw line segment
			_center_x + lengthdir_x(_r, _start_ang - _steering * 90 + _d_start),
			_center_y + lengthdir_y(_r, _start_ang - _steering * 90 + _d_start),
			_center_x + lengthdir_x(_r, _start_ang - _steering * 90 + _d_end),
			_center_y + lengthdir_y(_r, _start_ang - _steering * 90 + _d_end)
		)
		
		if (_last_iter)
			break
			
		_d_start += _gear * _steering * _precision
		_d_end += _gear * _steering * _precision
		
	}
	
	// return end point
	return [
			_center_x + lengthdir_x(_r, _start_ang - _steering * 90 + _d_end),
			_center_y + lengthdir_y(_r, _start_ang - _steering * 90 + _d_end)
	]
}

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
grid = generate_mp_grid(16)
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

// Reset path
function reset_path() {
	if (path != undefined)
		path_delete(path)
	path = undefined
}

// Create walk path
function walk_path(_target_x, _target_y) {
	var body = player.body
	
	reset_path()
	
	path = path_add()
	path_point = 0			// reset path point counter
	if (!mp_grid_path(grid, path, body.get_x(), body.get_y(), _target_x, _target_y, false)) { // try making path
		path_delete(path)
		path = undefined
	}
}

// Choose shortest out of 2 paths: a path for walking to the target,
// and a path to a vantage point from which target can be shot
function shoot_path(_target_x, _target_y) {
	var body = player.body
	
	// Try making a walk path to target
	walk_path(_target_x, _target_y)
	var walk_path_length = path != undefined ? path_get_length(path) : infinity
		
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
					path = shoot_path // set new path
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
		if (shoot_path != path) // shoot_path was not chosen, delete it
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