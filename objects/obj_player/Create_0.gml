// obj_player: defines a player
// Has a character that it controls

// References
character = noone
profile = noone
input = noone
camera = noone

// Player id, id of player in game
player_id = undefined
team_id = undefined

// Inventory

// Player state
type = undefined			//type of player, e.g. dog or spectator or hacker
alive = false				//if type dog, whether alive or dead, or not yet spawned
movement_mode = undefined	//control mode of dog, e.g. walking or driving

// Spawn player
//function spawn(_spawn_x, spawn_y, spawn_rot) {
//	if type == "dog" {
//		alive = true
//		hp.init_hp()
		
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

// Set team that player belongs to
function set_team(_team_id, _team_color) {
	team_id = _team_id
	//appearance.team_collar = true // enable team identification collar
	//appearance.team_color = _team_color
}

// Kill body
//function die() {
//	alive = false
//	appearance.death_effect(body) // death effect
//	instance_destroy(body)
//	instance_destroy(movement)
//}