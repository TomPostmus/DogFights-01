if (instance_exists(bullet)) {
	bullet_speed_x = bullet.speed_x
	bullet_speed_y = bullet.speed_y
} else if (bullet_speed_x != undefined) {
	colour_alpha -= point_distance(0, 0, bullet_speed_x, bullet_speed_y) * decline
	if (colour_alpha <= 0) instance_destroy()
} else {
	instance_destroy()
}