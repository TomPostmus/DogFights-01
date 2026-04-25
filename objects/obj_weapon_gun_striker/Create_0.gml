event_inherited()

//Stats
var _stats_default = {
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
stats_default = struct_merge(_stats_default, stats_default) // append to stats_default struct

stats = struct_functions(stats_default)

// Mods
mods = {
	barrel: undefined,
}

//Default state
state = "idle"
state_prev = undefined
ammo_mag = stats.mag_size
ammo_reserve = 3000

// ADS pos
neut_pos_x = 16.60 // neutral position of right hand (no ADS) in relative crds
neut_pos_y = 4.60
ads_pos_x = 18 // ADS position
ads_pos_y = 3

// Draw weapon state at hud (hud object given as argument)
function draw_hud(_parent) {
	var _mag_size = stats.mag_size
	var _text_w = string_width(ammo_reserve)
	draw_text(_parent.x + 10, _parent.y + 10, ammo_reserve)
	for (var i = 0; i < _mag_size; i ++) {
		var _subimg = i > ammo_mag-1
		var _xp = (i - (i >= _mag_size/2) * _mag_size/2) * 12
		var _yp = (i >= _mag_size/2) * 6
		draw_sprite(spr_hud_shell_striker, _subimg, _parent.x + 10 + _text_w + 10 + _xp, _parent.y + 10 + _yp)
	}
	
	return 10 + _text_w + 10 + _mag_size/2*12 // return width of draw contents
}


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
	stats = struct_functions(stats_default)
	
	if (mods.barrel == "silencer") {
		stats.fire_volume -= 200
		stats.fire_volume_dropoff -= 500
		stats.sound_fire = snd_usp_fire_silenced
		stats.fire_speed += 5
	}
}