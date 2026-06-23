draw_surface(application_surface, 0, 0)
ui_draw()

draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(ft_small)
draw_text(20, 20, fps)

// In debug mode, show DS report
if (global.debug) {
	draw_text(20, 40, $"DS lists: {lists}")
	draw_text(20, 60, $"DS maps: {maps}")
	draw_text(20, 80, $"DS paths: {paths}")
}