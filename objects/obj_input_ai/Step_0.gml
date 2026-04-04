event_inherited()

turn_input = 0
move_input = 0
input_attack = false

// Basic behaviour
if (instance_exists(player) && instance_exists(player.body)) {
	var body = player.body
	var camera = player.camera
	var weapon = player.weapon
		
	//Find targets
	ds_list_clear(targets)
	for (var i = 0; i < instance_number(obj_player); i ++) {
		var target_player = instance_find(obj_player, i);
		if (target_player != player && instance_exists(target_player.body)
			&& (player.team_id == undefined || player.team_id != target_player.team_id)) {
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
	//if (path != undefined) {
	//	var path_point_distance = point_distance(body.get_x(), body.get_y(), path_get_point_x(path, path_point), path_get_point_y(path, path_point));
	//	var path_point_direction = point_direction(body.get_x(), body.get_y(), path_get_point_x(path, path_point), path_get_point_y(path, path_point));
		
	//	// Give input to move to path point
	//	turn_input = input_dir(path_point_direction);
	//	if (abs(angle_difference(path_point_direction, body.get_rotation())) > 55) {
	//		move_input = -1
	//	} else move_input = 1
		
	//	// Move path point counter, for smooth and robust traversal of path
	//	var path_point_line_free = line_movable(path_get_point_x(path, path_point), path_get_point_y(path, path_point))
	//	if (path_point_line_free && path_point_distance < 75) { // check next point
	//		var next_point_line_free = line_movable(path_get_point_x(path, path_point+1), path_get_point_y(path, path_point+1))
	//		if (next_point_line_free) {	
	//			path_point ++
	//		}
	//	} else { // unreachable point, move back counter
	//		path_point --
	//	}
	//	path_point = min(path_point, path_get_number(path) - 1)
		
	//	if (path_point < 0 || // if initial point unreachable, destroy path
	//		(path_point_distance < 30 && path_point >= path_get_number(path)-1)) { // end of path reached
	//		path_delete(path)
	//		path = undefined
	//	}		
	//}
}
