/// @param gamemodeselection
function ui_gamemodeselection_draw() {

	var gamemodeselection = argument[0];

	draw_surface(gamemodeselection.gamemode_surface, gamemodeselection.left, gamemodeselection.top)

	draw_set_colour(gamemodeselection.border_colour)
	draw_set_colour(gamemodeselection.border_alpha)
	draw_rectangle(gamemodeselection.left, gamemodeselection.top, gamemodeselection.left + gamemodeselection.width, gamemodeselection.top + gamemodeselection.height, true)

	draw_set_color(c_white)
	draw_set_alpha(1)


}
