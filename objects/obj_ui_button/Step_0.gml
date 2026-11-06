if (active && subfocus) {
	//Check click
	hover = false
	click = false
	clicked = false
	var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
	if (point_in_rectangle(mouse[0], mouse[1], x, y, x + width, y + height-1)) {
		hover = true
	}
	
	if (hover && mouse_check_button(mb_left)) {
		click = true
	}
	
	if (hover && mouse_check_button_released(mb_left)) {
		clicked = true
	}
	
	if (clicked) {
		if (clicked_callback && is_method(clicked_callback))
			method_call(clicked_callback)
	}
}