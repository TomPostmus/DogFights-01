event_inherited()

//Stats
stats_default = {
	mag_size: 2,
	fire_mode: GUN_FMODE_SEMI,
	ammo_type: obj_bullet_pellet,
	fire_speed: 18,
	fire_rate: 5,
	fire_recoil: 7,
	fire_recoil_side: 0.5,
	fire_volume: 400,
	fire_volume_dropoff: 1000,
	damage: 120,
	sound_fire: snd_striker_fire,
	
	fire_spread: 10,
	fire_speed_var: 1,
	fire_pellets: 7
}

stats = struct_copy(stats_default)

// Mods
mods = {
	barrel: undefined,
	select_fire: "select_fire"
}

//Default state
state = "idle"
state_prev = undefined
ammo_mag = stats.mag_size
ammo_reserve = 3000
firemode_auto = false		// whether automatic fire is enabled
auto_shot = false			// whether second shot will be fired automatically, with select fire
auto_shot_timer = 0			// timer to indicate when to shoot second shot

// Override anim init
function anim_init() {
	// Initialize weapon animation component
	anim_component_weapon = create_groundhigh(0, 0, obj_animcomp_weapon_lupara)
	anim_component_weapon.name = "weapon"
	anim_component_weapon.player = player
	
	// Initialize arm animation components
	anim_component_arm_left = create_groundhigh(0, 0, obj_animcomp_arm_left)
	anim_component_arm_left.player = player
	anim_component_arm_right = create_groundhigh(0, 0, obj_animcomp_arm_right)
	anim_component_arm_right.player = player
}

// Override reload function to transfer just 1 bullet per call
function reload() {
	if (ammo_reserve > 0) {
		ammo_reserve --
		ammo_mag ++
	}
}

// Override fire function, to create bullets at slightly different position for left and right barrel shot
function fire() {
	var body = player.body
	
	// Left barrel
	var left_barrel = ammo_mag == 2 // what barrel to shoot from
	
	// Fire location, differs per shot
	var barrel_offset = left_barrel ? 1 : -1 // for first shot, fire from left barrel, second shot right barrel
	var bullet_x = get_weapon_barrel_x(body) + lengthdir_x(barrel_offset, get_weapon_rotation(body) + 90)
	var bullet_y = get_weapon_barrel_y(body) + lengthdir_y(barrel_offset, get_weapon_rotation(body) + 90)
	
	// Create pellets, direction
	for (var i = 0; i < stats.fire_pellets; i ++) {
		var bullet = create_groundhigh(bullet_x, bullet_y, stats.ammo_type)	
		bullet.player = player												// give id of current player (shooter), for damage handling at other players
		
		if (left_barrel) {
			bullet.rotation = get_weapon_rotation(body)	+ stats.fire_spread -
				stats.fire_spread * 1.2 * (i/stats.fire_pellets) +				// spread pellets across entire spread range
				random_range(-stats.fire_spread/6, stats.fire_spread/6)			// and extra small random term
		} else {
			bullet.rotation = get_weapon_rotation(body)	+ - stats.fire_spread +
				stats.fire_spread * 1.2 * (i/stats.fire_pellets) +				// spread pellets across entire spread range
				random_range(-stats.fire_spread/6, stats.fire_spread/6)			// and extra small random term
		}
		
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