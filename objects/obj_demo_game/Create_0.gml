/// @description This demo parent object creates a demo with a certain obj_lobby and obj_game

// Inherit the parent event
event_inherited();

lobby_configuration = new LobbyConfiguration()

/// @function start()
/// @description Create obj_lobby from lobby_configuration from demo
/// @context obj_demo_game
function start() {
	var _lobby = create_controllers(obj_lobby, {lobby_configuration: lobby_configuration}) // kick off lobby
	_lobby.start_game() // start the game
}