// Inherit the parent event
event_inherited();

demo_player = undefined
path_inserted = false

/// @function start()
/// @description Starts demo
/// @context obj_demo_ai_astar_path
function start() {
	demo_player = create_controllers(obj_player_ai_only_rrt)
	
	start_engine(rm_ai_demo_rrt_path)
	ds_list_add(obj_engine.observers_startup, demo_player) // subscribe player to engine startup
}

/// @description Spawn player on startup
/// @context obj_demo_ai_astar_path
notify_on_engine_startup = function() {
	
	path_inserted = false
	
	var _spawn = instance_find(obj_marker_spawn_player, 0)
	if (!instance_exists(_spawn))
		show_error("Could not start demo obj_demo_engine_layer_ai_astar_path; Spawn marker for player not found.", true)
	
	var _character = obj_spawns_controller.spawn_character(_spawn.x, _spawn.y, _spawn.image_angle)
	demo_player.character = _character
}