// Inherit the parent event
event_inherited();

if (global.ingame()) {
	
	// Initialize components
	vision = create_controllers(obj_ai_vision) // initialize vision
	vision.player = self;
	action_planner = create_controllers(obj_ai_action_planner) // initialize planning layers
	layer_agrid = create_controllers(obj_ai_grid_planner) 
	layer_rrt = create_controllers(obj_ai_motion_planner)	
	
}