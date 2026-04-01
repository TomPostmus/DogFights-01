/// @param mapdescription
function ui_mapdescription_draw() {

	var mapdescription = argument[0];

	with (mapdescription) {
		draw_set_colour(click ? backg_click_colour : (hover ? backg_hover_colour : backg_colour))
		draw_set_alpha(backg_alpha)
		draw_rectangle(left, top, left + width, top + height, false)

		if (sprite_exists(map_sprite)) {
			draw_sprite(map_sprite, 0, left + 10, top + 10)
		}
	
		draw_set_colour(map_border_colour)
		draw_set_alpha(1)
		draw_rectangle(left + 10, top + 10, left + 110, top + 110, true)
	
		draw_set_colour(secborder_colour)
		draw_set_alpha(1)
		draw_rectangle(left+1, top+1, left + width-1, top + height-1, true)
	
		draw_set_colour(border_colour)
		draw_set_alpha(1)
		draw_rectangle(left, top, left + width, top + height, true)
	
		draw_set_colour(text_name_colour)
		draw_set_halign(fa_left)
		draw_set_font(map_name_font)
		draw_text(left + 120, top + 23, map_name)
	
		draw_set_colour(text_description_colour)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_set_font(map_description_font)
		draw_text_ext(left + 120, top + 37, map_description, 16, width - 140)
	}

	draw_set_valign(fa_center)


}
