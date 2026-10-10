enum ACTION_TYPE {
	ROOT,
	INSPECT_LANDMARK,
	ENTER_MISSION_AREA,
	RANDOM_ROAMING,
	ENGAGE_ENEMY,
	FLEE_ENEMY,
	APPROACH_PACKAGE
}

/// @function AIAction(parent, x, y)
/// @param {AIAction} parent
/// @param {real} x
/// @param {real} y
/// @description Create an AIAction element that represents an Action that the AI player can do.
function AIAction(_parent, _x, _y) : AITreeElement(_parent) constructor {
	
	x = _x
	y = _y
	
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
	
	poi_inst = undefined // instance associated with POI associated with this Action
	expected_wstate = undefined // expected WholeState at the end of completing Action
	if (_parent)
		expected_wstate = variable_clone(_parent.expected_wstate, 1) // deep copy wstate
	
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
		
		if (path != undefined && path_exists(path))
			draw_path(path, 0, 0, true)
	}
	
	// Extend cleanup
	super_cleanup = cleanup
	function cleanup() {
		super_cleanup() // call super function
		
		if (path_exists(path))
			path_delete(path)
	}

}

/// @function AIActionRoot(parent, x, y)
/// @param {real} x
/// @param {real} y
/// @param {WholeState} wstate_init Initial WholeState at position of root
function AIActionRoot(_x, _y, _wstate_init) : AIAction(undefined, _x, _y) constructor {
	type = ACTION_TYPE.ROOT
	type_name = "Root"
	
	expected_wstate = _wstate_init // initialise wstate
}

function AIActionInspectLandmark(_parent, _x, _y, _poi_inst) : AIAction(_parent, _x, _y) constructor {
	type = ACTION_TYPE.INSPECT_LANDMARK
	type_name = "Inspect Landmark"
	
	poi_inst = _poi_inst
	expected_wstate.knowledge ++ // expect one more knowlegde point
	
	for (var i = 0; i < ds_list_size(expected_wstate.pois); i ++) {
		var _poi = expected_wstate.pois[|i]
		if (_poi.inst = poi_inst) {
			_poi.novelty_flag = false // landmark explored, lower novelty flag
			break
		}
			
	}
}

//function Action_enter_mission_area(_planner, _parent, _x, _y) : Action(_planner, _parent) constructor {
//	type = ACTION_TYPE.ENTER_MISSION_AREA
	
//	expected_wstate = variable_clone(_parent.expected_wstate) // TODO: what does ENTER_MISSION_AREA change for expected_wstate?
//}

//function Action_random_roaming(_planner, _parent) : Action(_planner, _parent) constructor {
//	type = ACTION_TYPE.RANDOM_ROAMING

//	expected_wstate = variable_clone(_parent.expected_wstate)
//	expected_wstate.knowledge ++
//}

//function Action_engage_enemy(_planner, _parent) : Action(_planner, _parent) constructor {
//	type = ACTION_TYPE.ENGAGE_ENEMY

//	expected_wstate = variable_clone(_parent.expected_wstate)
//	expected_wstate.mission_success ++
//}

//function Action_flee_enemy(_planner, _parent) : Action(_planner, _parent) constructor {
//	type = ACTION_TYPE.FLEE_ENEMY
	
//	expected_wstate = variable_clone(_parent.expected_wstate)
//	expected_wstate.hp = 100
//}

//function Action_approach_package(_planner, _parent) : Action(_planner, _parent) constructor {
//	type = ACTION_TYPE.APPROACH_PACKAGE
	
//	expected_wstate = variable_clone(_parent.expected_wstate)
//	expected_wstate.defpower ++ // TODO: how is defense power defined? Shouldn't it be more concrete?
//}