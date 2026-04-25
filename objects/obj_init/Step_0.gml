//Dev shortcuts
if (keyboard_check_pressed(vk_escape)) game_end()
if (keyboard_check_pressed(vk_f1)) room_restart()
if (keyboard_check_pressed(vk_f2)) global.debug = !global.debug
if (keyboard_check_pressed(vk_f3)) {
	window_set_fullscreen(!window_get_fullscreen())
	alarm[0] = 1
}
if (keyboard_check_pressed(vk_f4)) {
	screen_save("screenshot.png")
	show_debug_message("Screenshot made!")
}

//Frame count
global.frame_count ++
if (global.frame_count > 1000000) global.frame_count = 0

// Update DS report
if (global.debug) {
	ds_report_tick -- // run timer
	if (ds_report_tick <= 0) {
		ds_count_all() // do count
		ds_report_tick = ds_report_time // reset timer
	}
}