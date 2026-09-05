// Inherit the parent event
event_inherited();

if (global.ingame()) {
	
	// Initialize components
	vision = create_controllers(obj_ai_vision) // initialize vision
	layer_agrid = create_controllers(obj_ai_grid_planner) // initialize planning layers
	layer_rrt = create_controllers(obj_ai_motion_planner)

	// Initialize exploration grid
	expl_grid = ds_grid_create(room_width/expl_grid_cell_size, room_height/expl_grid_cell_size)
	for (var i = 0; i < ds_grid_width(expl_grid); i ++) {
		for (var j = 0; j < ds_grid_height(expl_grid); j ++) { // for each cell
			
			var _center_cx = (i + 0.5) * expl_grid_cell_size // x, y of cell center
			var _center_cy = (j + 0.5) * expl_grid_cell_size
			
			var _in_region = false // whether inside AI exploration region
			with (obj_ai_exploration_region) {
				if (collision_point(_center_cx, _center_cy, self, false, false)) { // if point meets region object
					_in_region = true
					break
				}
			}
			
			expl_grid[# i, j] = _in_region ? 1 : -1 // if is inside region, initialize to 1, cell stays in range of 0,1
				// if not inside any region, cell is initialized to -1 and does not play a part in the exploration grid
			
		}
	}
	
	//apf_explgrid = ds_grid_create(room_width/apf_explgrid_cell_size, room_height/apf_explgrid_cell_size)
	//for (var i = 0; i < ds_grid_width(apf_explgrid); i ++) {
	//	for (var j = 0; j < ds_grid_height(apf_explgrid); j ++) { // for each cell
	//		var _center_cx = (i + 0.5) * apf_explgrid_cell_size // x, y of cell center
	//		var _center_cy = (j + 0.5) * apf_explgrid_cell_size
			
	//		var _in_region = false // whether inside AI exploration region
	//		with (obj_ai_exploration_region) {
	//			if (collision_point(_center_cx, _center_cy, self, false, false)) { // if point meets region object
	//				_in_region = true
	//				break
	//			}
	//		}
			
	//		if (_in_region)
	//			apf_explgrid[# i, j] = 1 // set candy value to 1 (1 is candy that AI wants to discover/eat, 0 is empty)
	//	}
	//}
	
	
}