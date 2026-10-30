/// @description This is the lobby controller that keeps track of the players that are participating in the game

players = undefined // list of players in lobby
players_active = undefined // list that keeps track of active players, i.e. players followed by viewports

// Melt properties from LobbyConfiguration into instance
if (!variable_instance_exists(id, "lobby_configuration")) // if lobby_configuration has not been given upon creation
	lobby_configuration = new LobbyConfiguration() // initialize as default

struct_melt_into_instance(lobby_configuration, id) // melt config variables into instance

// Create game
game = undefined // game object made on basis of game_mode. Life-time managed by obj_lobby
if (game_mode_object_index) {
	if (!object_exists(game_mode_object_index) || !object_is_ancestor(game_mode_object_index, obj_game))
		show_error("Could not start game from lobby: game mode object index is not an object, or not a child of obj_game.", true)
	game = create_controllers(game_mode_object_index)
}

/// @function start_game()
/// @description Kicks off the engine object and moves to the map room
/// @context obj_lobby
function start_game() {	
	create_controllers(obj_engine) // kick off engine
	
	room_goto(lobby_configuration.map_room) // go to map room
}