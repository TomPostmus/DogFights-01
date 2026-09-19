enum ACTION_TYPE {
	ROOT,
	INSPECT_LANDMARK,
	ENGAGE_ENEMY,
	FLEE_ENEMY,
	RANDOM_ROAMING,
	APPROACH_PACKAGE
}


function Action(_planner, _parent) constructor {
	
	parent = _parent
	children = ds_list_create()
	
	expected_hp = undefined
	expected_defpower = undefined
	expected_safety = undefined
	expected_knowlegde = undefined
	expected_success = undefined
	
	h_cost = undefined
	g_cost = undefined
	s_cost = undefined

}

function Action_root(_planner) : Action(_planner, undefined) constructor {
	_type = ACTION_TYPE.ROOT
	
	expected_hp = _planner.player.hp
	expected_defpower = undefined
	expected_safety = undefined
	expected_knowlegde = undefined
	expected_success = undefined
}

function Action_inspect_landmark(_planner, _parent, _poi) : Action(_planner, _parent) constructor {
	_type = ACTION_TYPE.INSPECT_LANDMARK
	
	expected_hp = _parent ? _parent.expected_hp : 0
	expected_defpower = _parent ? _parent.expected_defpower : 0
	expected_safety = compute_safety(_poi.x, _poi.y)
	expected_knowlegde = 1 + (_parent ? _parent.expected_knowlegde : 0) // TODO: what unit should this be?
	expected_success = _parent ? _parent.expected_success : 0
	
}