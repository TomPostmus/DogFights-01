// obj_player: defines a player
// Has a character that it controls
// Player object represents human player (or AI player that simulates human player)

// References
character = noone
profile = noone
camera = noone // created at start of room

// Player id, id of player in game
player_id = undefined
team_id = undefined
team_color = undefined

// Player state
type = undefined			//type of player, e.g. dog or spectator or hacker

// Input state
move_input = 0			// player movement over longitudal axis (backwards or forwards), ranges from -1 to 1
turn_input = 0			// angular movement input, ranges from -1 to 1

input_reload = false	// input for reloading weapon
input_attack = false	// input of primary attack of weapon
input_attack2 = false	// input for aiming weapon, or secondary attack
input_firemode = false	// input to switch firemode for weapon
input_interact = false	// input for interacting with world items (e.g. opening packages)

//alive = false				//if type dog, whether alive or dead, or not yet spawned
//movement_mode = undefined	//control mode of dog, e.g. walking or driving

// Spawn player
//function spawn(_spawn_x, spawn_y, spawn_rot) {
//	if type == "dog" {
//		alive = true
//		hp.initialize()
		
//		var _vars = {rotation: spawn_rot} // var struct to give to creation
//		body = create_groundhigh(_spawn_x, spawn_y, obj_body, _vars)
//		body.player = id
//		body.set_physical(true)
		
//		if movement_mode == "walking" {
//			movement = create_controllers(obj_movement_walking)
//			movement.player = id
//		}
//	}
//}

// Kill body
//function die() {
//	alive = false
//	appearance.death_effect(body) // death effect
//	instance_destroy(body)
//	instance_destroy(movement)
//}