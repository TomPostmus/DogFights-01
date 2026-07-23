// Inherit the parent event
event_inherited();

state = "explore"

// APF layer (Artificial Potential Field, with Attraction and Repulsion sources)
apf_cost_field_2d = undefined // 2D cost function, that maps position (x, y) to cost (manifold height), meant for A* Grid layer
apf_explgrid_cell_size = 64
apf_explgrid = undefined // exploration grid, initialized upon Room Start
apf_explgrid_costf = function(_x, _y) { // cost function for exploration grid, mapping position to exploration cost
	
	var _cell_x = ceil(_x / apf_explgrid_cell_size) // indices of cells in ds grid
	var _cell_y = ceil(_y / apf_explgrid_cell_size)
	
	var _cost = 1 - apf_explgrid[# _cell_x, _cell_y]
	
	return _cost
	
}
apf_enemies = ds_list_create() // list of enemies in sight
apf_social_costf = function(_x, _y) { // cost function for social bonds (teammates or enemies)
	
	var _cost = 0
	var _R = 400 // radius of sources
	for (var i = 0; i < ds_list_size(apf_enemies); i ++) {
		var _enemy = apf_enemies[|i]
		
		var _r = point_distance(_x, _y, _enemy.x, _enemy.y) // radius (distance) to enemy
		
		if (_r <= _R) { // if falls within source radius
			_cost += -_R * sqr(1 - sqr(_r) / sqr(_R)) // height on mountain/valley centered around enemy with radius R
		}
	}
	
	return _cost
	
}

// Lower level layers are put in their own objects
//layer_apf = create_controllers(obj_ai_layer_apf)
layer_agrid = undefined // initialized upon Room Start