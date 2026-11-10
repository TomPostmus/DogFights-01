/// @description This is the lobby controller that keeps track of the players that are participating in the game

// Melt properties from LobbyConfiguration into instance
if (!variable_instance_exists(id, "lobby_configuration")) // if lobby_configuration has not been given upon creation
	lobby_configuration = new LobbyConfiguration() // initialize as default

struct_melt_into_instance(lobby_configuration, id) // melt config variables into instance

// Initialize players
players = ds_list_create() // list of player object indices to be initialized
players_active = ds_list_create() // list of active players

if (num_human_players > 0) {
	var _p1 = create_controllers(obj_player_p1) // add player one (WASD)
	ds_list_add(players_active, _p1) // add to active players list
	ds_list_add(players, _p1) // and general players list
}

if (num_human_players > 1) {
	var _p2 = create_controllers(obj_player_p2) // add player two (arrow keys)
	ds_list_add(players_active, _p2)
	ds_list_add(players, _p2)
}

repeat (num_ai_players)
	ds_list_add(players, create_controllers(obj_player_ai))

// Create game
game = noone // game object made on basis of game_mode. Life-time managed by obj_lobby
if (game_mode_object_index != undefined) {
	if (!object_exists(game_mode_object_index) || !object_is_ancestor(game_mode_object_index, obj_game))
		show_error("Could not start game from lobby: game mode object index is not an object, or not a child of obj_game.", true)
	game = create_controllers(game_mode_object_index)
	
	// Initialisation for team-based game
	if (object_is_class(game_mode_object_index, obj_game_teambattle)) { // if child of teambattle game
		game.initialize_teams(teams_number)
		game.initial_player_team_assignment(players) // do initial player to team assignment
	}
	
	// Pass config to game
	// TODO: make seperate GameConfig struct that is passed to game instead?
	game.lives_init = lives_init
}

/// @function start_game()
/// @description Kicks off the engine object and moves to the map room
/// @context obj_lobby
function start_game() {	
	create_controllers(obj_engine) // kick off engine
	
	// Subscribe game to engine startup
	if (instance_exists(game))
		ds_list_add(obj_engine.observers_startup, game)
	
	obj_engine.start(map_room)
}