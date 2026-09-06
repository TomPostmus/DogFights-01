// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

		
	//	// update exploration grid based on A* grid discovery
	//	var _acell_size = layer_agrid.agrid_cell_size
	//	for (var i = 0; i < ds_list_size(layer_agrid.agrid_list); i ++) {
		
	//		var _acell = layer_agrid.agrid_list[|i]
	//		var _expl_cell_i = floor(_acell.i * _acell_size / expl_grid_cell_size)
	//		var _expl_cell_j = floor(_acell.j * _acell_size / expl_grid_cell_size)
			
	//		if (_expl_cell_i >= 0 && _expl_cell_i < ds_grid_width(expl_grid)
	//			&& _expl_cell_j >= 0 && _expl_cell_j < ds_grid_height(expl_grid)) {
					
	//			if (expl_grid[# _expl_cell_i, _expl_cell_j] != -1) // if plays part in exploration
	//				expl_grid[# _expl_cell_i, _expl_cell_j] -= 0.01 // lower cell
					
	//		}
		
	//	}
		
	//	for (var i = 0; i < ds_grid_width(expl_grid); i ++) {
	//		for (var j = 0; j < ds_grid_height(expl_grid); j ++) { // for each cell
	//			if (expl_grid[# i, j] != -1) {
	//				expl_grid[# i, j] += 0.0005 // heighten cell
	//				expl_grid[# i, j] = clamp(expl_grid[# i, j], 0, 1)
	//			}
	//		}
	//	}
		
		
		
	//	// Draw exploration grid
	//	for (var i = 0; i < ds_grid_width(expl_grid); i ++) {
	//		for (var j = 0; j < ds_grid_height(expl_grid); j ++) {
	//			var _value = expl_grid[# i, j]
		
	//			if (_value > 0) {
	//				var _cell_x = i* expl_grid_cell_size
	//				var _cell_y = j * expl_grid_cell_size
			
	//				draw_set_alpha(_value * 0.5)
	//				draw_set_colour(c_fuchsia)
	//				draw_rectangle(_cell_x, _cell_y, _cell_x + expl_grid_cell_size, _cell_y + expl_grid_cell_size, false)
	
	//				draw_set_alpha(1)
	//			}
	//		}
	//	}
		
		

	//// Initialize exploration grid
	//expl_grid = ds_grid_create(room_width/expl_grid_cell_size, room_height/expl_grid_cell_size)
	//for (var i = 0; i < ds_grid_width(expl_grid); i ++) {
	//	for (var j = 0; j < ds_grid_height(expl_grid); j ++) { // for each cell
			
	//		var _center_cx = (i + 0.5) * expl_grid_cell_size // x, y of cell center
	//		var _center_cy = (j + 0.5) * expl_grid_cell_size
			
	//		var _in_region = false // whether inside AI exploration region
	//		with (obj_ai_exploration_region) {
	//			if (collision_point(_center_cx, _center_cy, self, false, false)) { // if point meets region object
	//				_in_region = true
	//				break
	//			}
	//		}
			
	//		expl_grid[# i, j] = _in_region ? 1 : -1 // if is inside region, initialize to 1, cell stays in range of 0,1
	//			// if not inside any region, cell is initialized to -1 and does not play a part in the exploration grid
			
	//	}
	//}
	
	// APF layer (Artificial Potential Field, with Attraction and Repulsion sources)
//apf_explgrid_cell_size = 96
//apf_explgrid = undefined // exploration grid, initialized upon Room Start
//apf_explgrid_costf = function(_x, _y) { // cost function for exploration grid, mapping position to exploration cost
	
//	var _cost = 0
	
//	var _cell_i = floor(_x / apf_explgrid_cell_size) // indices of cells in ds grid
//	var _cell_j = floor(_y / apf_explgrid_cell_size)
	
//	if (_cell_i >= 0 && _cell_i < ds_grid_width(apf_explgrid)
//		&& _cell_j >= 0 && _cell_j < ds_grid_height(apf_explgrid)) {
//			var _candy = apf_explgrid[# _cell_i, _cell_j] // candy value of cell
			
//			if (_candy > 0) {
//				var _center_cx = (_cell_i + 0.5) * apf_explgrid_cell_size // x, y of cell center
//				var _center_cy = (_cell_j + 0.5) * apf_explgrid_cell_size
			
//				var _dist = point_distance(_x, _y, _center_cx, _center_cy) // distance to center
			
//				_cost = -100 * (1 - _dist / apf_explgrid_cell_size) // cost based on distance to center, scaled by 100
//			}
//	}
	
//	return _cost
	
//}