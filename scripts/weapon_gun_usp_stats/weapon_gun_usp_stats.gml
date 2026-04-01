/// @param gun_obj
function weapon_gun_usp_stats() {

	var weapon = argument[0];

	with (weapon) {
		mag_size = 8
		fire_mode = GUN_FMODE_SEMI
		ammo_type = obj_bullet_medium
		fire_speed = 15
		fire_rate = 10
		fire_recoil = 3
		fire_recoil_side = 0.5
		fire_volume = 400
		fire_volume_dropoff = 1000
		recoil_recovery = 0.75
		recoil_stun_recovery = 0.9
		recoil_stun_time = 8
		data = weapon_gun_usp_data
		damage = 28
		sound_fire = snd_usp_fire
	}


}
