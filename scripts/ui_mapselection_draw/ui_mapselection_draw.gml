/// @param mapselection
function ui_mapselection_draw() {

	var mapselection = argument[0];

	draw_surface(mapselection.map_surface, mapselection.left, mapselection.top)

	draw_set_colour(mapselection.border_colour)
	draw_set_colour(mapselection.border_alpha)
	draw_rectangle(mapselection.left, mapselection.top, mapselection.left + mapselection.width, mapselection.top + mapselection.height, true)

	draw_set_color(c_white)
	draw_set_alpha(1)


}
