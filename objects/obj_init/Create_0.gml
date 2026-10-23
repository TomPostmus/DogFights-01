// Randomization
randomize() // set seed to random value
global.room_index_list = generate_room_index_list()

// Kick off UI
create_controllers(obj_ui)

// Kick off obj_debug
debug = true // whether game is run in debug mode (then obj_debug is created)
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


//Initialize graphics
application_surface_draw_enable(false)
global.aspect = clamp(display_get_width()/display_get_height(), 0.5555, 2.3333)
global.height = display_get_height()
global.width = global.aspect*global.height
global.viewport_w = global.width
global.viewport_h = global.height
surface_resize(application_surface, global.width, global.height)
window_set_fullscreen(true)

//Sound
global.sound_directional = true
audio_group_load(agroup_local_sounds)
audio_falloff_set_model(audio_falloff_linear_distance_clamped)
audio_listener_orientation(0, 1, 0, 0, 0, 1)

//Next room
room_goto_next()

//Define macro's
#macro FIELD_ALPHA 0.3
#macro WINDOW_ALPHA 0.6

#macro GREY $FF545454
#macro GREY_HOVER $FF686868
#macro GREY_CLICK $FF444444
#macro GREY_SECBORDER c_gray

#macro WINDOW_RED_COLOUR c_red
#macro WINDOW_RED_PRIMCOLOUR c_red
#macro WINDOW_RED_PRIMCOLOUR_HOVER $FF3F3FFF
#macro WINDOW_RED_PRIMCOLOUR_CLICK $FF0000D3
#macro WINDOW_RED_PRIMSECBORDER $FF7C7CFF
#macro WINDOW_RED_PRIMSECBORDER_HOVER $FFC9C9FF
#macro WINDOW_RED_PRIMSECBORDER_CLICK $FFC9C9FF
#macro WINDOW_RED_SECCOLOUR $FFD64848
#macro WINDOW_RED_SECCOLOUR_HOVER $FFF45858
#macro WINDOW_RED_SECCOLOUR_CLICK $FFB73E3E

#macro WINDOW_GREEN_COLOUR $FF10A348