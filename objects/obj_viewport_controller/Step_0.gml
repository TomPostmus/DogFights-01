// Follow active player with viewport
if (instance_exists(obj_lobby)) {
	for (var i = 0; i < nr_viewports; i ++) {
		if (i >= ds_list_size(obj_lobby.players_active)) // if less active players than viewports, break
			break
			
		follow_player(i, obj_lobby.players_active[|i]) // follow corresponding active player
	}
// Otherwise follow first best player with a camera
} else {
	var _vp_i = 0
	with (obj_player) {
		if (instance_exists(camera)) {
			other.follow_player(_vp_i, id)
			_vp_i ++
		}
		
		if (_vp_i >= other.nr_viewports)
			break
	}
}

//Audio listener
if (nr_viewports == 1) { // if there is only 1 active viewport
	var _gm_camera = view_get_camera(0); // GM camera of 1st viewport
	var _camera_cx = camera_get_view_x(_gm_camera) + camera_get_view_width(_gm_camera)/2 // center position of camera
	var _camera_cy = camera_get_view_y(_gm_camera) + camera_get_view_height(_gm_camera)/2
	
	audio_listener_position(_camera_cx, _camera_cy, 0) // update listener to camera position
}