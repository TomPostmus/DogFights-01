enum ACTION_TYPE {
	ROOT,
	INSPECT_LANDMARK,
	ENTER_MISSION_AREA,
	ENGAGE_ENEMY,
	FLEE_ENEMY,
	RANDOM_ROAMING,
	APPROACH_PACKAGE
}


function Action(_planner, _parent, _x, _y) constructor {
	
	parent = _parent
	children = ds_list_create()
	
	expected_dest = [x, y]
	expected_hp = undefined
	expected_defpower = undefined
	expected_safety = undefined
	expected_knowlegde = undefined
	expected_success = undefined
	
	h_cost = undefined
	g_cost = undefined
	s_cost = undefined

}

function Action_root(_planner, _x, _y) : Action(_planner, undefined, _x, _y) constructor {
	type = ACTION_TYPE.ROOT
	
	expected_hp = _planner.player.hp
	expected_defpower = undefined
	expected_safety = undefined
	expected_knowlegde = undefined
	expected_success = undefined
}

function Action_inspect_landmark(_planner, _parent, _x, _y) : Action(_planner, _parent, _x, _y) constructor {
	type = ACTION_TYPE.INSPECT_LANDMARK
	
	expected_hp = _parent ? _parent.expected_hp : 0
	expected_defpower = _parent ? _parent.expected_defpower : 0
	expected_safety = compute_safety(_x, _y)
	expected_knowlegde = 1 + (_parent ? _parent.expected_knowlegde : 0) // TODO: what unit should this be?
	expected_success = _parent ? _parent.expected_success : 0
	
}