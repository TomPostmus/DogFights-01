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
		apf_costf = function(_x, _y) {
			var _cost = 0

			_cost += apf_social_costf(_x, _y)
	
			if (state == "explore")
				_cost += apf_explgrid_costf(_x, _y)

			return _cost
		} 
		
	}