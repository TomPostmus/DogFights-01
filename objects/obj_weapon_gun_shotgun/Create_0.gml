event_inherited()

//Shotgun stats
/*fire_spread = undefined
fire_pellets = undefined
fire_speed_var = undefined*/

// Draw weapon state at hud (hud object given as argument)
function draw_hud(_parent) {
	var _text_w = string_width(ammo_reserve)
	var _m = _parent.cont_margin
	draw_set_valign(fa_middle)
	draw_set_halign(fa_left)
	draw_text(_parent.x + _m, _parent.y + _m+1, ammo_reserve)
	for (var i = 0; i < stats.mag_size; i ++) {
		var _subimg = i > ammo_mag-1
		draw_sprite(spr_hud_shell, _subimg, _parent.x + _m + _text_w + _m + i*12, _parent.y + _m)
	}
	
	return _m + _text_w + _m + i*12 // return width of draw contents
}

// Override fire function
function fire() {	
	var body = player.body
	
	// Fire location
	var bullet_x = get_weapon_barrel_x(body)
	var bullet_y = get_weapon_barrel_y(body)
	
	// Create pellets
	for (var i = 0; i < stats.fire_pellets; i ++) {
		var bullet = create_groundhigh(bullet_x, bullet_y, stats.ammo_type)	
		bullet.player = player												// give id of current player (shooter), for damage handling at other players
		bullet.rotation = get_weapon_rotation(body)	+ -stats.fire_spread +
			stats.fire_spread * 2* (i/stats.fire_pellets) +					// spread pellets across entire spread range
			random_range(-stats.fire_spread/6, stats.fire_spread/6)			// and extra small random term
		
		bullet.speed_x = lengthdir_x(										// set speed of bullet with random speed variation
			stats.fire_speed + random_range(-stats.fire_speed_var, stats.fire_speed_var),
			bullet.rotation
		)
		bullet.speed_y = lengthdir_y(										
			stats.fire_speed + random_range(-stats.fire_speed_var, stats.fire_speed_var),
			bullet.rotation
		)
		
		bullet.damage = stats.damage / stats.fire_pellets					// divide damage over pellets
	}
	
	ammo_mag -= 1															// take bullet from mag
	fire_ready = false														// unready gun, readying is handled in Step event
	sound_local(stats.sound_fire, bullet_x, bullet_y,						// produce gun shot sound
		stats.fire_volume, stats.fire_volume_dropoff
	)					
	
	player.appearance.fire_event = true										// notify appearance animator of fire event
	player.appearance.arms_add_force(										// add recoil to arms
		lengthdir_x(-stats.fire_recoil, get_weapon_rotation(body)),
		lengthdir_y(-stats.fire_recoil, get_weapon_rotation(body))
	)
}

// Override reload function to transfer just 1 bullet per call
function reload() {
	if (ammo_reserve > 0) {
		ammo_reserve --
		ammo_mag ++
	}
}