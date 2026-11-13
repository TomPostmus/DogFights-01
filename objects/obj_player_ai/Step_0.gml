event_inherited()

if (global.engine_running && instance_exists(character) && instance_exists(character.body)) {
	var _body = character.body
	var _weapon = character.weapon
	
	var _body_x = _body.get_x()
	var _body_y = _body.get_y()
	var _body_rot = _body.get_rotation()	
	
	// Send body 2D position to grid planner
	if (instance_exists(grid_planner)) {
		grid_planner.body_x = _body_x // send body 2D (x,y) position to A* Grid
		grid_planner.body_y = _body_y
	}
	
	// Send body 3D position and cost field to motion planner and get movement output
	//if (instance_exists(grid_planner)) {
	//	motion_planner.body_x = _body_x // send body 3D (x,y,th) position to RRT
	//	motion_planner.body_y = _body_y
	//	motion_planner.body_th = _body_rot
	//	motion_planner.cost_field = grid_planner.cost_field_rrt // pass through cost field computed in A* Grid layer to RRT layer
	
	//	move_input = motion_planner.move_input // extract move outputs from RRT layer
	//	turn_input = motion_planner.turn_input
	//}
	
	// LOWER TWO LINES ARE PURELY FOR DEBUGGING: manual player controls
	//move_input = get_key(KEY_P2_FORWARD, KEYACTION_HOLD) - get_key(KEY_P2_BACKWARD, KEYACTION_HOLD)
	//turn_input = get_key(KEY_P2_LEFT, KEYACTION_HOLD) - get_key(KEY_P2_RIGHT, KEYACTION_HOLD)
	
	// Send to character
	character.interact = input_interact
	
	// Send to weapon
	if (instance_exists(_weapon)) {
		_weapon.trigger = input_attack
		_weapon.aiming = input_attack2
		_weapon.input_reload = input_reload
		_weapon.input_firemode = input_firemode
	}

	// Send to movement controller
	character.movement.move_input = move_input
	character.movement.turn_input = turn_input

	
}