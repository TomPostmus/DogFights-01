// Inherit the parent event
event_inherited();

if (global.ingame()) {
	
	// Initialize vision
	vision = create_controllers(obj_ai_vision) 
	vision.player = self;
	
	// Initialize planning layers
	action_planner = create_controllers(obj_ai_action_planner)
	action_planner.player = self;
	
	layer_agrid = create_controllers(obj_ai_grid_planner) 
	layer_rrt = create_controllers(obj_ai_motion_planner)	
	
}