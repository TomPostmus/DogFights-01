//Dev shortcuts
if (keyboard_check_pressed(vk_escape)) game_end()
if (keyboard_check_pressed(vk_f1)) room_restart()
if (keyboard_check_pressed(vk_f2)) global.debug = !global.debug
if (keyboard_check_pressed(vk_f3)) {
	
	var _fullscreen = !window_get_fullscreen()
	window_set_fullscreen(_fullscreen)
	
	if (!_fullscreen) {
		alarm[0] = 1 // first resize timer
		alarm[1] = 2 // then center timer
	}
		
}

// Screenshot shortcut
if (keyboard_check_pressed(ord("Q"))) {
	screen_save($"screenshot{screenshot_i}.png")
	show_debug_message("Screenshot made!")
	screenshot_i ++
}

// Update DS report
if (global.debug) {
	ds_report_tick -- // run timer
	if (ds_report_tick <= 0) {
		ds_count_all() // do count
		ds_report_tick = ds_report_time // reset timer
	}
}