event_inherited()

// Get input from P2
move_input = get_key(KEY_P2_FORWARD, KEYACTION_HOLD) - get_key(KEY_P2_BACKWARD, KEYACTION_HOLD)
turn_input = get_key(KEY_P2_LEFT, KEYACTION_HOLD) - get_key(KEY_P2_RIGHT, KEYACTION_HOLD)
input_reload = get_key(KEY_P2_RELOAD, KEYACTION_PRESS)
input_attack = get_key(KEY_P2_ATTACK, KEYACTION_HOLD)
input_attack2 = get_key(KEY_P2_ATTACK2, KEYACTION_HOLD)
input_firemode = get_key(KEY_P2_FIREMODE, KEYACTION_HOLD)