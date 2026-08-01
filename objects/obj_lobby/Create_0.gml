/// @description This is the lobby controller that keeps track of the players that are participating in the game

players = ds_list_create()
players_active = ds_list_create() // list that keeps track of active players, i.e. players followed by viewports

//var _p1 = instance_create_layer(0, 0, "Players", obj_player_p1) // first input player (WASD)
//ds_list_add(players_active, _p1) // add to active players list
//ds_list_add(players, _p1) // and general players list
var _p2 = instance_create_layer(0, 0, "Players", obj_player_p1) // second input player (arrow keys)
ds_list_add(players_active, _p2)
ds_list_add(players, _p2)

// Create AI players
var _num_ais = 1 // how many to create
repeat (_num_ais) {
	var _ai = instance_create_layer(0, 0, "Players", obj_player_ai)	
	ds_list_add(players, _ai)
}

// Create game object
game = instance_create_layer(0, 0, "Players", obj_game_local_teambattle)
room_goto_next() // go to next room (which is assumed to be game room)