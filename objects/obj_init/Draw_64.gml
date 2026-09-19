draw_surface(application_surface, 0, 0)
ui_draw()

draw_set_font(ft_small)
draw_text(20, 20, fps)

// In debug mode, show DS report
if (global.debug) {
	draw_text(20, 40, $"DS lists: {ds_counts[1]}")
	draw_text(20, 60, $"DS maps: {ds_counts[2]}")
	draw_text(20, 80, $"DS paths: {ds_ns_counts[DS_NONSTANDARD_TYPES.PATH]}")
}