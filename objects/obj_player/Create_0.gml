// obj_player: defines a player
// Has a character that it controls
// Player object represents human player (or AI player that simulates human player)

// References
character = noone
profile = noone
camera = noone // created when character spawns

// Player id, id of player in game
player_id_ = undefined
team_id = -1
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

// Observers
observers_kik = ds_list_create()

/// @description On event that character is kikked
/// @param {obj_character} character The character that is kikked
/// @param {obj_player} kikker The player that is the offender that caused the kik
/// @context obj_player
notify_on_character_kik = function (_character, _kikker) {
	
	if (_character != character) // if called for another character; ignore
		return
		
	// Notify player observers in turn
	for (var i = 0; i < ds_list_size(observers_kik); i ++)
		observers_kik[|i].notify_on_player_kik(id, character, _kikker)
		
	character = noone // reset ref
	
}

//alive = false				//if type dog, whether alive or dead, or not yet spawned
//movement_mode = undefined	//control mode of dog, e.g. walking or driving

// Kill body
//function die() {
//	alive = false
//	appearance.death_effect(body) // death effect
//	instance_destroy(body)
//	instance_destroy(movement)
//}