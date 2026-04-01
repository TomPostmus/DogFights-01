/// @param sound
/// @param position_x
/// @param position_y
/// @param volume
/// @param volume_dropoff
/// @param loop*
function sound_local() {

	var sound = argument[0];
	var pos_x = argument[1];
	var pos_y = argument[2];
	var volume = argument[3];
	var drop = argument[4];
	var loop = false;
	if (argument_count > 5) loop = argument[5]

	var sound_obj = create_sound(pos_x, pos_y, obj_sound_local);

	if (global.sound_directional) {
		var emitter = audio_emitter_create();
		audio_emitter_falloff(emitter, volume, clamp(drop, volume+50, 10000), 1)
		sound_obj.emitter = emitter
	} else {
		sound_obj.dist_min = volume
		sound_obj.dist_max = clamp(drop, volume+50, 10000)
	}

	sound_obj.sound = sound
	sound_obj.loop = loop

	return sound


}
