/// @param window
function ui_focus_window() {

	var window = argument[0];

	with (obj_ui) {
		var pos = ds_list_find_index(windows, window)
		if (pos != -1) {
			ds_list_delete(windows, pos)
			ds_list_insert(windows, 0, window)
		}
	}


}
