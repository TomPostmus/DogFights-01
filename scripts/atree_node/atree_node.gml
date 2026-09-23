enum ACTION_TYPE {
	ROOT,
	INSPECT_LANDMARK,
	ENTER_MISSION_AREA,
	RANDOM_ROAMING,
	ENGAGE_ENEMY,
	FLEE_ENEMY,
	APPROACH_PACKAGE
}


function Action(_planner, _parent) constructor {
	
	planner = _planner
	parent = _parent
	children = ds_list_create()

	inside_mission_area = position_meeting(_x, _y, obj_ai_region_mission_area)
	
	h_cost = undefined
	g_cost = undefined
	s_cost = undefined
	
	ds_list_add(_planner.atree_list, self) // put self in atree list
	
	if (_parent)
		ds_list_add(_parent.children, self) // put self in parent links
	
	// compute H cost based on pstate values
	function compute_h_cost() {
		h_cost = -planner.w_hp * pstate.hp 
			- planner.w_defpower * pstate.defpower
			- planner.w_mission_success * pstate.mission_success
			- planner.w_sochealth * pstate.sochealth
			- planner.w_knowledge * pstate.knowledge
	}

}

function Action_root(_planner, _x, _y) : Action(_planner, undefined) constructor {
	type = ACTION_TYPE.ROOT
	
	pstate = variable_clone(_planner.pstate) // initialize expected pstate at current pstate
}

function Action_inspect_landmark(_planner, _parent, _x, _y) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.INSPECT_LANDMARK
	
	pstate = variable_clone(_parent.pstate)
	pstate.knowledge ++ // expect one more knowlegde point
}

function Action_enter_mission_area(_planner, _parent, _x, _y) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.ENTER_MISSION_AREA
	
	pstate = variable_clone(_parent.pstate) // TODO: what does ENTER_MISSION_AREA change for pstate?
}

function Action_random_roaming(_planner, _parent) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.RANDOM_ROAMING

	pstate = variable_clone(_parent.pstate)
	pstate.knowledge ++
}

function Action_engage_enemy(_planner, _parent) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.ENGAGE_ENEMY

	pstate = variable_clone(_parent.pstate)
	pstate.mission_success ++
}

function Action_flee_enemy(_planner, _parent) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.FLEE_ENEMY
	
	pstate = variable_clone(_parent.pstate)
	pstate.hp = 100
}

function Action_approach_package(_planner, _parent) : Action(_planner, _parent) constructor {
	type = ACTION_TYPE.APPROACH_PACKAGE
	
	pstate = variable_clone(_parent.pstate)
	pstate.defpower ++ // TODO: how is defense power defined? Shouldn't it be more concrete?
}