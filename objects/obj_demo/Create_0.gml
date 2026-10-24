name = "Untitled demo"
lobby_configuration = new LobbyConfiguration()

/// @function start()
/// @description Create obj_lobby from lobby_configuration from demo
/// @context obj_demo
function start() {
	var _vars = {lobby_configuration: lobby_configuration}
	var _lobby = create_controllers(obj_lobby, _vars) // kick off lobby
	_lobby.start_game() // start the game
}