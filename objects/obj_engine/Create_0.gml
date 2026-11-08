spawns_controller = noone
viewport_controller = noone
sound_controller = noone
particles_controller = noone
hud = noone

state = "uninitialized"

// Observers startup
observers_startup = ds_list_create()

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