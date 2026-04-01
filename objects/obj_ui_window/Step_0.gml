//Exit button
if (header && exit_button.clicked) {
	instance_destroy()
}

//Drag window
if (active && header && dragable) {
	var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
	if (point_in_rectangle(mouse[0], mouse[1], left, top, left + width - header_height, top + header_height)) {
		if (mouse_check_button_pressed(mb_left)) {
			drag_anchor_x = mouse[0] - left
			drag_anchor_y = mouse[1] - top
			dragging = true
		}		
	}
	
	if (dragging) {
		left = mouse[0] - drag_anchor_x
		top = mouse[1] - drag_anchor_y
	}
	
	if (!mouse_check_button(mb_left)) {
		dragging = false
	}
}

//Click outside
click_outside = false
if (active) {
	var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
	if (!point_in_rectangle(mouse[0], mouse[1], left, top, left + width, top + height)) {
		if (mouse_check_button_pressed(mb_left)) {
			click_outside = true
		}
	}
}

//Synchronize activeness
for (var i = 0; i < ds_list_size(elements); i++) {
	var element = elements[| i];
	element.active = active
}

//Give subfocus to elements
if (subfocus_element == -1) {
	for (var i = 0; i < ds_list_size(elements); i++) {
		var element = elements[|i];
		if (element.object_index == obj_ui_mapcycle) {
			if (element.drag_card != -1) {
				subfocus_element = element
				break
			}
		} else if (element.object_index == obj_ui_scrollbar) {
			if (element.dragging) {
				subfocus_element = element
				break
			}
		} else if (element.object_index == obj_ui_input) {
			if (element.input) {
				subfocus_element = element
				break
			}
		} else if (element.object_index == obj_ui_dropdown) {
			if (element.dropdown) {
				subfocus_element = element
				break
			}
		}
	}
} else {
	if (subfocus_element.object_index == obj_ui_mapcycle) {
		if (subfocus_element.drag_card == -1) {
			subfocus_element = -1
		}
	} else if (subfocus_element.object_index == obj_ui_scrollbar) {
		if (!subfocus_element.dragging) {
			subfocus_element = -1
		}
	} else if (subfocus_element.object_index == obj_ui_input) {
		if (!subfocus_element.input) {
			subfocus_element = -1
		}
	} else if (subfocus_element.object_index == obj_ui_dropdown) {
		if (!subfocus_element.dropdown) {
			subfocus_element = -1
		}
	}
}

//Handle subfocus of other elements
if (subfocus_element == -1) {
	for (var i = 0; i < ds_list_size(elements); i++) {
		elements[|i].subfocus = true
	}
} else {
	for (var i = 0; i < ds_list_size(elements); i++) {
		var element = elements[|i];
		element.subfocus = element == subfocus_element
	}
}