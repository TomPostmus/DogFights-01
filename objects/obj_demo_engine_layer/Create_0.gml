/// @description This demo parent object contains functionality for starting and stopping the engine without needing a lobby and game (useful for purely engine layer level demos)

/// @description On event that engine has started up (similar to Room Start)
/// @context obj_demo_engine_layer
notify_on_engine_startup = function() {
	// Override in children
}

/// @description On event that engine stops; destroy self
/// @context obj_demo_engine_layer
notify_on_engine_stop = function() {
	instance_destroy()
}

/// @description Starts engine and subscribes to engine stop event
/// @param {int} room_index The index of the room to go to
/// @context obj_demo_engine_layer
start_engine = function (_room_index) {
	
	create_controllers(obj_engine) // kick off engine
	obj_engine.start(_room_index) // go to demo room
	
	// Subscribe to engine notifications
	ds_list_add(obj_engine.observers_startup, id)
	ds_list_add(obj_engine.observers_stop, id)
	
}