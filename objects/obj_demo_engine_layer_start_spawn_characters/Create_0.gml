// Inherit the parent event
event_inherited();

n_characters = 21
team = undefined

/// @function start()
/// @description Starts demo
/// @context obj_demo_ai_astar_path
function start() {
	
	team = create_controllers(obj_team)
	team.team_id = 0
	
	start_engine(rm_demo_start_spawn_single_team)
	
}

/// @description Spawn team
/// @context obj_demo_ai_astar_path
notify_on_engine_startup = function() {

	team.start_spawn_team_characters(n_characters)

}