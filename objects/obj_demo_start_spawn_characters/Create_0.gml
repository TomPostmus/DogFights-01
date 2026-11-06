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
	
	create_controllers(obj_engine) // kick off engine
	obj_engine.start(rm_start_spawn_single_team) // go to demo room
}