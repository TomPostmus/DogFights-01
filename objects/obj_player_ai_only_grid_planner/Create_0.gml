// Inherit the parent event
event_inherited();

/// @description Override on engine startup
/// @context obj_player_ai
notify_on_engine_startup = function() {
	
	// Simple cost field that is distance to mouse
	var _cost_field_mouse = function(_x, _y, _th) {
		return point_distance(_x, _y, mouse_x, mouse_y)
	}
	
	// Initialize only grid and motion planning layers
	grid_planner = create_controllers(obj_ai_grid_planner)
	grid_planner.cost_field = _cost_field_mouse // set cost field
	layer_rrt = create_controllers(obj_ai_motion_planner)	
	
}