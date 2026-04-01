//obj_player_input: Object that gives input to player. Input can come from human or AI.

// Player reference
player = noone

// Input state
move_input = 0			// player movement over longitudal axis (backwards or forwards), ranges from -1 to 1
turn_input = 0			// angular movement input, ranges from -1 to 1

input_reload = false	// input for reloading weapon
input_attack = false	// input of primary attack of weapon
input_attack2 = false	// input for aiming weapon, or secondary attack
input_firemode = false	// input to switch firemode for weapon