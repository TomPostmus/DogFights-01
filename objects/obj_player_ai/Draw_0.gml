for (var _pi = 0; _pi < ds_list_size(obj_lobby.players_active); _pi ++) { // only draw if AI is active player and we are currently drawing to its viewport
if (obj_lobby.players_active[|_pi] == id && view_current == _pi) {
		
	if (debug_draw_mode == 1) {
	
		// Draw RRT Grid layer
		layer_agrid.draw(true)
		layer_rrt.draw()
	
	} else if (debug_draw_mode == 2) {
		
		// Draw A* Grid layer
		layer_agrid.draw()
	
	} else if (debug_draw_mode == 3) {
		
		// Draw both
		layer_agrid.draw()
		layer_rrt.draw()
	
	}
	

	// Draw APF exploration grid
	for (var i = 0; i < ds_grid_width(apf_explgrid); i ++) {
		for (var j = 0; j < ds_grid_height(apf_explgrid); j ++) {
			var _candy = apf_explgrid[# i, j]
		
			if (_candy > 0) {
				var _cell_x = (i + 0.5) * apf_explgrid_cell_size
				var _cell_y = (j + 0.5) * apf_explgrid_cell_size
			
				draw_set_alpha(_candy)
				draw_set_colour(c_fuchsia)
				draw_circle(_cell_x, _cell_y, 3, false)
	
				draw_set_alpha(1)
			}
		}
	}
	
}}