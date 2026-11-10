/// @function LobbyConfiguration()
/// @description Constructs the default LobbyConfiguration
function LobbyConfiguration() constructor {
	map_room = rm_map_josephsfarm // the room index of the map the lobby is going to play
	
	// Game config
	game_mode_object_index = undefined // object index used to determine game mode
	teams_number = 2 // the amount of teams
	lives_init = 12 // the amount of lives/army unit the teams start with
	
	// Players config
	num_human_players = 1
	num_ai_players = 1	
}