//Synchronize viewports with cameras
for (var i = 0; i < ds_list_size(global.active_viewports); i ++) {
	var viewport = global.active_viewports[|i];
	var camera = global.viewport_to_camera[?viewport];
	if (camera != undefined && instance_exists(camera)) {
		var gm_camera = view_get_camera(viewport); // retrieve camera that corresponds to viewport
		camera_set_view_size(gm_camera, camera.get_width(), camera.get_height()) // set size
		camera_set_view_pos(gm_camera, camera.x - camera.get_width()/2, camera.y - camera.get_height()/2)
	} else {
		global.viewport_to_camera[?viewport] = instance_find(obj_camera, i) // assign camera to viewport
	}
}

//Audio listener
if (ds_list_size(global.active_viewports) == 1) {
	var gm_camera = view_get_camera(global.active_viewports[|0]);
	var camera = global.viewport_to_camera[?global.active_viewports[|0]];
	if (camera != undefined && instance_exists(camera)) {
		audio_listener_position(camera.x, camera.y, 0)
		global.sound_directional = true
	}
} else {
	global.sound_directional = false
}