//Synchronize viewports with cameras
for (var i = 0; i < ds_list_size(global.active_viewports); i ++) {
	var viewport = global.active_viewports[|i] // loop through active viewports
	var _player = obj_lobby.players_active[|i] // corresponding active player
	var _camera = _player.camera
	
	if (instance_exists(_camera)) {
		var gm_camera = view_get_camera(viewport); // retrieve camera that corresponds to viewport
		camera_set_view_size(gm_camera, _camera.get_width(), _camera.get_height()) // set size
		camera_set_view_pos(gm_camera, _camera.x - _camera.get_width()/2, _camera.y - _camera.get_height()/2)
	}
}

//Audio listener
if (ds_list_size(obj_lobby.players_active) == 1) { // if there is only 1 active player
	var gm_camera = view_get_camera(global.active_viewports[|0]); // gamemaker camera instance
	var _player = obj_lobby.players_active[|0]
	var _camera = _player.camera // camera instance corresponding to player
	
	if (instance_exists(_camera)) {
		audio_listener_position(_camera.x, _camera.y, 0) // update listener to camera position
		global.sound_directional = true // enable directional mode
	}
} else {
	global.sound_directional = false // undirectional mode
}