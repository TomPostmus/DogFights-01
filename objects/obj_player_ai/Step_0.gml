if (global.ingame() && instance_exists(character) && instance_exists(character.body)) {
	var _body = character.body
	var _weapon = character.weapon
	
	var _body_x = _body.get_x()
	var _body_y = _body.get_y()
	var _body_rot = _body.get_rotation()	
	
	// Send inputs to lower level layer and get outputs
	//layer_agrid.body_x = _body_x // send body 2D (x,y) position to A* Grid
	//layer_agrid.body_y = _body_y
	//layer_agrid.cost_field = apf_cost_field_2d // send 2D cost field from APF layer to A* Grid
	
	//layer_rrt.body_x = _body_x // send body 3D (x,y,th) position to RRT
	//layer_rrt.body_y = _body_y
	//layer_rrt.body_th = _body_rot
	//layer_rrt.cost_field = layer_agrid.cost_field_rrt // pass through cost field computed in A* Grid layer to RRT layer
	
	move_input = layer_rrt.move_input // extract move outputs from RRT layer
	turn_input = layer_rrt.turn_input
	
	
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