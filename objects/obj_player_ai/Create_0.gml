// Inherit the parent event
event_inherited();

debug_draw_mode = 0

// AI component references
vision = noone // reference to vision object, initialized upon Room Start
action_planner = noone // references to planning layers
grid_planner = noone
motion_planner = noone

/// @description On engine startup event
/// @context obj_player_ai
notify_on_engine_startup = function() {
	
	// Initialize vision
	vision = create_controllers(obj_ai_vision) 
	vision.player = self;
	
	// Initialize planning layers
	action_planner = create_controllers(obj_ai_action_planner)
	action_planner.player = self;
	
	grid_planner = create_controllers(obj_ai_grid_planner) 
	motion_planner = create_controllers(obj_ai_motion_planner)
	
}