/// @param dog_obj
/// @param gun_obj
function dog_gun_fire_bullet() {

	var dog = argument[0];
	var gun = argument[1];

	with (dog) {
		if (gun.trigger && gun.fire_ready) {
			var bullet_x = weapon_x + lengthdir_x(weapon_data(gun, "barrel", ATTR_X), weapon_rotation) + lengthdir_x(weapon_data(gun, "barrel", ATTR_Y), weapon_rotation - 90)
			var bullet_y = weapon_y + lengthdir_y(weapon_data(gun, "barrel", ATTR_X), weapon_rotation) + lengthdir_y(weapon_data(gun, "barrel", ATTR_Y), weapon_rotation - 90)
			var bullet = create_groundhigh(bullet_x, bullet_y, gun.ammo_type)
			bullet.rotation = weapon_rotation
			bullet.speed_x = lengthdir_x(gun.fire_speed, bullet.rotation)
			bullet.speed_y = lengthdir_y(gun.fire_speed, bullet.rotation)
			bullet.damage = gun.damage
			gun.ammo_mag -= 1
			gun.fire_ready = false
			sound_local(gun.sound_fire, bullet_x, bullet_y, gun.fire_volume, gun.fire_volume_dropoff)
			return bullet
		}
		return noone
	}


}
