// Inherit the parent event
event_inherited();

/// @description Returns a deep copy of WholeState, where children is a unique list with unique branches
/// @returns {AIRRTBranch} The deep copied RRT branch
/// @context obj_demo_ai_rrt_path
function rrt_branch_copy(_branch, _parent) {
	var _branch_copy = variable_clone(_branch) // clone all fields
	_branch_copy.parent = _parent // link parent
	_branch_copy.children = ds_list_create() // create new list
	for (var i = 0; i < ds_list_size(_branch.children); i ++)
		ds_list_add(_branch_copy.children, rrt_branch_copy(_branch.children[|i], _branch_copy)) // fill list with copied children
			
	return _branch_copy
}

/// @description Insert a path into motion planner, based on a reference path
/// @param {obj_ai_motion_planner} motion_planner The motion planner to insert path in
/// @param {ds_list} ref_path The reference path from which to copy elements
/// @context obj_demo_ai_rrt_path
function motion_planner_insert_rrt_path(_motion_planner, _ref_path) {

	// Build tree from path
	_motion_planner.initialize(rrt_branch_copy(_ref_path[|0], undefined))
	for (var i = 1; i < ds_list_size(_ref_path); i ++)
		_motion_planner.add_element(rrt_branch_copy(_ref_path[|i], _motion_planner.elements[|i-1]))
	
	_motion_planner.compute_path_flow() // compute path as single branch

}

/// @description Append copies of traversed branches to end of motion planner path to keep path cyclic
/// @param {obj_ai_motion_planner} motion_planner The motion planner to insert path in
/// @param {ds_list} ref_path The reference path from which to copy elements
/// @context obj_demo_ai_rrt_path
function motion_planner_update_cyclic_path(_motion_planner, _ref_path) {
	
	var _branches_to_add = ds_list_size(_ref_path) - ds_list_size(_motion_planner.elements)

	if (_branches_to_add > 0) {
		
		for (var i = ds_list_size(_motion_planner.elements) - 1; i < ds_list_size(_ref_path); i ++) {
		
			_motion_planner.add_element(rrt_branch_copy(_ref_path[|i], _motion_planner.elements[|i-1]))
		
		}
		
		_motion_planner.compute_path_flow() // compute path as single branch
		
	}

}

cyclic_path_generators = array_create(0) // list of functions that generate a path from an x, y, th position

// Slalom
array_push(cyclic_path_generators, function (_body_x, _body_y, _body_th) {
	
	var _path = ds_list_create()
	ds_list_add(_path, new AIRRTBranchRoot(_body_x, _body_y, _body_th))
	
	repeat(8) {
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_LEFT))
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_LEFT))
	}

	return _path
	
})

// Straight, U-turn, Straight, U-turn
array_push(cyclic_path_generators, function(_body_x, _body_y, _body_th) {
	
	var _path = ds_list_create()
	ds_list_add(_path, new AIRRTBranchRoot(_body_x, _body_y, _body_th))
	
	repeat(2) {
		ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD)) // straight
		ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
		ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
		ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
	
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT)) // U-turn
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
		ds_list_add(_path, new AIRRTBranchArc(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD, RRT_STEERING_RIGHT))
	}
	
	return _path

})

// Rectangle
array_push(cyclic_path_generators, function(_body_x, _body_y, _body_th) {
	
	var _path = ds_list_create()
	ds_list_add(_path, new AIRRTBranchRoot(_body_x, _body_y, _body_th))
	
	repeat(4) {
		ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
		ds_list_add(_path, new AIRRTBranchStraight(_path[|ds_list_size(_path)-1], RRT_GEAR_FORWARD))
		ds_list_add(_path, new AIRRTBranchTurn(_path[|ds_list_size(_path)-1], _path[|ds_list_size(_path)-1].th-90))	
	}
	
	
	return _path
})

number_of_paths = array_length(cyclic_path_generators)
cyclic_paths = array_create(0)

/// @function start()
/// @description Starts demo
/// @context obj_demo_ai_astar_path
function start() {
	demo_players = array_create(number_of_paths)
	for (var i = 0; i < number_of_paths; i ++)
		demo_players[i] = create_controllers(obj_player_ai_only_rrt)
	
	start_engine(rm_ai_demo_rrt_path)
}

/// @description Spawn player on startup
/// @context obj_demo_ai_astar_path
notify_on_engine_room_start = function() {
	
	cyclic_paths = array_create(number_of_paths, undefined) // list of cyclic (reference) paths generated
	
	// Spawn demo players on spawn markers
	for (var i = 0; i < number_of_paths; i ++) {
		
		var _marker = instance_find(obj_marker_spawn_player, i)
		
		if (instance_exists(_marker)) {
			var _character = obj_spawns_controller.spawn_character(_marker.x, _marker.y, _marker.image_angle)
			demo_players[i].character = _character // assign to player
		}
		
	}
	
	obj_viewport_controller.set_viewport_overview_mode(0) // set overview mode of viewport
	
}