nr_viewports = 1
viewport_to_player = array_create(8, noone) // array mapping a viewport id to a player

/// @function activate_viewports(room_index)
/// @description Enable viewports for a given room
/// @context obj_viewport_controller
function activate_viewports(_room_index) {
	
	nr_viewports = 1 // default is one viewport
	if (instance_exists(obj_lobby))
		nr_viewports = ds_list_size(obj_lobby.players_active) // if there is the lobby, number of active players becomes number of viewports
		
	room_set_viewports(_room_index, nr_viewports) // enable viewports in ingame rooms
	
}

/// @description Follow a player with a viewport
function follow_player(_viewport_id, _player) {
	viewport_to_player[_viewport_id] = _player // set/update mapping
	
	var _camera = _player.camera
	
	if (instance_exists(_camera)) {
		var gm_camera = view_get_camera(_viewport_id); // GM camera that corresponds to viewport
		camera_set_view_size(gm_camera, _camera.get_width(), _camera.get_height()) // set size to correspond to player camera size
		camera_set_view_pos(gm_camera, _camera.x - _camera.get_width()/2, _camera.y - _camera.get_height()/2) // same for position
	}
}