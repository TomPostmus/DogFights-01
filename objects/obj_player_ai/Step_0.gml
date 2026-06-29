event_inherited()

turn_input = 0 // reset controls
move_input = 0
input_attack = false

if (global.ingame()) {
		
	// Delete RTT branch if it is marked for deletion
	for (var i = 0; i < ds_list_size(rrt_branches); i ++) { // loop through all branches
		var _branch = rrt_branches[|i]
		
		if (_branch.del) {
			var j = ds_list_find_index(rrt_branches_open, _branch) // also find in open branches list
			if (j != -1)
				ds_list_delete(rrt_branches_open, j) // remove from open branches
		
			ds_list_destroy(_branch.links) // destroy its links data structure
			delete _branch // delete struct
			ds_list_delete(rrt_branches, i) // remove from list
			i --
		}
	}

	// Basic behaviour
	if (instance_exists(character) && instance_exists(character.body)) {
		var body = character.body
		var weapon = character.weapon
	
		var _body_x = body.get_x()
		var _body_y = body.get_y()
		var _body_rot = body.get_rotation()
		
		// Clear APF sources list
		ds_list_clear(apf_sources)
	
		// Spot enemies
		if (instance_exists(camera)) {
			//ds_list_clear(enemies)
			for (var i = 0; i < instance_number(obj_character); i ++) {
				var _character_insight = instance_find(obj_character, i);
				if (_character_insight != character && instance_exists(_character_insight.body)
					&& (character.team_id == undefined || character.team_id != _character_insight.team_id)
					&& !_character_insight.hp_protection) {
					if (point_in_rectangle(_character_insight.body.trunk.x, _character_insight.body.trunk.y, camera.x - camera.get_width()/2, camera.y - camera.get_height()/2, camera.x + camera.get_width()/2, camera.y + camera.get_height()/2)) {
						//ds_list_add(enemies, _character_insight)
						var _trunk = _character_insight.body.trunk
						ds_list_add(apf_sources, [_trunk.x, _trunk.y, 0, 300]) // add enemy with 200 repulsion radius, no attraction
					}
				}
			}
		}
	
		////Find closest target
		//target = noone
		//var dist = infinity;
		//for (var i = 0; i < ds_list_size(targets); i ++) {
		//	if (point_distance(body.get_x(), body.get_y(), targets[|i].get_x(), targets[|i].get_y()) < dist) {
		//		target = targets[|i];
		//		dist = point_distance(body.get_x(), body.get_y(), targets[|i].get_x(), targets[|i].get_y())
		//	}
		//}	
	
		// Update decision tree
		dtree_timer --
		if (dtree_timer <= 0) {
			//update_decision_tree()
			dtree_timer = dtree_update_time
		}
		
		// RRT* motion planning
		if (rrt_field != undefined) {
			if (rrt_branch = undefined) { // if there is no current node
			
				rrt_init(_body_x, _body_y, _body_rot) // initialize RRT
				rrt_walk_timer = rrt_walk_maxtime // reset timer
			
			} else {
			
				rrt_update(_body_x, _body_y, _body_rot) // update RRT
				rrt_walk(_body_x, _body_y, _body_rot) // walk current RRT branch
			
			}
		}
	
		// Execute decision tree state
		//if (!conflict) { // explore state
		//	if (astpath == undefined && irandom(100) == 0) {
		//		if (instance_number(obj_ai_path_point) > 0) {
		//			var path_point_marker = instance_find(obj_ai_path_point, irandom(instance_number(obj_ai_path_point)-1));
		//			astpath_targ_x = path_point_marker.x
		//			astpath_targ_y = path_point_marker.y
		//			astpath_compute()
		//		} else {
		//			astpath_targ_x = random(room_width)
		//			astpath_targ_y = random(room_height)
		//			astpath_compute()
		//		}
		//	}
		//} else if (conflict && instance_exists(target)) { // conflict state
		//	var target_x = target.get_x()
		//	var target_y = target.get_y()
		//	var target_distance = point_distance(body.get_x(), body.get_y(), target_x, target_y)
		//	var line_of_fire = line_shootable(target_x, target_y)
		//	var shoot = false
		
		//	if (fight_or_flight == "fight") {
		//		if (line_of_fire) {
		//			shoot = true
					
		//			if (astpath != undefined)
		//				path_delete(astpath)
		//			astpath = undefined
				
		//			// Get closer
		//			if (target_distance > 100) {
		//				move_input = 1
		//			}
		//		} else {
		//			path_recompute_timer --
		//			if (path_recompute_timer <= 0) {
		//				shoot_path(target_x, target_y)
		//				path_recompute_timer = path_recompute_time
		//			}
		//		}
		//	} else if (fight_or_flight == "flight") {
			
		//	} else if (fight_or_flight == "await") {
				
		//		if (astpath != undefined)
		//			path_delete(astpath)
		//		astpath = undefined
					
		//		if (line_of_fire) {
		//			shoot = true
		//		}
		//	}
		
		//	if (shoot) {
		//		var barrel_x = weapon.get_weapon_barrel_x(body)
		//		var barrel_y = weapon.get_weapon_barrel_y(body)
		//		var desired_weapon_dir = point_direction(barrel_x, barrel_y, target_x, target_y)
	
		//		// Align weapon rotation
		//		var dead_angle = 4
		//		var angle_diff = angle_difference(weapon.get_weapon_rotation(body), desired_weapon_dir)
		//		turn_input = (angle_diff < -dead_angle) - (angle_diff > dead_angle)
			
		//		if (abs(angle_diff) <= 10) {
		//			trigger_timer --
		//			if (trigger_timer <= 0) {
		//				input_attack = true
		//				trigger_timer = target_distance * 0.3
		//			}
		//		}
			
		//	}
		//}
	
		//if (astpath != undefined && path_exists(astpath)) {
		
		//	// Update current path point to nearest point to character in path
		//	var _next_pt = astpath_point + 1
		//	var _prev_pt = astpath_point - 1
		//	var _cur_pt_dist = point_distance(_body_x, _body_y, path_get_point_x(astpath, astpath_point), path_get_point_y(astpath, astpath_point))
		
		//	var _next_pt_dist = infinity
		//	if (astpath_point < path_get_number(astpath)) // if next point exists
		//		_next_pt_dist = point_distance(_body_x, _body_y, path_get_point_x(astpath, _next_pt), path_get_point_y(astpath, _next_pt)) // distance from next pt to character
			
		//	var _prev_pt_dist = infinity
		//	if (astpath_point > 0) // if previous point exists
		//		_prev_pt_dist = point_distance(_body_x, _body_y, path_get_point_x(astpath, _prev_pt), path_get_point_y(astpath, _prev_pt)) // distance from previous pt to character
			
		//	if (_next_pt_dist == min(_cur_pt_dist, _next_pt_dist, _prev_pt_dist)) // if next point has minimal distance
		//		astpath_point ++ // move to next pt
		//	else if (_prev_pt_dist < _cur_pt_dist) // else if prev point has minimal distance
		//		astpath_point -- // move to prev pt
			
		//	// Update furthest visible path point
		//	if (!line_movable(path_get_point_x(astpath, astpath_furthvis_point), path_get_point_y(astpath, astpath_furthvis_point))) // if current furthvis point not visible
		//		astpath_furthvis_point -- // go one less
		//	else if (astpath_furthvis_point < path_get_number(astpath)-1 && line_movable(path_get_point_x(astpath, astpath_furthvis_point+1), path_get_point_y(astpath, astpath_furthvis_point+1))) // if point after furthvis point is visible
		//		astpath_furthvis_point ++ // go one further
		
		//	astpath_furthvis_point = max(astpath_point, astpath_furthvis_point) // lower boundary is current path point
					
		//	// Check if A* path is completed
		//	var _path_end_x = path_get_point_x(astpath, path_get_number(astpath)-1)
		//	var _path_end_y = path_get_point_y(astpath, path_get_number(astpath)-1)
		//	var _dist = point_distance(body.get_x(), body.get_y(), _path_end_x, _path_end_y)
		//	var _astpath_completion_tolerance = 30
		//	if (_dist <= _astpath_completion_tolerance) {
			
		//		if (astpath != undefined)
		//			path_delete(astpath)
		//		astpath = undefined
			
		//	} else if (!line_movable(path_get_point_x(astpath, astpath_point), path_get_point_y(astpath, astpath_point))) { // if no free line to path point
			
		//		astpath_compute() // recompute A* path
			
		//	}
		//}
	}
	
	// Send inputs
	if (instance_exists(character)) {
	
		// Send to character
		character.interact = input_interact
	
		// Send to weapon
		if (instance_exists(character.weapon)) {
			character.weapon.trigger = input_attack
			character.weapon.aiming = input_attack2
			character.weapon.input_reload = input_reload
			character.weapon.input_firemode = input_firemode
		}

		// Send to movement controller
		character.movement.move_input = move_input
		character.movement.turn_input = turn_input

	}

}
