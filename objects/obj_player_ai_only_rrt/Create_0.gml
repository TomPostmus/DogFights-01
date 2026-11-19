// Inherit the parent event
event_inherited();

debug_draw_mode = 2 // immediately enable draw of grid layer

/// @description Override on engine room start
/// @context obj_player_ai
notify_on_engine_room_start = function() {
	
	// Initialize only motion planning layer
	motion_planner = create_controllers(obj_ai_motion_planner)	
	
}