if (!global.debug)
	exit

// Draw target and state
if (instance_exists(character) && instance_exists(character.body)) {
	var xp = character.body.get_x()
	var yp = character.body.get_y()

//	if (instance_exists(target)) {
//		draw_set_colour(c_red)
//		draw_line(xp, yp, target.get_x(), target.get_y())
//	}
	
	draw_text(xp, yp + 20, "Exp: " + string(rrt_exp))
	//draw_text(xp, yp + 40, "FoF: " + fight_or_flight)
	//draw_text(xp, yp + 40, $"move_input: {move_input}")
	
	// Draw RRT* tree
	draw_set_colour(c_blue)
	for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
		var _branch = rrt_branches[|i]
		_branch.draw()	
	}
	
	// Draw path towards destination branch in green
	if (rrt_dest != undefined) {
		var _branch = rrt_dest
		
		while (_branch != undefined) { // backtrack and draw in green
			_branch.draw(c_lime)
			_branch = _branch.parent
		}
	}
	
	// Draw cost every N iterations
	draw_set_colour(c_lime)
	draw_set_font(ft_small)
	for (var i = 0; i < ds_list_size(rrt_branches); i += 20) {
		var _branch = rrt_branches[|i]
		draw_text(_branch.x, _branch.y, _branch.thickness)
	}
	
	draw_set_colour(c_red)
	for (var i = 0; i < ds_list_size(rrt_branches_open); i ++) {
		var _branch = rrt_branches_open[|i]
		draw_circle(_branch.x_end, _branch.y_end, 1, false) // draw red circles at end points of open branches
	}
	
	// Draw APF source drops
	//for (var i = 0; i < ds_list_size(apf_sources); i ++) {
	//	var _source = apf_sources[|i]
		
	//	draw_set_font(ft_normal)
	//	draw_set_colour(_source.rep_type ? c_red : c_aqua)
	//	draw_text(_source.x, _source.y, _source.rep_type ? "R" : "A")
	//	draw_circle(_source.x, _source.y, _source.radius, true)
	//}

}

// Draw A* path
if (astpath != undefined && path_exists(astpath)) {
	draw_set_colour(c_purple)
	draw_path(astpath, 0, 0, true)
	draw_set_colour(c_red)
	var _path_pt_x = path_get_point_x(astpath, astpath_point)
	var _path_pt_y = path_get_point_y(astpath, astpath_point)
	draw_circle(_path_pt_x, _path_pt_y, 1, false)
	draw_set_colour(c_green)
	var _path_pt_x = path_get_point_x(astpath, astpath_furthvis_point)
	var _path_pt_y = path_get_point_y(astpath, astpath_furthvis_point)
	draw_circle(_path_pt_x, _path_pt_y, 1, false)
	
	//for (var i = 0; i < path_get_number(astpath); i ++) {
	//	var _path_pt_x = path_get_point_x(astpath, i)
	//	var _path_pt_y = path_get_point_y(astpath, i)
		
	//	draw_text(_path_pt_x, _path_pt_y, astpath_costs[|i])
	//}
	
	//draw_set_colour(c_green)
	//draw_line(xp, yp, path_get_point_x(path, path_point), path_get_point_y(path, path_point))
}

// Draw collision slider
with (colslider) draw_self()

for (var i = 0; i < ds_list_size(obj_lobby.players_active); i ++) {
	if (obj_lobby.players_active[|i] == id && view_current == i) { // check if is active player and drawing in its viewport
		if (instance_exists(camera)) {
			
			// Draw AI topology in camera
			//var _cell_size = obj_ai_topology.cell_size
			//var _n_cells_w = camera.get_width() / _cell_size // number of cells in width and height direction to draw
			//var _n_cells_h = camera.get_height() / _cell_size
			
			//for (var _c_i = 0; _c_i < _n_cells_w; _c_i ++) {
			//	for (var _c_j = 0; _c_j < _n_cells_h; _c_j ++) {
			//		var _cell_abs_i = floor(camera.x / _cell_size) + _c_i - floor(_n_cells_w / 2) // indices of cells in world cell grid
			//		var _cell_abs_j = floor(camera.y / _cell_size) + _c_j - floor(_n_cells_h / 2)
			//		var _cell_x = _cell_abs_i* _cell_size // absolute loc of cell x, y
			//		var _cell_y = _cell_abs_j * _cell_size
					
			//		// Draw dist transform
			//		if (_cell_abs_i >= 0 && _cell_abs_i < ds_grid_width(obj_ai_topology.dist_transform)
			//			&& _cell_abs_j >= 0 && _cell_abs_j < ds_grid_height(obj_ai_topology.dist_transform)) {
						
			//			var _orientation = obj_ai_topology.orientations[# _cell_abs_i, _cell_abs_j]
			//			var _strength = obj_ai_topology.strengths[# _cell_abs_i, _cell_abs_j]
			//			if (_strength > 0) {
						
			//				var _l = 6 * _strength
						
			//				draw_set_colour(c_blue)
			//				draw_line(
			//					_cell_x + _cell_size/2 + lengthdir_x(-_l, _orientation), 
			//					_cell_y + _cell_size/2 + lengthdir_y(-_l, _orientation),
			//					_cell_x + _cell_size/2 + lengthdir_x(_l, _orientation), 
			//					_cell_y + _cell_size/2 + lengthdir_y(_l, _orientation)
			//				)
			//			}				
			//		}
			//	}			
			//}
			
			// Draw APF in camera
			_cell_size = 32
			_n_cells_w = camera.get_width() / _cell_size // number of cells in width and height direction to draw
			_n_cells_h = camera.get_height() / _cell_size
			
			var _r = 4
			for (var _c_i = 0; _c_i < _n_cells_w; _c_i ++) {
				for (var _c_j = 0; _c_j < _n_cells_h; _c_j ++) {
					var _cell_abs_i = floor(camera.x / _cell_size) + _c_i - floor(_n_cells_w / 2) // indices of cells in world cell grid
					var _cell_abs_j = floor(camera.y / _cell_size) + _c_j - floor(_n_cells_h / 2)
					var _cell_x = _cell_abs_i* _cell_size // absolute loc of cell x, y
					var _cell_y = _cell_abs_j * _cell_size
					
					var _field_vars = rrt_field(_cell_x, _cell_y, 0)
					var _mani_z = _field_vars[0]
					//var _mani_tang_x = _field_vars[1]
					//var _mani_tang_y = _field_vars[2]
					//var _mani_slope = _field_vars[3]
					
					var _max_z = 600
					var _mani_z_norm = clamp(_mani_z, -_max_z, _max_z) / _max_z // normalised to -1 to 1
					var _grad_color = make_colour_rgb(_mani_z_norm * 127 + 128, -_mani_z_norm * 127 + 128, -_mani_z_norm * 127 + 128) // gradient color between c_aqua and c_red
					
					draw_set_colour(_grad_color)
					draw_line(_cell_x - _r, _cell_y, _cell_x + _r, _cell_y) // draw cross with radius _r
					draw_line(_cell_x, _cell_y - _r, _cell_x, _cell_y + _r)
				}			
			}
		}
	}
}