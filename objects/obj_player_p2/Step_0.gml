event_inherited()

// Get input from P2
move_input = get_key(KEY_P2_FORWARD, KEYACTION_HOLD) - get_key(KEY_P2_BACKWARD, KEYACTION_HOLD)
turn_input = get_key(KEY_P2_LEFT, KEYACTION_HOLD) - get_key(KEY_P2_RIGHT, KEYACTION_HOLD)
input_reload = get_key(KEY_P2_RELOAD, KEYACTION_PRESS)
input_attack = get_key(KEY_P2_ATTACK, KEYACTION_HOLD)
input_attack2 = get_key(KEY_P2_ATTACK2, KEYACTION_HOLD)
input_firemode = get_key(KEY_P2_FIREMODE, KEYACTION_HOLD)
input_interact = get_key(KEY_P1_INTERACT, KEYACTION_PRESS)

// Send inputs
if (instance_exists(character)) {
	
	// Send to character
	character.interact = input_interact
	
	// Send to weapon
	if (instance_exists(character.weapon)) {
		character.weapon.trigger = input_attack
		character.weapon.aiming = input_attack2
		character.weapon.input_reload = input_reload
		character.weapon.input_firemode = input_firemode
	}

	// Send to movement controller
	character.movement.move_input = move_input
	character.movement.turn_input = turn_input

}