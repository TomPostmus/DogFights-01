if (global.debug) {
	draw_set_colour(c_purple)
	with(obj_parent_physics) {
		if (height = HL.high) physics_draw_debug()
	}
	draw_set_colour(c_blue)
	with(obj_parent_physics) {
		if (height = HL.low) physics_draw_debug()
	}
}