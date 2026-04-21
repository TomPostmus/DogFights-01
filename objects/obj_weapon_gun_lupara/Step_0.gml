event_inherited()

//Modify stats
//if (mods.silencer) {
//	fire_volume -= 200
//	fire_volume_dropoff -= 500
//	sound_fire = snd_usp_fire_silenced
//}

// Update weapon state
if (instance_exists(player) && instance_exists(player.body)) {
	var init = state != state_prev
	state_prev = state
	var body = player.body
	
	if (state == "idle") {
		// Init
		if (init) {
			new_anim_draw_order("arm_right", "arm_left", "weapon", "stock")
		}
		
		// Aiming down sight
		aiming = player.input.input_attack2
		var _goal_pos_x = aiming ? ads_pos_x : neut_pos_x // goal of aiming position
		var _goal_pos_y = aiming ? ads_pos_y : neut_pos_y
		
		// Set arms animation
		with (anim_components[? "arm_right"]) {pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; 
			pos_x += (_goal_pos_x - pos_x) * 0.5 // update position smoothly to aiming position
			pos_y += (_goal_pos_y - pos_y) * 0.5}
		with (anim_components[? "arm_left"]) {pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; 
			pos_x += (_goal_pos_x + 6.44 - pos_x) * 0.5
			pos_y += (_goal_pos_y + 0.69 - pos_y) * 0.5} //pos_x=21.14; pos_y=5.39; 
		with (anim_components[? "weapon"]) {pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()
			pos_x += (_goal_pos_x + 2.51 - pos_x) * 0.5
			pos_y += (_goal_pos_y + 0.46 - pos_y) * 0.5} //pos_x=17.21; pos_y=5.16; 
		with (anim_components[? "stock"]) {pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; 
			pos_x += (_goal_pos_x - 5.47 - pos_x) * 0.5
			pos_y += (_goal_pos_y + 1.45 - pos_y) * 0.5} //pos_x=9.23; pos_y=6.15; 
		
		// Auto shot timer
		if (auto_shot_timer > 0) {
			auto_shot_timer --
		}
		
		// State guards
		if (ammo_mag == 0 && ammo_reserve > 0) {				// automatic reload on empty mag
			state = "reload_start"
		} else if (stats.mag_size - ammo_mag > 0 &&
			ammo_reserve > 0 && player.input.input_reload) {	// manual reload on reload input
			state = "reload_start"
		} else if (mods.select_fire == "select_fire" &&
			player.input.input_firemode) {						// switch firemeode
			state = "selectfire"
		} else if (trigger && fire_ready) {						// fire shot
			fire()
			if (firemode_auto) {	// set auto shot timer
				auto_shot = true
				auto_shot_timer = stats.fire_rate
			}
		} else if (auto_shot && auto_shot_timer <= 0) {			// auto shot
			fire()
			auto_shot = false
		}
	} else if (state == "reload_start") {
		// Init
		if (init) {
			anim_reset()
		}
		
		// Animation
		anim_lupara_reload_start()
		anim_frame_prev = anim_frame
		anim_frame ++
		
		// Aiming down sight
		aiming = false
		
		// Sounds
		if (anim_check_frame(73)) {
			reload_sound(snd_lupara_open)
		}
		
		// State guards
		if (anim_end) {
			state = "reload_insert"
		}
	} else if (state == "reload_insert") {
		// Init
		if (init) {
			anim_reset()
		}
		
		// Animation
		anim_lupara_reload_insert()
		anim_frame_prev = anim_frame
		anim_frame ++
		
		// Sounds
		if (anim_check_frame(19)) {
			reload_sound(snd_insert_shell)
		}
		
		// State guards
		if (anim_end) {
			reload()
			if (ammo_mag == stats.mag_size || ammo_reserve == 0) {
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
		anim_lupara_reload_end()
		anim_frame_prev = anim_frame
		anim_frame ++
		
		// Sounds
		if (anim_check_frame(9)) {
			reload_sound(snd_lupara_close)
		}
				
		// State guards
		if (anim_end) {
			state = "idle"
		}
	} else if (state == "selectfire") {
		// Init
		if (init) {
			anim_reset()
		}
		
		// Animation
		anim_lupara_selectfire()
		anim_frame_prev = anim_frame
		anim_frame ++
		
		// Switch fire mode
		if (anim_check_frame(35)) {
			firemode_auto = ! firemode_auto
			reload_sound(snd_selectfire)
		}
				
		// State guards
		if (anim_end) {
			state = "idle"
		}
	}
}