function ui_window_create_exit_button() {
	exit_button = create_ui(x, y, obj_ui_button)
	exit_button.width = header_height
	exit_button.height = header_height
	exit_button.icon = spr_ui_icon_exitwindow
	exit_button.colour = header_backg_colour
	exit_button.colour_hover = $FF646466
	exit_button.colour_click = $FF474747
	exit_button.secborder_click_colour = $FF5110D3
	exit_button.secborder_hover_colour = $FF969696
	exit_button.colour_inactive = header_backg_colour
	exit_button.border_inactive_colour = c_black

	ui_window_add_element(exit_button, width - header_height-1, -1)


}
