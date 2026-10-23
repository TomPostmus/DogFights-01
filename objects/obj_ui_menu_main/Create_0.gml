// Inherit the parent event
event_inherited();

var _window_main = create_ui(0, 0, obj_ui_window_main_menu)
obj_ui.center_window(_window_main)
ds_list_add(windows, _window_main) // add main menu window to windows