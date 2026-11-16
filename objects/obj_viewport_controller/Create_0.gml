/// @description
nr_viewports = 1
viewport_to_player = array_create(8, noone) // array mapping a viewport id to a player
viewport_mode = array_create(8, "follow_player")

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
/// @param {int} viewport_id The id of the viewport which to update the camera for
/// @param {obj_player} player The player to follow
/// @context obj_viewport_controller
function follow_player(_viewport_id, _player) {
	viewport_to_player[_viewport_id] = _player // set/update mapping
	
	var _camera = _player.camera
	
	if (instance_exists(_camera)) {
		var gm_camera = view_get_camera(_viewport_id); // GM camera that corresponds to viewport
		camera_set_view_size(gm_camera, _camera.get_width(), _camera.get_height()) // set size to correspond to player camera size
		camera_set_view_pos(gm_camera, _camera.x - _camera.get_width()/2, _camera.y - _camera.get_height()/2) // same for position
	}
}

/// @description Set the mode of a viewport to follow player
/// @param {int} viewport_id The id of the viewport for which to set the mode
/// @context obj_viewport_controller
function set_viewport_follow_player_mode(_viewport_id) {
	
	viewport_mode[_viewport_id] = "follow_player" // set mode to follow player
	
}

/// @description Set the mode of a viewport to overview, to capture the full room
/// @param {int} viewport_id The id of the viewport for which to set the mode
/// @context obj_viewport_controller
function set_viewport_overview_mode(_viewport_id) {
	
	viewport_mode[_viewport_id] = "overview"
	
	var gm_camera = view_get_camera(_viewport_id);
	
	// Determine view size to capture room, while perserving screen aspect ratio
	var _view_w, _view_h
	var _room_aspect = room_width / room_height
	if (_room_aspect >= global.aspect) {
		_view_w = room_width // fit to room width
		_view_h = _view_w / global.aspect
	} else {
		_view_h = room_height // fit to room height
		_view_w = _view_h * global.aspect
	}
	
	// Set view size and position
	camera_set_view_size(gm_camera, _view_w, _view_h) // scale and position camera to capture room
	camera_set_view_pos(gm_camera, (room_width - _view_w) / 2, (room_height - _view_h) / 2)
}