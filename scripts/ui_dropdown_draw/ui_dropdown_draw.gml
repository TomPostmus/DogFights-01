/// @param dropdown
function ui_dropdown_draw() {

	var dropdown = argument[0];

	with (dropdown) {
		var backg_colour, border_colour, button_colour;
	
		//States
		if (!active) {
			backg_colour = backg_inactive_colour
			border_colour = border_inactive_colour
			button_colour = button_colour_inactive
		} else if (click) {
			backg_colour = backg_click_colour//self.backg_colour
			border_colour = border_click_colour
			button_colour = button_colour_click
		} else if (hover) {
			backg_colour = backg_hover_colour//self.backg_colour
			border_colour = border_hover_colour
			button_colour = button_colour_hover
		} else {
			backg_colour = self.backg_colour
			border_colour = self.border_colour
			button_colour = self.button_colour
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
		var full_height = ds_list_size(options) > 0 ? ds_list_size(options)*options[|0].height : 0
		draw_set_colour(button_colour)
		draw_rectangle(left + width - height, top, left + width, top + height, false)
		draw_set_color(border_colour)
		draw_rectangle(left + width - height, top, left + width, top + height, true)
		draw_sprite_ext(button_icon, 0, left + width - height/2, top + height/2, 1, 1, ceil(180 * options_draw_height/full_height), c_white, 1)
	
		//Options
		if (options_draw_height > 1) {
			draw_surface(options_surface, 0, 0)
			draw_set_colour(border_colour)
			draw_rectangle(left, top + height, left + width, top + height + options_draw_height, true)
		}
	}


}
