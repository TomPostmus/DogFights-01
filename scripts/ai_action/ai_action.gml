enum ACTION_TYPE {
	ROOT,
	INSPECT_LANDMARK,
	ENTER_MISSION_AREA,
	RANDOM_ROAMING,
	ENGAGE_ENEMY,
	FLEE_ENEMY,
	APPROACH_PACKAGE
}

function AIAction(_parent, _x, _y) : AITreeElement(_parent) constructor {
	
	x = _x
	y = _y
	
	h_cost = undefined
	g_cost = undefined
	s_cost = undefined
	
	 // GM path to destination position
	if (_parent) {
		path = undefined
		if (!instance_exists(obj_ai_topology))
			show_error("Could not compute A* to destination; obj_ai_topology does not exist.", true)
		if (obj_ai_topology.grid == undefined)
			show_error("Could not compute A* to destination; obj_ai_topology.grid is undefined.", true)
		
		path = path_add()
		if (!mp_grid_path(obj_ai_topology.grid, path, 
			_parent.x, _parent.y, x, y, false)) {
			path_delete(path)
			path = undefined
		}
	}
	
	if (_parent) {
		expected_wstate = variable_clone(_parent.expected_wstate) // copy wstate
		ds_list_add(_parent.children, self) // put self in parent links
	}
	
	// compute H cost based on expected_wstate values
	function compute_h_cost(_wstate_weights) {
		h_cost = -_wstate_weights.w_hp * expected_wstate.hp 
			- _wstate_weights.w_defpower * expected_wstate.defpower
			- _wstate_weights.w_mission_success * expected_wstate.mission_success
			- _wstate_weights.w_sochealth * expected_wstate.sochealth
			- _wstate_weights.w_knowledge * expected_wstate.knowledge
	}
	
	// Draw Action node with path
	function draw() {
		draw_circle(x, y, 5, false)
		
		if (parent)
			draw_path(path, parent.x, parent.y, true)
	}
	
	// Cleanup data structures
	function cleanup() {
		cleaned = true
		
		if (path_exists(path))
			path_delete(path)
			
		ds_list_destroy(children)
	}

}

/// @param {int} x The x position of the element
/// @param {int} y The y position of the element
/// @param {WellnessState} init_wstate The initial wstate that the root starts with
function Action_root(_x, _y, _init_wstate) : Action(undefined, _x, _y) constructor {
	type = ACTION_TYPE.ROOT
	
	expected_wstate = _init_wstate // initialise wstate
}

function Action_inspect_landmark(_planner, _parent, _x, _y) : Action(_planner, _parent, _x, _y) constructor {
	type = ACTION_TYPE.INSPECT_LANDMARK
	
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