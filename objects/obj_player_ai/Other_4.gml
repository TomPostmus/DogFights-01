// Inherit the parent event
event_inherited();

// Initialize exploration grid
for (var i = 0; i < ds_grid_width(apf_explgrid); i ++) {
	for (var j = 0; j < ds_grid_height(apf_explgrid); j ++) { // for each cell
		apf_explgrid[# i, j] = 1 // set candy value to 1 (1 is candy that AI wants to discover/eat, 0 is empty)
	}
}