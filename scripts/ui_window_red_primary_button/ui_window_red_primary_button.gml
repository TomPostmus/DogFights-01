function ui_window_red_primary_button() {
	var button = create_ui(0, 0, obj_ui_button)
	button.colour = WINDOW_RED_PRIMCOLOUR
	button.colour_hover = WINDOW_RED_PRIMCOLOUR_HOVER
	button.colour_click = WINDOW_RED_PRIMCOLOUR_CLICK

	button.secborder_colour = WINDOW_RED_PRIMSECBORDER
	button.secborder_hover_colour = WINDOW_RED_PRIMSECBORDER_HOVER
	button.secborder_click_colour = c_black

	button.border_colour = c_black
	button.border_hover_colour = c_black
	button.border_click_colour = WINDOW_RED_PRIMSECBORDER_CLICK

	button.text_colour = c_white
	button.text_hover_colour = c_white
	button.text_click_colour = c_white

	return button;


}
