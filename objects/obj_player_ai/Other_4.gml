// Inherit the parent event
event_inherited();

if (global.ingame()) {

	// Initialize exploration grid
	apf_explgrid = ds_grid_create(room_width/apf_explgrid_cell_size, room_height/apf_explgrid_cell_size)
	for (var i = 0; i < ds_grid_width(apf_explgrid); i ++) {
		for (var j = 0; j < ds_grid_height(apf_explgrid); j ++) { // for each cell
			var _center_cx = (i + 0.5) * apf_explgrid_cell_size // x, y of cell center
			var _center_cy = (j + 0.5) * apf_explgrid_cell_size
			
			var _in_region = false // whether inside AI exploration region
			with (obj_ai_exploration_region) {
				if (collision_point(_center_cx, _center_cy, self, false, false)) { // if point meets region object
					_in_region = true
					break
				}
			}
			
			if (_in_region)
				apf_explgrid[# i, j] = 1 // set candy value to 1 (1 is candy that AI wants to discover/eat, 0 is empty)
		}
	}
	
	// Initialize lower level layers
	layer_agrid = create_controllers(obj_ai_layer_agrid) // create A* Grid and RRT layers
	layer_rrt = create_controllers(obj_ai_layer_rrt)
	
}