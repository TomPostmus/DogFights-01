enum ACTION_TYPE {
	ROOT,
	INSPECT_LANDMARK,
	ENTER_MISSION_AREA,
	RANDOM_ROAMING,
	ENGAGE_ENEMY,
	FLEE_ENEMY,
	APPROACH_PACKAGE
}


function Action(_planner, _parent, _expected_position) constructor {
	
	planner = _planner
	parent = _parent
	children = ds_list_create()
	
	h_cost = undefined
	g_cost = undefined
	s_cost = undefined
	
	if (_parent)
		expected_wstate = variable_clone(_parent.expected_wstate)
	else
		expected_wstate = variable_clone(_planner.wstate) // if no parent, take current wstate
	expected_wstate.pos = _expected_position
	
	path = undefined // GM path to expected position
	if (_expected_position) {
		if (!instance_exists(obj_ai_topology))
			show_error("Could not compute A* to destination; obj_ai_topology does not exist.", true)
		if (obj_ai_topology.grid == undefined)
			show_error("Could not compute A* to destination; obj_ai_topology.grid is undefined.", true)
		
		path = path_add()
		var _base_pos = _parent ? _parent.expected_wstate.pos : _planner.wstate.pos
		if (!mp_grid_path(obj_ai_topology.grid, path, 
			_base_pos[0], _base_pos[1], 
			_expected_position[0], _expected_position[1], false)) {
			path_delete(path)
			path = undefined
		}
	}
	
	ds_list_add(_planner.atree_list, self) // put self in atree list
	
	if (_parent)
		ds_list_add(_parent.children, self) // put self in parent links
	
	// compute H cost based on expected_wstate values
	function compute_h_cost() {
		h_cost = -planner.w_hp * expected_wstate.hp 
			- planner.w_defpower * expected_wstate.defpower
			- planner.w_mission_success * expected_wstate.mission_success
			- planner.w_sochealth * expected_wstate.sochealth
			- planner.w_knowledge * expected_wstate.knowledge
	}
	
	// TODO implement destroy function
	function destroy() {
	
	}

}

function Action_root(_planner, _expected_position) : Action(_planner, undefined, _expected_position) constructor {
	type = ACTION_TYPE.ROOT
}

function Action_inspect_landmark(_planner, _parent, _x, _y) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.INSPECT_LANDMARK
	
	expected_wstate = variable_clone(_parent.expected_wstate)
	expected_wstate.knowledge ++ // expect one more knowlegde point
}

function Action_enter_mission_area(_planner, _parent, _x, _y) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.ENTER_MISSION_AREA
	
	expected_wstate = variable_clone(_parent.expected_wstate) // TODO: what does ENTER_MISSION_AREA change for expected_wstate?
}

function Action_random_roaming(_planner, _parent) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.RANDOM_ROAMING

	expected_wstate = variable_clone(_parent.expected_wstate)
	expected_wstate.knowledge ++
}

function Action_engage_enemy(_planner, _parent) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.ENGAGE_ENEMY

	expected_wstate = variable_clone(_parent.expected_wstate)
	expected_wstate.mission_success ++
}

function Action_flee_enemy(_planner, _parent) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.FLEE_ENEMY
	
	expected_wstate = variable_clone(_parent.expected_wstate)
	expected_wstate.hp = 100
}

function Action_approach_package(_planner, _parent) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.APPROACH_PACKAGE
	
	expected_wstate = variable_clone(_parent.expected_wstate)
	expected_wstate.defpower ++ // TODO: how is defense power defined? Shouldn't it be more concrete?
}