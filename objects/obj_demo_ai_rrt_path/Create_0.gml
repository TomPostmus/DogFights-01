// Inherit the parent event
event_inherited();

demo_players = undefined
path_inserted = undefined

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
	start_engine(rm_ai_demo_rrt_path)
}

/// @description Spawn player on startup
/// @context obj_demo_ai_astar_path
notify_on_engine_startup = function() {
	
	path_inserted = false
	demo_players = array_create(0)
	
	// Spawn demo player on every spawn marker
	var i = 0
	with (obj_marker_spawn_player) {
		other.demo_players[i] = create_controllers(obj_player_ai_only_rrt)
		other.demo_players[i].notify_on_engine_startup() // TODO: handle initialization differently?
		
		var _character = obj_spawns_controller.spawn_character(x, y, image_angle)
		other.demo_players[i].character = _character
		
		i ++
	}
	
	path_inserted = array_create(i, false)
	
	obj_viewport_controller.set_viewport_overview_mode(0) // set overview mode of viewport
	
}