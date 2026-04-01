//Synchronize colours
button_up.colour = colour
button_up.border_colour = border_colour
button_up.secborder_colour = secborder_colour

button_up.colour_hover = colour_hover
button_up.border_hover_colour = border_hover_colour
button_up.secborder_hover_colour = secborder_hover_colour

button_up.colour_click = colour_click
button_up.border_click_colour = border_click_colour
button_up.secborder_click_colour = secborder_click_colour

bar.colour = colour
bar.border_colour = border_colour
bar.secborder_colour = secborder_colour

bar.colour_hover = colour_hover
bar.border_hover_colour = border_hover_colour
bar.secborder_hover_colour = secborder_hover_colour

bar.colour_click = colour_click
bar.border_click_colour = border_click_colour
bar.secborder_click_colour = secborder_click_colour

button_down.colour = colour
button_down.border_colour = border_colour
button_down.secborder_colour = secborder_colour

button_down.colour_hover = colour_hover
button_down.border_hover_colour = border_hover_colour
button_down.secborder_hover_colour = secborder_hover_colour

button_down.colour_click = colour_click
button_down.border_click_colour = border_click_colour
button_down.secborder_click_colour = secborder_click_colour

//Synchronize activeness
button_up.active = active
button_down.active = active
bar.active = active
button_up.subfocus = subfocus
button_down.subfocus = subfocus
bar.subfocus = subfocus

if (active && subfocus) {
	if (bar.click && dragging = false) {
		var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
		dragging = true
		drag_anchor_y = mouse[1] - bar.top
	}

	if (dragging) {
		button_up.subfocus = false
		button_down.subfocus = false
		
		var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y()) 
		bar.click = true
		var diff = ((mouse[1] - drag_anchor_y) - bar.top)/(height - button_up.height - button_down.height - parts_margin*2)
		scroll_value += diff
	
		scroll_value = clamp(scroll_value, 0, 1)
	
		if (mouse_check_button_released(mb_left)) {
			dragging = false
		}
	}
	
	//Scroll zone
	if (scroll_zone_width > 0 && scroll_zone_height > 0) {
		var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
		if (point_in_rectangle(mouse[0], mouse[1], scroll_zone_left, scroll_zone_top, scroll_zone_left + scroll_zone_width, scroll_zone_top + scroll_zone_height)) {
			var scroll_speed = 0.2
			scroll_value += scroll_speed*mouse_wheel_down() - scroll_speed*mouse_wheel_up()
			scroll_value = clamp(scroll_value, 0, 1)
		}
	}
	
	//Scroll buttons
	var scroll_speed = 0.2
	scroll_value += scroll_speed*button_down.clicked - scroll_speed*button_up.clicked
	scroll_value = clamp(scroll_value, 0, 1)
}