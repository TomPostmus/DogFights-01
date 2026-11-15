// Inherit the parent event
event_inherited();

demo_player = undefined
path_inserted = false

function motion_planner_insert_rrt_path(_motion_planner, _path) {

	// Build tree from path
	_motion_planner.initialize(_path[|0])
	for (var i = 1; i < ds_list_size(_path); i ++)
		_motion_planner.add_element(_path[|i])
	
	ds_list_destroy(_path) // delete list
	
	_motion_planner.compute_path_flow() // compute path as single branch

}

function rrt_path_straight_u_turn_straight(_body_x, _body_y, _body_th) {
	
	var _path = ds_list_create()
	ds_list_add(_path, new AIRRTBranchRoot(_body_x, _body_y, _body_th))
	
	ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
	ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
	ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
	ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
	
	ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
	ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
	ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
	ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
	ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
	ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
	ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
	ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
	
	ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
	ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
	ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
	ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
	
	return _path

}

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
	
	obj_viewport_controller.set_viewport_overview_mode(0) // set overview mode of viewport
	
}