event_inherited()

//Movement input
input_forward = get_key(KEY_P1_FORWARD, KEYACTION_HOLD)
input_backward = get_key(KEY_P1_BACKWARD, KEYACTION_HOLD)
input_left = get_key(KEY_P1_LEFT, KEYACTION_HOLD)
input_right = get_key(KEY_P1_RIGHT, KEYACTION_HOLD)

//Weapon input
if (instance_exists(input_weapon)) {
	input_weapon.input_reload = get_key(KEY_P1_RELOAD, KEYACTION_PRESS)
	input_weapon.input_attack = get_key(KEY_P1_ATTACK, KEYACTION_HOLD)
	input_weapon.input_attack2 = get_key(KEY_P1_ATTACK2, KEYACTION_HOLD)
}