//Initialize graphics
application_surface_draw_enable(false)
global.aspect = clamp(display_get_width()/display_get_height(), 0.5555, 2.3333)
global.height = display_get_height()
global.width = global.aspect*global.height
global.viewport_w = global.width
global.viewport_h = global.height
surface_resize(application_surface, global.width, global.height)
window_set_fullscreen(true)
alarm[0] = 1 // set timer for kicking off UI, delay is needed for application surface to update

// Randomization
randomize() // set seed to random value

// Kick off obj_debug
debug = false // whether game runs in debug mode (then obj_debug is created) or release mode
if (debug)
	create_controllers(obj_debug)
	
// Kick off obj_settings
create_controllers(obj_settings)

// In-game function
// TODO: replace by if instance_exists(obj_engine) everywhere
global.ingame_rooms = [rm_map_josephsfarm, rm_test, rm_ai_demo_landmark_and_engage]
global.ingame = function() {
	return array_contains(global.ingame_rooms, room)
} // whether we are in an in-game room

//Sound
global.sound_directional = true
audio_group_load(agroup_local_sounds)
audio_falloff_set_model(audio_falloff_linear_distance_clamped)
audio_listener_orientation(0, 1, 0, 0, 0, 1)