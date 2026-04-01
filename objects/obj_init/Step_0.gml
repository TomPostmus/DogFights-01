//Dev shortcuts
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
if (keyboard_check_pressed(vk_escape)) game_end()

//Data structure report
//if (keyboard_check_pressed(vk_f4)) {
//	var max_check = 20000;
//	var lists = 0;
//	var maps = 0;
//	var paths = 0;
//	for (var i = 0; i < max_check; i ++) {
//		if (ds_exists(i, ds_type_list)) lists ++
//		if (ds_exists(i, ds_type_map)) maps ++
//		if (path_exists(i)) paths ++
//	}
//	show_message("There are " + (lists > max_check ? (string(lists) + " (or more)") : string(lists)) + " lists. ")
//	show_message("There are " + (maps > max_check ? (string(maps) + " (or more)") : string(maps)) + " maps. ")
//	show_message("There are " + (paths > max_check ? (string(paths) + " (or more)") : string(paths)) + " paths. ")
//}

//Switch camera
if (keyboard_check_pressed(vk_f5) && instance_exists(obj_viewport_controller)) {
	var viewport = global.active_viewports[|0];
	var camera = global.viewport_to_camera[?viewport];
	if (camera != undefined && instance_exists(camera)) {
		for (var i = 0; i < instance_number(obj_camera); i ++) {
			if (instance_find(obj_camera, i) == camera) break
		}
		global.viewport_to_camera[?viewport] = instance_find(obj_camera, (i+1) mod instance_number(obj_camera))
	}
}

//Frame count
global.frame_count ++
if (global.frame_count > 1000000) global.frame_count = 0