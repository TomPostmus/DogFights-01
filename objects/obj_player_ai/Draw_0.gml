// Check if in debug draw mode
if (!global.debug)
	exit

for (var _pi = 0; _pi < ds_list_size(obj_lobby.players_active); _pi ++) { // only draw if AI is active player and we are currently drawing to its viewport
if (obj_lobby.players_active[|_pi] == id && view_current == _pi) { 

	// Draw APF exploration grid
	for (var i = 0; i < ds_grid_width(apf_explgrid); i ++) {
		for (var j = 0; j < ds_grid_height(apf_explgrid); j ++) {
			var _candy = apf_explgrid[# i, j]
		
			if (_candy) {
				var _cell_x = i * apf_explgrid_cell_size
				var _cell_y = j * apf_explgrid_cell_size
			
				draw_set_alpha(0.2)
				draw_set_colour(c_fuchsia)
				draw_circle(_cell_x, _cell_y, 3, false)
	
				draw_set_alpha(1)
			}
		}
	}
		
	// Draw A* Grid layer
	for (var i = 0; i < ds_list_size(agrid_list); i ++) {
		var _cell = agrid_list[|i]
	
		var _cell_x = _cell.i * agrid_cell_size
		var _cell_y = _cell.j * agrid_cell_size
	
		draw_set_alpha(0.2)
		draw_set_colour(
			ds_list_find_index(agrid_path, _cell) != -1 ? c_lime 
			: (_cell.open ? c_red : c_blue))
	
		draw_rectangle(_cell_x, _cell_y, _cell_x + agrid_cell_size, _cell_y + agrid_cell_size, false)
	
		draw_set_alpha(1)
	}
	
}}