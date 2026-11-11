// Inherit the parent event
event_inherited();

demo_player = undefined

/// @function start()
/// @description Starts demo
/// @context obj_demo_ai_astar_path
function start() {
	demo_player = create_controllers(obj_player_ai_only_grid_planner)
	
	start_engine(rm_ai_demo_astar_path)
	ds_list_add(obj_engine.observers_startup, demo_player) // subscribe player to engine startup
}

/// @description Spawn player on startup
/// @context obj_demo_ai_astar_path
notify_on_engine_startup = function() {
	
	var _character = obj_spawns_controller.spawn_character(64, 64, 315)
	demo_player.character = _character
	
}