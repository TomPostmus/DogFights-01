// Inherit the parent event
event_inherited();

state = "explore"
debug_draw_mode = 0

// Exploration layer
expl_landmarks = ds_list_create() // list of landmarks that player knows
expl_landmarks_insight = ds_list_create() // list of landmarks in sight
expl_landmarks_novelty = ds_map_create() // map of landmark to novelty value
expl_landmarks_costf = function(_x, _y) {

	var _cost = 0
	var _R = 500 // radius of sources
	var _D = 200 // default depth of sources
	for (var i = 0; i < ds_list_size(expl_landmarks_insight); i ++) {
		var _landmark = expl_landmarks_insight[|i]
		
		var _r = point_distance(_x, _y, _landmark.x, _landmark.y) // radius (distance) to enemy
		var _d = _D * _landmark.interest * expl_landmarks_novelty[? _landmark] // depth (strength) of landmark is its interest value multiplied with novelty to the player
		
		if (_r <= _R) { // if falls within source radius
			_cost += -_d * sqr(1 - sqr(_r) / sqr(_R)) // height on mountain/valley centered around enemy with radius R
		}
	}
	
	return _cost

}

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
		
// 2D cost function, that maps position (x, y) to cost (manifold height), meant for A* Grid layer
// The Artificial Potential Field (APF) is simply a map from a position (x, y) to a cost, or a height (z) value if you consider it as a 2-manifold (3D object)
apf_cost_field_2d = function(_x, _y) {
	var _cost = 0
	
	if (state == "explore")
		_cost += expl_landmarks_costf(_x, _y)
	else if (state == "conflict")
		_cost += apf_social_costf(_x, _y)

	return _cost
} 

// Lower level layers are put in their own objects
//layer_apf = create_controllers(obj_ai_layer_apf)
layer_agrid = undefined // initialized upon Room Start
layer_rrt = undefined