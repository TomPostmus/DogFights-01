/// @description Sound

if (emitter != undefined && audio_emitter_exists(emitter)) {
	audio_emitter_position(emitter, x, y, 0)
	sound_inst = audio_play_sound_on(emitter, sound, loop, 1)
	alarm[1] = audio_sound_length(sound_inst) * game_get_speed(gamespeed_fps)
} else if (dist_min != undefined && dist_max != undefined) {
	
	sound_inst = audio_play_sound(sound, 1, loop)
	var gain = 0;
	var min_dist = undefined
	
	for (var i = 0; i < obj_viewport_controller.nr_viewports; i ++) {
		var _gm_camera = view_get_camera(i)
		var _camera_cx = camera_get_view_x(_gm_camera) + camera_get_view_width(_gm_camera)/2 // center position of camera
		var _camera_cy = camera_get_view_y(_gm_camera) + camera_get_view_height(_gm_camera)/2
		
		var dist = point_distance(x, y, _camera_cx, _camera_cy);
		if (min_dist = undefined || dist < min_dist) {
			min_dist = dist
			gain = clamp(1 - (dist-dist_min)/(dist_max-dist_min), 0, 1)
		}
	}
	
	gain = clamp(power(250, gain-1) - 0.005, 0, 1)
	audio_sound_gain(sound_inst, gain, 0)
	alarm[1] = audio_sound_length(sound_inst) * game_get_speed(gamespeed_fps)
}