//Check if windows exist
var active_click_outside = false
for (var i = 0; i < ds_list_size(windows); i++) {
	var window =  windows[| i]
	if (!instance_exists(window)) {
		ds_list_delete(windows, i)
		window =  windows[| i]
	}
	
	if (window == undefined || window == 0 || !instance_exists(window)) break
	window.active = i == 0;
	if (window.active && window.click_outside) active_click_outside = true
}

//Click new window
if (active_click_outside) {
	for (var i = 1; i < ds_list_size(windows); i++) {
		var window =  windows[| i]
		var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y());
		if (window.header && point_in_rectangle(mouse[0], mouse[1], window.left, window.top, window.left + window.width, window.top + window.height)) {
			ds_list_delete(windows, i)
			ds_list_insert(windows, 0, window)
			break
		}
	}
}

//Add windows that aren't in windows list
with (obj_ui_window) {
	if (ds_list_find_index(other.windows, id) == -1) {
		ds_list_add(other.windows, id)
	}
}