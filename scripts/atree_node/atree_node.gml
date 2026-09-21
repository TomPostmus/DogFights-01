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
	
	parent = _parent
	children = ds_list_create()

	expected_dest = [_x, _y]
	inside_mission_area = position_meeting(_x, _y, obj_ai_region_mission_area)
	expected_sochealth = compute_safety(_x, _y) // safety of destination location
	
	if (_parent) {
		expected_hp = _parent.expected_hp
		expected_defpower = _parent.expected_defpower
		expected_knowlegde = _parent.expected_knowlegde // TODO: what unit should this be?
		expected_success = _parent.expected_success
	} else {
		expected_hp = player.hp
		expected_defpower = 0
		expected_knowlegde = 0
		expected_success = 0
	}
	
	h_cost = undefined
	g_cost = undefined
	s_cost = undefined
	
	ds_list_add(_planner.atree_list, self) // put self in atree list
	open = true // whether is open node (not explored yet)
	
	if (_parent)
		ds_list_add(_parent.children, self) // put self in parent links

}

function Action_root(_planner, _x, _y) : Action(_planner, undefined) constructor {
	type = ACTION_TYPE.ROOT
	
	
	
	expected_hp = _planner.player.hp
	expected_defpower = undefined
	expected_sochealth = undefined
	expected_knowlegde = undefined
	expected_success = undefined
}

function Action_inspect_landmark(_planner, _parent, _x, _y) : Action(_planner, _parent, _x, _y) constructor {
	type = ACTION_TYPE.INSPECT_LANDMARK
	
}

function Action_enter_mission_area(_planner, _parent, _x, _y) : Action(_planner, _parent, _x, _y) constructor {
	type = ACTION_TYPE.ENTER_MISSION_AREA
	
}