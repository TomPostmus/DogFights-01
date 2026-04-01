/// @param window_obj
/// @param left
/// @param top
function ui_create_window() {

	var obj = argument[0];
	var left = argument[1];
	var top = argument[2];
	if (obj != obj_ui_window && !object_is_ancestor(obj, obj_ui_window)) {
		show_error("The object type is not a window: " + object_get_name(obj), false)
	}

	var window = create_ui(0, 0, obj);
	if (left == -1) window.left = display_get_gui_width()/2 - window.width/2 else window.left = left;
	if (top == -1) window.top = display_get_gui_height()/2 - window.height/2 else window.top = top;
	ds_list_insert(obj_ui.windows, 0, window)

	return window;


}
