/// @param input
function ui_input_draw() {

	var input = argument[0];

	with (input) {
		var backg_colour, border_colour
	
		//States
		if (!active) {
			backg_colour = backg_inactive_colour
			border_colour = border_inactive_colour
		} else if (self.input) {
			backg_colour = backg_input_colour
			border_colour = border_input_colour
		} else if (hover) {
			backg_colour = backg_hover_colour
			border_colour = border_hover_colour
		} else {
			backg_colour = self.backg_colour
			border_colour = self.border_colour
		}
	
		//Background
		draw_set_colour(backg_colour)
		draw_set_alpha(backg_alpha)
		draw_rectangle(left, top, left + width, top + height, false)
		draw_set_alpha(1)
	
		//Border
		draw_set_colour(border_colour)
		draw_rectangle(left, top, left + width, top + height, true)
	
		//Text
		draw_set_colour(text_colour)
		draw_set_font(text_font)
		draw_set_halign(text_halign)
		draw_set_valign(text_valign)
		draw_text(left + 2 + text_h_offset, top + height/2, text)
		draw_set_valign(fa_center)
	}

	draw_set_colour(c_white)


}
