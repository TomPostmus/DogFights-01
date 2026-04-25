//Config
draw_set_valign(fa_center)
randomize()
application_surface_draw_enable(false)
global.central_server_base = "http://localhost:8080"
global.debug = false
global.room_index_list = generate_room_index_list()
global.key_binds = ds_map_create()
global.key_actions = ds_map_create()
global.frame_count = 0
global.debug_print_count = 0

//Set keybinds
default_keys()

//Initialize graphics
global.aspect = clamp(display_get_width()/display_get_height(), 0.5555, 2.3333)
global.height = display_get_height()
global.width = global.aspect*global.height
global.viewport_w = global.width
global.viewport_h = global.height
window_set_fullscreen(true)
//window_set_position(window_get_x(), -1500) // move to second screen (above)
room_set_viewports(rm_test, 2)
room_set_viewports(rm_map_josephsfarm, 2)
surface_resize(application_surface, global.width, global.height)

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

//Run multiple shells
var shell_count = 2;
var param_count = parameter_count()
if (param_count < 2 + shell_count) {
	var params = "";
	for (var i = 1; i < param_count+1; i ++) {
		if (i == 2) {
			params += "\"" + parameter_string(i) + "\" "
		} else {
			params += parameter_string(i) + " "
		}
	}
	
	params += " -secondary "
	
	shell_execute(parameter_string(0), params)
	window_set_caption("Shell " + string(param_count - 2))
} else if (param_count == 2 + shell_count) {
	window_set_caption("Shell " + string(param_count - 2))
}

lists = 0
maps = 0
paths = 0
ds_report_tick = 0
ds_report_time = 60

// Count datastructures for DS report (useful for spotting memory leaks)
function ds_count_all() {
	var max_check = 20000;
	lists = 0;
	maps = 0;
	paths = 0;
	for (var i = 0; i < max_check; i ++) {
		if (ds_exists(i, ds_type_list)) lists ++
		if (ds_exists(i, ds_type_map)) maps ++
		if (path_exists(i)) paths ++
	}
}