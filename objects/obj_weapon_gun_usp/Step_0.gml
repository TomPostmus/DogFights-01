event_inherited()

//Modify stats
/*if (mods.silencer) {
	with (stats) {
		fire_volume -= 200
		fire_volume_dropoff -= 500
		sound_fire = snd_usp_fire_silenced
	}
}*/

// Update weapon state
if (instance_exists(player) && instance_exists(player.body)) {
	var init = state != state_prev
	state_prev = state
	var body = player.body
	
	if (state == "idle") {
		// Init
		if (init) {
			new_anim_draw_order("arm_left", "arm_right", "weapon")
		}
		
		// Set arms animation
		with (anim_component_arm_left) {pos_x=0; pos_y=0; rotation=0; index=0; is_visible=true}
		with (anim_component_arm_right) {pos_x=20.80; pos_y=4.80; rotation=0; index=0; is_visible=true}
		with (anim_component_weapon) {pos_x=21.40; pos_y=5.60; rotation=0; sprite=spr_usp; index=0; is_visible=true; update_wcomponents()}
		
		// Aiming down sight
		aiming = player.input.input_attack2
	
		// State guards
		if (ammo_mag == 0 && !chambered && ammo_reserve > 0) {	// automatic reload on empty mag
			state = "reload"
		} else if (!chambered && ammo_mag > 0) {				// leveraction for empty chamber (chamber is autom. refilled after fire)
			state = "leveraction"
		} else if (stats.mag_size - ammo_mag > 0 &&
			ammo_reserve > 0 && player.input.input_reload) {	// manual reload on reload input
			state = "reload"
		} else if (chambered && trigger && fire_ready) {		// fire bullet
			fire()
		}
	} else if (state == "reload") {
		// Init
		if (init) {
			anim_reset()
		}
	
		// Leveraction animation
		anim_usp_reload()
		anim_frame_prev = anim_frame
		anim_frame ++
	
		// Sounds
		if (anim_check_frame(22)) {
			reload_sound(snd_usp_magout)
		} if (anim_check_frame(67)) {
			reload_sound(snd_usp_magin)
		}
		
		// Aiming down sight
		aiming = false
	
		// State guards
		if (anim_end) {
			reload()
			state = "idle"
		}
	} else if (state == "leveraction") {
		// Init
		if (init) {
			anim_reset()
		}
	
		// Leveraction animation
		anim_usp_leveraction()
		anim_frame_prev = anim_frame
		anim_frame ++
		
		// Sounds
		if (anim_check_frame(21)) {
			reload_sound(snd_usp_leveraction)
		}
		
		// Aiming down sight
		aiming = false
	
		// State guards
		if (anim_end) {
			chambered = true
			state = "idle"
		}
	}	
}