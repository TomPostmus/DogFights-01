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
	path = undefined
	if (parent) {
		if (!instance_exists(obj_ai_topology))
			show_error("Could not compute A* to destination; obj_ai_topology does not exist.", true)
		if (obj_ai_topology.grid == undefined)
			show_error("Could not compute A* to destination; obj_ai_topology.grid is undefined.", true)
		
		path = path_add()
		if (mp_grid_path(obj_ai_topology.grid, path, parent.x, parent.y, x, y, false)) {
			//g_cost = path_get_length(path) // TODO: compute implementation-specific G cost for AIActions
		} else {
			path_delete(path)
			path = undefined
		}
	}
	
	inst = undefined // instance associated with this Action
	expected_wstate = undefined // expected WholeState at the end of completing Action
	if (parent)
		expected_wstate = parent.expected_wstate.deep_copy() // deep copy wstate
	
	// Draw Action node with path
	function draw() {
		draw_circle(x, y, 5, false)
		
		if (s_cost != undefined)
			draw_text(x + 20, y + 20, s_cost)
		
		for (var i = 0; i < ds_list_size(expected_wstate.pois); i ++) {
			var _poi = expected_wstate.pois[|i]
			
			var _exists_in_children = false
			for (var j = 0; j < ds_list_size(children); j ++)
				if (children[|j].inst == _poi.inst)
					_exists_in_children = true
			if (_exists_in_children)
				continue
			
			if (_poi.type == AIPOI_TYPE.LANDMARK && _poi.novelty_flag) {
				var dir = point_direction(x, y, _poi.x, _poi.y)
				draw_arrow(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir),
						   x + lengthdir_x(15, dir), y + lengthdir_y(15, dir), 3)
			}
		}
		
		if (path != undefined && path_exists(path))
			draw_path(path, 0, 0, true)
	}
	
	// Extend cleanup
	super_cleanup = cleanup
	cleanup = function() {
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

function AIActionInspectLandmark(_parent, _x, _y, _inst) : AIAction(_parent, _x, _y) constructor {
	type = ACTION_TYPE.INSPECT_LANDMARK
	type_name = "Inspect Landmark"
	
	inst = _inst // instance action is associated with
	expected_wstate.knowledge ++ // expect one more knowlegde point
	
	for (var i = 0; i < ds_list_size(expected_wstate.pois); i ++) {
		var _poi = expected_wstate.pois[|i]
		if (_poi.inst = inst) {
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