/// @param gamemodedescription
function ui_gamemodedescription_draw() {

	var gamemodedescription = argument[0];

	with (gamemodedescription) {
		draw_set_colour(click ? backg_click_colour : (hover ? backg_hover_colour : backg_colour))
		draw_set_alpha(backg_alpha)
		draw_rectangle(left, top, left + width, top + height, false)

		if (sprite_exists(gamemode_sprite)) {
			draw_sprite(gamemode_sprite, 0, left + 10, top + 10)
		}
	
		draw_set_colour(gamemode_border_colour)
		draw_set_alpha(1)
		draw_rectangle(left + 10, top + 10, left + 10 + icon_size, top + 10 + icon_size, true)
	
		draw_set_colour(secborder_colour)
		draw_set_alpha(1)
		draw_rectangle(left+1, top+1, left + width-1, top + height-1, true)
	
		draw_set_colour(border_colour)
		draw_set_alpha(1)
		draw_rectangle(left, top, left + width, top + height, true)
	
		draw_set_colour(text_name_colour)
		draw_set_halign(fa_left)
		draw_set_font(gamemode_name_font)
		draw_text(left + icon_size + 20, top + 23, gamemode_name)
	
		draw_set_colour(text_description_colour)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_set_font(gamemode_description_font)
		draw_text_ext(left + 10, top + 20 + icon_size, gamemode_description, 16, width - 20 - 20)
	}

	draw_set_valign(fa_center)


}
