if (global.ingame() && instance_exists(character) && instance_exists(character.body)) {
	var _body = character.body
	var _weapon = character.weapon
	
	var _body_x = _body.get_x()
	var _body_y = _body.get_y()
	var _body_rot = _body.get_rotation()
	
	// Vision
	{
		
		var _camera_x = camera.x
		var _camera_y = camera.y
		var _camera_w = camera.get_width()
		var _camera_h = camera.get_height()
	
		// Spot enemies
		ds_list_clear(apf_enemies) // reset/clear list
		with (obj_character) {
			
			if (self != other.character && instance_exists(body) && instance_exists(body.trunk)
				&& (other.character.team_id == undefined || other.character.team_id != team_id)
				&& !hp_protection) {						
				if (point_in_rectangle(body.trunk.x, body.trunk.y, 
					_camera_x - _camera_w/2, _camera_y - _camera_h/2,
					_camera_x + _camera_w/2, _camera_y + _camera_h/2)) {
					ds_list_add(other.apf_enemies, body.trunk) // add trunk (being the target object) to enemy list
				}
			}
			
		}
		
		// Spot landmarks
		//ds_list_clear(expl_landmarks_insight)
		//with (obj_ai_exploration_landmark) {
		
		//	if (point_in_rectangle(x, y, 
		//		_camera_x - _camera_w/2, _camera_y - _camera_h/2,
		//		_camera_x + _camera_w/2, _camera_y + _camera_h/2)) {
				
		//		ds_list_add(other.expl_landmarks_insight, self) // add to in-sight landmarks
				
		//		if (ds_list_find_index(other.expl_landmarks, self) == -1) { // add to list of all spotted landmarks
		//			ds_list_add(other.expl_landmarks, self)
		//			other.expl_landmarks_novelty[? self] = 1 // set novelty to 1 by default
		//		}
			
			
		//	}
		
		//}
		
		// TODO: Spot packages/pickups
		
	}
	
	// Set state based on whether enenmies have been seen
	state = ds_list_size(apf_enemies) > 0 ? "conflict" : "explore"
	
	// Update exploration layer
	if (state == "explore") {
		
		//for (var i = 0; i < ds_list_size(expl_landmarks); i ++) {
			
		//	var _landmark = expl_landmarks[|i]
			
		//	var _insight = ds_list_find_index(expl_landmarks_insight, _landmark) != -1 // whether landmark is in sight
		//	if (_insight) {
		//		var _dist = point_distance(_body_x, _body_y, _landmark.x, _landmark.y)
		//		expl_landmarks_novelty[? _landmark] -= (max(0, 300 - _dist) / 300) * 0.01
		//	} else {
		//		expl_landmarks_novelty[? _landmark] += 0.001 // out of sight, slowly becomes interesting again
		//	}
			
		//	expl_landmarks_novelty[? _landmark] = clamp(expl_landmarks_novelty[? _landmark], 0, 1) // keep in range
		
		//}
		
		// update exploration grid based on A* grid discovery
		var _acell_size = layer_agrid.agrid_cell_size
		for (var i = 0; i < ds_list_size(layer_agrid.agrid_list); i ++) {
		
			var _acell = layer_agrid.agrid_list[|i]
			var _expl_cell_i = floor(_acell.i * _acell_size / expl_grid_cell_size)
			var _expl_cell_j = floor(_acell.j * _acell_size / expl_grid_cell_size)
			
			if (_expl_cell_i >= 0 && _expl_cell_i < ds_grid_width(expl_grid)
				&& _expl_cell_j >= 0 && _expl_cell_j < ds_grid_height(expl_grid)) {
					
				if (expl_grid[# _expl_cell_i, _expl_cell_j] != -1) // if plays part in exploration
					expl_grid[# _expl_cell_i, _expl_cell_j] -= 0.01 // lower cell
					
			}
		
		}
		
		for (var i = 0; i < ds_grid_width(expl_grid); i ++) {
			for (var j = 0; j < ds_grid_height(expl_grid); j ++) { // for each cell
				if (expl_grid[# i, j] != -1) {
					expl_grid[# i, j] += 0.0005 // heighten cell
					expl_grid[# i, j] = clamp(expl_grid[# i, j], 0, 1)
				}
			}
		}
		
	}
	
	// Send inputs to lower level layer and get outputs
	layer_agrid.body_x = _body_x // send body 2D (x,y) position to A* Grid
	layer_agrid.body_y = _body_y
	layer_agrid.cost_field = apf_cost_field_2d // send 2D cost field from APF layer to A* Grid
	
	layer_rrt.body_x = _body_x // send body 3D (x,y,th) position to RRT
	layer_rrt.body_y = _body_y
	layer_rrt.body_th = _body_rot
	layer_rrt.cost_field = layer_agrid.cost_field_rrt // pass through cost field computed in A* Grid layer to RRT layer
	
	move_input = layer_rrt.move_input // extract move outputs from RRT layer
	turn_input = layer_rrt.turn_input
	
	// Send inputs to character
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