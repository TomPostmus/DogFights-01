/// @param cycle
function ui_cycle_draw() {

	var cycle = argument[0];

	with (cycle) {
		var backg_colour, border_colour, button_colour;
		backg_colour = self.backg_colour
		border_colour = self.border_colour
		button_colour = self.button_colour
	
		//States
		if (!active) {
			backg_colour = backg_inactive_colour
			border_colour = self.border_inactive_colour
		} else if (clicked) {
			backg_colour = backg_clicked_colour
			border_colour = self.border_colour
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
		draw_set_halign(fa_left)
		draw_text(left + 2 + text_h_offset, top + height/2, value)
		draw_set_valign(fa_center)
	
		//Button
		button_up.width = height
		button_up.height = height/2
		button_up.left = left + width - button_up.width
		button_up.top = top
	
		ui_button_draw(button_up)
	
		button_down.width = height
		button_down.height = height/2
		button_down.left = left + width - button_down.width
		button_down.top = top + height/2
	
		ui_button_draw(button_down)
	}


}
