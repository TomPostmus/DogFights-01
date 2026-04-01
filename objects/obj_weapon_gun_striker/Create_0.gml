event_inherited()

//Stats
stats_default = {
	mag_size: 12,
	fire_mode: GUN_FMODE_AUTO,
	ammo_type: obj_bullet_pellet,
	fire_speed: 18,
	fire_rate: 15,
	fire_recoil: 7,
	fire_recoil_side: 0.5,
	fire_volume: 400,
	fire_volume_dropoff: 1000,
	damage: 70,
	sound_fire: snd_striker_fire,
	
	fire_spread: 4,
	fire_speed_var: 1,
	fire_pellets: 7
}

stats = struct_copy(stats_default)

// Mods
mods = {
	silencer: false
}

//Default state
state = "idle"
state_prev = undefined
ammo_mag = stats.mag_size
ammo_reserve = 3000

// Override anim init
function anim_init() {
	// Initialize weapon animation component
	anim_component_weapon = create_groundhigh(0, 0, obj_animcomp_weapon_striker)
	anim_component_weapon.name = "weapon"
	anim_component_weapon.player = player
	
	// Initialize arm animation components
	anim_component_arm_left = create_groundhigh(0, 0, obj_animcomp_arm_left)
	anim_component_arm_left.player = player
	anim_component_arm_right = create_groundhigh(0, 0, obj_animcomp_arm_right)
	anim_component_arm_right.player = player
}

// Implement mod stats function
function mod_stats() {
	stats = struct_copy(stats_default)
	
	if (mods.barrel == "silencer") {
		stats.fire_volume -= 200
		stats.fire_volume_dropoff -= 500
		stats.sound_fire = snd_usp_fire_silenced
		stats.fire_speed += 5
	}
}