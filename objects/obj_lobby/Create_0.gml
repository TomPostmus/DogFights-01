/// @description This is the lobby controller that keeps track of the players that are participating in the game

players = ds_list_create()
players_active = ds_list_create() // list that keeps track of active players, i.e. players followed by viewports

// Add first input player
var _p1 = instance_create_layer(0, 0, "Players", obj_player_local)
_p1.input = instance_create_layer(0, 0, "Players", obj_input_p1)
_p1.input.player = _p1

// Add second input player
var _p2 = instance_create_layer(0, 0, "Players", obj_player_local)
_p2.input = instance_create_layer(0, 0, "Players", obj_input_p2)
_p2.input.player = _p2

// Add to active players list
ds_list_add(players_active, _p1, _p2)
ds_list_add(players, _p1, _p2) // and general players list

// Create AI players
var _num_ais = 8 // how many to create
repeat (_num_ais) {
	var _ai = instance_create_layer(0, 0, "Players", obj_player_local)
	_ai.input = instance_create_layer(0, 0, "Players", obj_input_ai)
	_ai.input.player = _ai
	
	ds_list_add(players, _ai)
}

// Create game object
game = instance_create_layer(0, 0, "Players", obj_game_local_tdm)
room_goto_next() // go to next room (which is assumed to be game room)