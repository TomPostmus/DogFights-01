name = "Untitled demo"
lobby_configuration = new LobbyConfiguration()
players_configuration = new LobbyPlayersConfiguration()

/// @function start()
/// @description Create obj_lobby from lobby_configuration from demo
/// @context obj_demo
function start() {
	var _lobby = create_controllers(obj_lobby, {lobby_configuration: lobby_configuration}) // kick off lobby
	_lobby.start_game() // start the game
}