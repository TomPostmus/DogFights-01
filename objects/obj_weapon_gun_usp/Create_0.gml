event_inherited()

// Stats
var _stats_default = {
	mag_size: 8,
	fire_mode: GUN_FMODE_SEMI,
	ammo_type: obj_bullet_medium,
	fire_speed: 15,
	fire_rate: 10,
	fire_recoil: 6,
	fire_recoil_side: 0.5,
	fire_volume: 400,
	fire_volume_dropoff: 1000,
	damage: 28,
	sound_fire: snd_usp_fire
}
stats_default = struct_merge(_stats_default, stats_default) // append to stats_default struct

stats = struct_functions(stats_default)

// Mod slots
mods = {
	barrel: undefined,
	sight: undefined,
	mag: undefined
}

// Init state
state = "leveraction"
state_prev = undefined
ammo_mag = stats.mag_size
ammo_reserve = 3000

// ADS pos
neut_pos_x = 20.80 // neutral position of weapon (no ADS) in relative crds
neut_pos_y = 4.80
ads_pos_x = 22 // ADS position
ads_pos_y = 3

// Override anim init
function anim_init() {
	// Initialize weapon animation component
	anim_component_weapon = create_groundhigh(0, 0, obj_animcomp_weapon_usp)
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
	stats = struct_functions(stats_default)
	
	if (mods.barrel == "silencer") {
		stats.fire_volume -= 200
		stats.fire_volume_dropoff -= 500
		stats.sound_fire = snd_usp_fire_silenced
		stats.fire_speed += 5
	}
}