event_inherited()

// Weapon stats
/*ammo_type : undefined,
mag_size : undefined,
fire_mode : undefined,
fire_speed : undefined,
fire_rate : undefined,
fire_recoil : undefined,
fire_recoil_side : undefined,
fire_volume : undefined,
fire_volume_dropoff : undefined,
recoil_recovery : undefined,
recoil_stun_time : undefined,
recoil_stun_recovery : undefined,
damage : undefined,
sound_fire : undefined,*/

// Default stats (same for all guns)
var _stats_default = {
	aim_dist: 30 // displacement of camera when ADS
}
stats_default = struct_merge(_stats_default, stats_default) // append to stats_default struct

// Weapon state
ammo_reserve = 0
ammo_mag = 0
trigger = false
fire_ready = false
fire_readying_tick = 0
chambered = false

// Fire bullet
function fire() {
	var body = player.body
	
	// Fire location
	var bullet_x = get_weapon_barrel_x(body)
	var bullet_y = get_weapon_barrel_y(body)
	
	// Create bullet
	var bullet = create_groundhigh(bullet_x, bullet_y, stats.ammo_type)	
	bullet.player = player												// give id of current player (shooter), for damage handling at other players
	bullet.rotation = get_weapon_rotation(body)							// give correct rotation and speed
	bullet.speed_x = lengthdir_x(stats.fire_speed, bullet.rotation)		// set speed of bullet
	bullet.speed_y = lengthdir_y(stats.fire_speed, bullet.rotation)
	bullet.damage = stats.damage										// give damage
	
	ammo_mag -= 1														// take bullet from mag
	fire_ready = false													// unready gun, readying is handled in Step event
	sound_local(stats.sound_fire, bullet_x, bullet_y,					// produce gun shot sound
		stats.fire_volume, stats.fire_volume_dropoff
	)					
	
	player.appearance.fire_event = true									// notify appearance animator of fire event
	player.appearance.arms_add_force(									// add recoil to arms
		lengthdir_x(-stats.fire_recoil, get_weapon_rotation(body)),
		lengthdir_y(-stats.fire_recoil, get_weapon_rotation(body))
	)
	
	if (ammo_mag == 0) chambered = false								// if mag is empty, chamber is not refilled (refilling of chamber is implied by code, since chamber must be full on function call)
}


// Transfer bullets from reserve to mag
function reload() {
	var transfer = min(stats.mag_size - ammo_mag, ammo_reserve);
	ammo_reserve -= transfer
	ammo_mag += transfer
}

// Create reload sound at weapon
function reload_sound(_sound_index) {
	var body = player.body
	
	sound_local(_sound_index, get_weapon_x(body), get_weapon_y(body), 200, 500)
}

// Useful getters
function get_weapon_barrel_x(_body) {
	if (instance_exists(anim_component_weapon)) {
		
		// Check barrel mod sprite for shifted barrel position
		var barrel_mod = mods.barrel
		if (barrel_mod != undefined && ds_map_exists(anim_component_weapon.wcomponents, barrel_mod)) {
			var mod_sprite = anim_component_weapon.wcomponents[? barrel_mod].sprite
			if (mod_sprite != undefined)
				return anim_component_weapon.wcomponents[? "barrel"].get_x(_body) +
					lengthdir_x(sprite_get_width(mod_sprite), get_weapon_rotation(_body))
		}
		
		// Otherwise return barrel component position
		return anim_component_weapon.wcomponents[? "barrel"].get_x(_body)
	}
}

function get_weapon_barrel_y(_body) {
	if (instance_exists(anim_component_weapon)) {
		
		// Check barrel mod sprite for shifted barrel position
		var barrel_mod = mods.barrel
		if (barrel_mod != undefined && ds_map_exists(anim_component_weapon.wcomponents, barrel_mod)) {
			var mod_sprite = anim_component_weapon.wcomponents[? barrel_mod].sprite
			if (mod_sprite != undefined)
				return anim_component_weapon.wcomponents[? "barrel"].get_y(_body) +
					lengthdir_y(sprite_get_width(mod_sprite), get_weapon_rotation(_body))
		}
		
		// Otherwise return barrel component position
		return anim_component_weapon.wcomponents[? "barrel"].get_y(_body)
	}
}

// Get fire unready returns true when reloading (or any other action) weapon
function get_fire_unready() {
	return state != "idle"
}