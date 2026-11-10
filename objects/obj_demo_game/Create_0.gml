/// @description This demo parent object creates a demo with a certain obj_lobby and obj_game

// Inherit the parent event
event_inherited();

lobby = undefined // managed lobby object
lobby_configuration = new LobbyConfiguration()

/// @description On event that engine stops
/// @context obj_demo_game
notify_on_engine_stop = function() {
	instance_destroy(lobby)
	instance_destroy()
}

/// @function start()
/// @description Create obj_lobby from lobby_configuration from demo
/// @context obj_demo_game
function start() {
	
	lobby = create_controllers(obj_lobby, {lobby_configuration: lobby_configuration}) // kick off lobby
	lobby.start_game() // start the game
	
	// Subscribe to engine stop notification
	ds_list_add(obj_engine.observers_stop, id)
	
}