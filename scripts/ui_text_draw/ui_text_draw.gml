/// @param text_obj
function ui_text_draw() {

	var text = argument[0];

	draw_set_valign(text.valign)
	draw_set_halign(text.halign)
	draw_set_colour(text.colour)
	draw_set_font(text.font)
	draw_set_alpha(text.alpha)

	if (!text.outline) {
		if (text.line_width != -1) {
			draw_text_ext(text.left, text.top, text.text, text.line_sep, text.line_width)
		} else {
			draw_text(text.left, text.top, text.text)
		}
	} else {
		draw_text_outlined(text.left, text.top, text.text, text.colour, text.outline_colour)
	}

	draw_set_valign(fa_center)
	draw_set_colour(c_white)
	draw_set_alpha(1)


}
