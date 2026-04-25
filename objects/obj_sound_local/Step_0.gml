//Update gain for non-directional sound
if (sound_inst != undefined && emitter == undefined && dist_min != undefined && dist_max != undefined) {
	var gain = 0;
	var min_dist = undefined
	for (var i = 0; i < ds_list_size(global.active_viewports); i ++) {
		var viewport = global.active_viewports[|i];
		var _player = obj_lobby.players_active[|i] // corresponding active player
		var _camera = _player.camera
		if (instance_exists(_camera)) {
			var dist = point_distance(x, y, _camera.x, _camera.y);
			if (min_dist = undefined || dist < min_dist) {
				min_dist = dist
				gain = clamp(1 - (dist-dist_min)/(dist_max-dist_min), 0, 1)
			}
		}
	}
	gain = clamp(power(250, gain-1) - 0.005, 0, 1)
	audio_sound_gain(sound_inst, gain, 0)
}