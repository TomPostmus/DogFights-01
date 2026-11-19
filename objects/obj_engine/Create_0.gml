spawns_controller = noone
viewport_controller = noone
sound_controller = noone
particles_controller = noone
hud = noone

state = "uninitialized"

// Observers 
observers = ds_list_create()

/// @function start(room_index)
/// @description Creates controller objects and transitions to game room
/// @param {int} room_index The room_index of the room game to go to
/// @context obj_engine
function start(_room_index) {
	
	viewport_controller = create_controllers(obj_viewport_controller)
	viewport_controller.activate_viewports(_room_index)
	
	state = "startup"
	
	room_goto(_room_index)
}

/// @description Stop engine; go back to rm_menu and destroy self
/// @context obj_engine
function stop() {
	
	// Notify observers of engine stop
	with (obj_player)
		if (variable_instance_exists(id, "notify_on_engine_stop"))
			notify_on_engine_stop()
	for (var i = 0; i < ds_list_size(observers); i ++)
		if (variable_instance_exists(observers[|i], "notify_on_engine_stop"))
			observers[|i].notify_on_engine_stop()
		
	global.engine_running = false // set global
	
	room_goto(rm_menu)
	instance_destroy()

}