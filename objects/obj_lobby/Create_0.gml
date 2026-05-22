/// @description This is the lobby controller that keeps track of the players that are participating in the game

players = ds_list_create()
players_active = ds_list_create() // list that keeps track of active players, i.e. players followed by viewports

var _p1 = instance_create_layer(0, 0, "Players", obj_player_p1) // first input player (WASD)
var _p2 = instance_create_layer(0, 0, "Players", obj_player_p2) // second input player (arrow keys)
ds_list_add(players_active, _p1, _p2) // add to active players list
ds_list_add(players, _p1, _p2) // and general players list

// Create AI players
var _num_ais = 10 // how many to create
repeat (_num_ais) {
	var _ai = instance_create_layer(0, 0, "Players", obj_player_ai)	
	ds_list_add(players, _ai)
}

// Create game object
game = instance_create_layer(0, 0, "Players", obj_game_local_teambattle)
room_goto_next() // go to next room (which is assumed to be game room)