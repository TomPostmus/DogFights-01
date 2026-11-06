// Inherit the parent event
event_inherited();

demo_player = undefined

/// @function start()
/// @description Starts demo
/// @context obj_demo_ai_astar_path
function start() {
	demo_player = create_controllers(obj_player_ai)
	
	create_controllers(obj_engine) // kick off engine
	obj_engine.start(rm_ai_demo_astar_path) // go to demo room
}