if (active && subfocus) {
	//Mouse interaction
	hover = false
	var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
	if (point_in_rectangle(mouse[0], mouse[1], left, top, left + width, top + height)) {
		hover = true
		
		if (!input && mouse_check_button_pressed(mb_left)) {
			input = true
			keyboard_string = text
		}
	}
	
	if (input) {
		keyboard_string = string_copy(keyboard_string, 1, text_maxchar)
		text = keyboard_string
		
		if ((!hover && mouse_check_button_pressed(mb_left)) || (!can_newline && keyboard_check(vk_enter))) {
			input = false
		}
	}
} else {
	input = false
}