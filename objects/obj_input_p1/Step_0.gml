event_inherited()

// Get input from P1
move_input = get_key(KEY_P1_FORWARD, KEYACTION_HOLD) - get_key(KEY_P1_BACKWARD, KEYACTION_HOLD)
turn_input = get_key(KEY_P1_LEFT, KEYACTION_HOLD) - get_key(KEY_P1_RIGHT, KEYACTION_HOLD)
input_reload = get_key(KEY_P1_RELOAD, KEYACTION_PRESS)
input_attack = get_key(KEY_P1_ATTACK, KEYACTION_HOLD)
input_attack2 = get_key(KEY_P1_ATTACK2, KEYACTION_HOLD)
input_firemode = get_key(KEY_P1_FIREMODE, KEYACTION_PRESS)