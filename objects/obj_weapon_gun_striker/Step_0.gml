event_inherited()

// Update weapon state
if (instance_exists(player) && instance_exists(player.body)) {
	var init = state != state_prev
	state_prev = state
	var body = player.body
	
	if (state == "idle") {
		// Init
		if (init) {
			new_anim_draw_order("arm_right", "arm_left", "weapon")
		}
		
		// Aiming down sight
		aiming = player.input.input_attack2
		var _goal_pos_x = aiming ? ads_pos_x : neut_pos_x // goal of aiming position
		var _goal_pos_y = aiming ? ads_pos_y : neut_pos_y
		
		// Set arms animation
		with (anim_components[? "arm_right"]) {rotation=0; sprite=spr_pip_hand; index=0; is_visible=true;
			pos_x += (_goal_pos_x - pos_x) * 0.5 // update position smoothly to aiming position
			pos_y += (_goal_pos_y - pos_y) * 0.5}
		with (anim_components[? "arm_left"]) {rotation=0; sprite=spr_pip_hand; index=0; is_visible=true; 
			pos_x += (_goal_pos_x + 8.6 - pos_x) * 0.5
			pos_y += (_goal_pos_y + 0.8 - pos_y) * 0.5} //pos_x=25.20; pos_y=5.40; 
		with (anim_components[? "weapon"]) {rotation=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()
			pos_x += (_goal_pos_x + 1.8 - pos_x) * 0.5
			pos_y += (_goal_pos_y + 0.2 - pos_y) * 0.5} //pos_x=18.40; pos_y=4.80; 
		
		// State guards
		if (ammo_mag == 0 && ammo_reserve > 0) {				// automatic reload on empty mag
			state = "reload_start"
		} else if (stats.mag_size - ammo_mag > 0 &&
			ammo_reserve > 0 && player.input.input_reload) {	// manual reload on reload input
			state = "reload_start"
		} else if (trigger && fire_ready) {						// fire shot
			fire()
		}
	} else if (state == "reload_start") {
		// Init
		if (init) {
			anim_reset()
		}
		
		// Animation
		anim_striker_reload_start()
		anim_frame_prev = anim_frame
		anim_frame ++
		
		// Aiming down sight
		aiming = false
		
		// Sounds
		if (anim_check_frame(53)) {
			reload_sound(snd_insert_shell)
		}
		
		// Reload cancel
		if (player.input.input_reload)
			reload_cancel = true
		
		// State guards
		if (anim_end) {
			reload()
			state = "reload_insert"
			if (ammo_mag == stats.mag_size || ammo_reserve == 0 || reload_cancel) {
				state = "reload_end"
			}
		}
	} else if (state == "reload_insert") {
		// Init
		if (init) {
			anim_reset()
		}
		
		// Animation
		anim_striker_reload_insert()
		anim_frame_prev = anim_frame
		anim_frame ++
		
		// Sounds
		if (anim_check_frame(19)) {
			reload_sound(snd_insert_shell)
		}
		
		// Reload cancel
		if (player.input.input_reload)
			reload_cancel = true
		
		// State guards
		if (anim_end) {
			reload()
			if (ammo_mag == stats.mag_size || ammo_reserve == 0 || reload_cancel) {
				state = "reload_end"
			} else {
				anim_reset() // loop insert action
			}
		}
	} else if (state == "reload_end") {
		// Init
		if (init) {
			anim_reset()
		}
		
		// Animation
		anim_striker_reload_end()
		anim_frame_prev = anim_frame
		anim_frame ++
		
		// State guards
		if (anim_end) {
			state = "idle"
			reload_cancel = false
		}
	}
}