if (global.ingame() && instance_exists(character) && instance_exists(character.body)) {
	var _body = character.body
	var _weapon = character.weapon
	
	var _body_x = _body.get_x()
	var _body_y = _body.get_y()
	var _body_rot = _body.get_rotation()
	
	// Update APF layer
	{
		
		// update social layer with enemies
		var _camera_x = camera.x
		var _camera_y = camera.y
		var _camera_w = camera.get_width()
		var _camera_h = camera.get_height()
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
		
		// update exploration layer
		var _body_cell_i = ceil(_body_x / apf_explgrid_cell_size)
		var _body_cell_j = ceil(_body_y / apf_explgrid_cell_size)
	
		if (_body_cell_i >= 0 && _body_cell_i < ds_grid_width(apf_explgrid)
			&& _body_cell_j >= 0 && _body_cell_j < ds_grid_height(apf_explgrid)) {
	
			apf_explgrid[# _body_cell_i, _body_cell_j] = 0 // eat candy, set to zero
	
		}
		
		// (Dynamically) Define APF with cost function
		// The Artificial Potential Field (APF) is simply a map from a position (x, y) to a cost, or a height (z) value if you consider it as a 2-manifold (3D object)
		apf_cost_field_2d = function(_x, _y) {
			var _cost = 0

			_cost += apf_social_costf(_x, _y)
	
			if (state == "explore")
				_cost += apf_explgrid_costf(_x, _y)

			return _cost
		} 
		
	}
	
	// Send inputs to lower level layer and get outputs
	layer_agrid.body_x = _body_x // send body 2D (x,y) position to A* Grid
	layer_agrid.body_y = _body_y
	layer_agrid.cost_field = apf_cost_field_2d // send 2D cost field from APF layer to A* Grid
	
	layer_rrt.body_x = _body_x // send body 3D (x,y,th) position to RRT
	layer_rrt.body_y = _body_y
	layer_rrt.body_th = _body_rot
	layer_rrt.cost_field = function(_x, _y, _th) {return random(100)} // set cost field as random field for now
	
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