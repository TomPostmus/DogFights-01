/// @function LobbyConfiguration()
/// @description Constructs the default LobbyConfiguration
function LobbyConfiguration() constructor {
	game_mode_object_index = undefined // object index used to determine game mode
	map_room = rm_map_josephsfarm // the room index of the map the lobby is going to play
	teams_number = 2 // the amount of teams
	army_size = 12 // the amount of lives/army unit the teams start with
	
	// Players
	players = ds_list_create() // list of players lobby starts with
	players_active = ds_list_create() // list of active players
	
	/// @function set_human_players(_n)
	/// @description Set the number of human players for this lobby, assumes no human players have been added yet
	/// @param {int} n The number of human players to set
	/// @context LobbyConfiguration
	function set_human_players(_n_players) {
		if (ds_list_size(players_active) != 0)
			show_error("List of human players should be empty before calling this function.", true)
		
		if (_n_players > 0) {
			var _p1 = create_controllers(obj_player_p1) // add player one (WASD)
			ds_list_add(players_active, _p1) // add to active players list
			ds_list_add(players, _p1) // and general players list
		}

		if (_n_players > 1) {
			var _p2 = create_controllers(obj_player_p2) // add player two (arrow keys)
			ds_list_add(players_active, _p2)
			ds_list_add(players, _p2)
		}
	}
	
	/// @function add_ai_players(n)
	/// @description Add an number of AI players to LobbyConfiguration
	/// @param {int} n The number of AI players to add
	/// @context LobbyConfiguration
	function add_ai_players(_n) {
		repeat (_n)
			ds_list_add(players, create_controllers(obj_player_ai))
	}
	
}