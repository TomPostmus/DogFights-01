function ui_draw() {	
	with (obj_ui) {
		for (var i = ds_list_size(windows)-1; i >= 0; i--) {
			var window =  windows[| i]
			if (instance_exists(window)) {
				ui_window_draw(window)
			}
		}
	}
}
