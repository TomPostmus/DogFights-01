enum GAME_MODE {
	TEAMBATTLE,
	FFA
}

/// @function LobbyConfiguration()
/// @description Constructs the default LobbyConfiguration
function LobbyConfiguration() constructor {
	game_mode_object_index = undefined // object index used to determine game mode
	num_human_players = 1 // number of human players for splitscreen
	num_ai_players = 1 // number of AI players
	map_room = rm_map_josephsfarm // the room index of the map the lobby is going to play
	teams_number = 2 // the amount of teams
	army_size = 12 // the amount of lives/army unit the teams start with
}