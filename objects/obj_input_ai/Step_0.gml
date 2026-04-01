event_inherited()


turn_input = 0
move_input = 0
input_attack = false

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

// Basic behaviour
if (instance_exists(player) && instance_exists(player.body)) {
	var body = player.body
	var camera = player.camera
	var weapon = player.weapon
		
	//Find targets
	ds_list_clear(targets)
	for (var i = 0; i < instance_number(obj_player); i ++) {
		var target_player = instance_find(obj_player, i);
		if (target_player != player && instance_exists(target_player.body)) {
			if (point_in_rectangle(target_player.body.get_x(), target_player.body.get_y(), camera.x - camera.get_width()/2, camera.y - camera.get_height()/2, camera.x + camera.get_width()/2, camera.y + camera.get_height()/2))
				ds_list_add(targets, target_player.body)
		}
	}
	
	//Find closest target
	self.target = noone
	var dist = infinity;
	for (var i = 0; i < ds_list_size(targets); i ++) {
		if (point_distance(body.get_x(), body.get_y(), targets[|i].get_x(), targets[|i].get_y()) < dist) {
			self.target = targets[|i];
			dist = point_distance(body.get_x(), body.get_y(), targets[|i].get_x(), targets[|i].get_y())
		}
	}
	
	//Choose state
	//var new_state = instance_exists(target) ? "attack" : "explore"
	//if (new_state != state) {
	//	if (path != undefined)
	//		path_delete(path)
	//	path = undefined
	//	state = new_state
	//}
	
	
	// Update decision tree
	dtree_timer --
	if (dtree_timer <= 0) {
		update_decision_tree()
		dtree_timer = dtree_update_time
	}
	
	// Execute decision tree state
	if (!conflict) { // explore state
		if (path == undefined && irandom(100) == 0) {
			if (instance_number(obj_ai_path_point) > 0) {
				var path_point_marker = instance_find(obj_ai_path_point, irandom(instance_number(obj_ai_path_point)-1));
				walk_path(path_point_marker.x, path_point_marker.y)
			} else {
				walk_path(random(room_width), random(room_width))
			}
		}
	} else if (conflict && instance_exists(target)) { // conflict state
		var target_x = target.get_x()
		var target_y = target.get_y()
		var target_distance = point_distance(body.get_x(), body.get_y(), target_x, target_y)
		var line_of_fire = line_shootable(target_x, target_y)
		var shoot = false
		
		if (fight_or_flight == "fight") {
			if (line_of_fire) {
				shoot = true
				reset_path()
				
				// Get closer
				if (target_distance > 100) {
					move_input = 1
				}
			} else {
				path_recompute_timer --
				if (path_recompute_timer <= 0) {
					shoot_path(target_x, target_y)
					path_recompute_timer = path_recompute_time
				}
			}
		} else if (fight_or_flight == "flight") {
			
		} else if (fight_or_flight == "await") {
			reset_path()
			if (line_of_fire) {
				shoot = true
			}
		}
		
		if (shoot) {
			var barrel_x = weapon.get_weapon_barrel_x(body)
			var barrel_y = weapon.get_weapon_barrel_y(body)
			var desired_weapon_dir = point_direction(barrel_x, barrel_y, target_x, target_y)
	
			// Align weapon rotation
			var dead_angle = 4
			var angle_diff = angle_difference(weapon.get_weapon_rotation(body), desired_weapon_dir)
			turn_input = (angle_diff < -dead_angle) - (angle_diff > dead_angle)
			
			if (abs(angle_diff) <= 10) {
				trigger_timer --
				if (trigger_timer <= 0) {
					input_attack = true
					trigger_timer = target_distance * 0.3
				}
			}
			
		}
	}
	
	//Exploration state
	//if (state == "explore") {
	//	if (path == undefined && irandom(100) == 0) {
	//		if (instance_number(obj_ai_path_point) > 0) {
	//			var path_point_marker = instance_find(obj_ai_path_point, irandom(instance_number(obj_ai_path_point)-1));
	//			path = path_add()
	//			path_point = 0
	//			if (!mp_grid_path(grid, path, body.get_x(), body.get_y(), path_point_marker.x, path_point_marker.y, false)) {
	//				path_delete(path)
	//				path = undefined
	//			}
	//		} else {
	//			path = path_add()
	//			path_point = 0
	//			if (!mp_grid_path(grid, path, body.get_x(), body.get_y(), random(room_width), random(room_height), false)) {
	//				path_delete(path)
	//				path = undefined
	//			}
	//		}
	//		path_point = 0
	//	}
	//} else if (state == "attack") {
	//	last_seen_target_x = target.get_x()
	//	last_seen_target_y = target.get_y()
	//	var line_free = line_movable(target.get_x(), target.get_y())
	//	if (!line_free) {
	//		if (path == undefined) {
	//			path = path_add()
	//			path_point = 0
	//			if (!mp_grid_path(grid, path, body.get_x(), body.get_y(), target.get_x(), target.get_y(), false)) {
	//				path_delete(path)
	//				path = undefined
	//			}
	//		}
	//	} else {
	//		if (path != undefined && path_exists(path)) path_delete(path)
	//		path = undefined
	//		var distance = point_distance(body.get_x(), body.get_y(), target.get_x(), target.get_y());
	//		if (distance > 80) move_input = 1
	//		turn_input = aim_weapon(target.get_x(), target.get_y());
	//		if (abs(angle_difference(point_direction(body.get_x(), body.get_y(), target.get_x(), target.get_y()), body.get_rotation())) < 20) {
	//			input_attack = irandom(40) == 0
	//		}
	//	}
	//}
	
	//Walk along path
	if (path != undefined) {
		var path_point_distance = point_distance(body.get_x(), body.get_y(), path_get_point_x(path, path_point), path_get_point_y(path, path_point));
		var path_point_direction = point_direction(body.get_x(), body.get_y(), path_get_point_x(path, path_point), path_get_point_y(path, path_point));
		
		// Give input to move to path point
		turn_input = input_dir(path_point_direction);
		if (abs(angle_difference(path_point_direction, body.get_rotation())) > 55) {
			move_input = -1
		} else move_input = 1
		
		// Move path point counter, for smooth and robust traversal of path
		var path_point_line_free = line_movable(path_get_point_x(path, path_point), path_get_point_y(path, path_point))
		if (path_point_line_free && path_point_distance < 75) { // check next point
			var next_point_line_free = line_movable(path_get_point_x(path, path_point+1), path_get_point_y(path, path_point+1))
			if (next_point_line_free) {	
				path_point ++
			}
		} else { // unreachable point, move back counter
			path_point --
		}
		path_point = min(path_point, path_get_number(path) - 1)
		
		if (path_point < 0 || // if initial point unreachable, destroy path
			(path_point_distance < 30 && path_point >= path_get_number(path)-1)) { // end of path reached
			path_delete(path)
			path = undefined
		}		
	}
}
