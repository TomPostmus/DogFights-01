event_inherited()

turn_input = 0
move_input = 0
attack_input = false

// Function to check whether line to target is obstructed (by walls)
function line_obstructed(_target_x, _target_y) {
	var objects = tag_get_asset_ids("AIObstruction", asset_object)
	for (var i = 0; i < array_length(objects); i ++) {
		if (instance_exists(collision_line(dog.x, dog.y, _target_x, _target_y, objects[i], false, true)))
			return true
	}
	return false
}

// Function that returns turn input, given a target direction
function input_dir(_dir, _dead_angle) {
	var angle_diff = angle_difference(dog.rotation, _dir)
	if (angle_diff < -_dead_angle) return 1
	if (angle_diff > _dead_angle) return -1
	return 0
}

// Basic behaviour
if (instance_exists(dog)) {
	//Find targets
	ds_list_clear(targets)
	if (instance_exists(camera)) {
		for (var i = 0; i < instance_number(obj_player); i ++) {
			var player = instance_find(obj_player, i);
			if (player != id && instance_exists(player.dog)) {
				if (point_in_rectangle(player.dog.x, player.dog.y, camera.x - camera.get_width()/2, camera.y - camera.get_height()/2, camera.x + camera.get_width()/2, camera.y + camera.get_height()/2))
					ds_list_add(targets, player.dog)
			}
		}
	}
	
	//Find closest target
	target = noone
	var dist = infinity;
	for (var i = 0; i < ds_list_size(targets); i ++) {
		if (point_distance(dog.x, dog.y, targets[|i].x, targets[|i].y) < dist) {
			target = targets[|i];
			dist = point_distance(dog.x, dog.y, targets[|i].x, targets[|i].y)
		}
	}
	
	//Choose state
	var new_state = instance_exists(target) ? "attack" : "explore"
	if (new_state != state) {
		if (path != undefined)
			path_delete(path)
		path = undefined
		state = new_state
	}
	
	//Exploration state
	if (state == "explore") {
		if (path == undefined && irandom(100) == 0) {
			if (instance_number(obj_ai_path_point) > 0) {
				var path_point_marker = instance_find(obj_ai_path_point, irandom(instance_number(obj_ai_path_point)-1));
				path = path_add()
				path_point = 0
				if (!mp_grid_path(grid, path, dog.x, dog.y, path_point_marker.x, path_point_marker.y, false)) {
					path_delete(path)
					path = undefined
				}
				path_point = 0
			} else {
				path = path_add()
				path_point = 0
				if (!mp_grid_path(grid, path, dog.x, dog.y, random(room_width), random(room_height).y, false)) {
					path_delete(path)
					path = undefined
				}
			}
			path_point = 0
		}
	} else if (state == "attack") {
		last_seen_target_x = target.x
		last_seen_target_y = target.y
		var line_free = !line_obstructed(target.x, target.y)
		if (!line_free) {
			if (path == undefined) {
				path = path_add()
				path_point = 0
				if (!mp_grid_path(grid, path, dog.x, dog.y, target.x, target.y, false)) {
					path_delete(path)
					path = undefined
				}
			}
		} else {
			if (path != undefined && path_exists(path)) path_delete(path)
			path = undefined
			var distance = point_distance(dog.x, dog.y, target.x, target.y);
			if (distance > 80) move_input = 1
			turn_input = input_dir(point_direction(dog.x, dog.y, target.x, target.y), 10);
			if (abs(angle_difference(point_direction(dog.x, dog.y, target.x, target.y), dog.rotation)) < 20) {
				attack_input = irandom(40) == 0
			}
		}
	}
	
	//Walk along path
	if (path != undefined) {
		var path_point_distance = point_distance(dog.x, dog.y, path_get_point_x(path, path_point), path_get_point_y(path, path_point));
		var path_point_direction = point_direction(dog.x, dog.y, path_get_point_x(path, path_point), path_get_point_y(path, path_point));
		turn_input = input_dir(path_point_direction, 10);
		if (abs(angle_difference(path_point_direction, dog.rotation)) > 55) {
			move_input = -1
		} else move_input = 1
		var next_point_line_free = !line_obstructed(path_get_point_x(path, path_point+1), path_get_point_y(path, path_point+1))
		while (next_point_line_free && path_point_distance < 100) {
			path_point ++
			if (path_point >= path_get_number(path)-1) break
			path_point_distance = point_distance(dog.x, dog.y, path_get_point_x(path, path_point), path_get_point_y(path, path_point));
			next_point_line_free = !line_obstructed(path_get_point_x(path, path_point+1), path_get_point_y(path, path_point+1))
		}
		if (path_point_distance < 30 && path_point >= path_get_number(path)-1) {
			path_delete(path)
			path = undefined
		}
	}
}

// Movement
if (instance_exists(dog)) {
	dog.move_input = move_input
	dog.turn_input = turn_input
}

if (instance_exists(input_weapon)) {
	//input_weapon.input_reload = get_key(KEY_RELOAD, KEYACTION_PRESS)
	input_weapon.input_attack = attack_input
	//input_weapon.input_attack2 = get_key(KEY_ATTACK2, KEYACTION_HOLD)
}