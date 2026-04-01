/// @param gun_obj
function weapon_gun_striker_stats() {

	var weapon = argument[0];

	with (weapon) {
		mag_size = 12
		fire_mode = GUN_FMODE_AUTO
		ammo_type = obj_bullet_pellet
		fire_speed = 18
		fire_rate = 15
		fire_recoil = 3
		fire_recoil_side = 0.5
		fire_volume = 400
		fire_volume_dropoff = 1000
		recoil_recovery = 0.75
		recoil_stun_recovery = 0.9
		recoil_stun_time = 8
		data = weapon_gun_striker_data
		damage = 100
		sound_fire = snd_striker_fire
	
		fire_spread = 7
		fire_pellets = 7
	}


}
