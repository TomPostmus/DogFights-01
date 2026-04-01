if (instance_exists(bullet)) {
	bullet_x = bullet.x
	bullet_y = bullet.y
	bullet_rotation = bullet.rotation
}

if (colour != undefined) {
	shader_set(sh_bullet_tail)
	shader_set_uniform_f(uniform_base_colour, colour_get_red(colour), colour_get_green(colour), colour_get_blue(colour), colour_alpha)
	shader_set_uniform_f(uniform_alpha_decline, decline)
	shader_set_uniform_f(uniform_horizontal_cap, cap)

	draw_sprite_ext(spr_bullet_medium_tailmask, 0, bullet_x, bullet_y, 1, 1, bullet_rotation + 180, c_white, 1)

	shader_reset()
}