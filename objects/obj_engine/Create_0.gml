spawns_controller = undefined
viewport_controller = undefined
sound_controller = undefined
particles_controller = undefined
hud = undefined

/// @function start(room_index)
/// @description Creates controller objects and transitions to game room
/// @param {int} room_index The room_index of the room game to go to
/// @context obj_engine
function start(_room_index) {
	viewport_controller = create_controllers(obj_viewport_controller)
	spawns_controller = create_controllers(obj_spawns_controller)
	
	viewport_controller.activate_viewports(_room_index)
	
	room_goto(_room_index)
}