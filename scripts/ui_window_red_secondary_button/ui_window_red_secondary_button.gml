function ui_window_red_secondary_button() {
	var button = create_ui(0, 0, obj_ui_button)
	button.secborder_alpha = 0
	button.colour = WINDOW_RED_SECCOLOUR
	button.colour_hover = WINDOW_RED_SECCOLOUR_HOVER
	button.colour_click = WINDOW_RED_SECCOLOUR_CLICK

	button.border_colour = c_black
	button.border_hover_colour = c_black
	button.border_click_colour = c_black

	button.text_colour = c_white
	button.text_hover_colour = c_white
	button.text_click_colour = c_white

	return button;


}
