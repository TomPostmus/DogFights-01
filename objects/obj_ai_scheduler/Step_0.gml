ai_path_timer --
if (ai_path_timer <= 0) { // reschedule all AI players
	with (obj_player_ai)
		if (instance_exists(layer_agrid))
			ds_stack_push(other.ai_path_scheduled, id)
			
	ai_path_timer = ai_path_sampletime // reset timer
}

if (!ds_stack_empty(ai_path_scheduled)) { // each frame, pop player from stack and set update flag to true
	var _player = ds_stack_pop(ai_path_scheduled)
	_player.layer_agrid.agrid_path_update = true
}
