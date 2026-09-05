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