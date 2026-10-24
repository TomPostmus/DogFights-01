// Inherit the parent event
event_inherited();

// Create main window
window = create_ui(0, 0, obj_ui_window_menu_buttons_list)
obj_ui.center_window(window)
ds_list_add(windows, window)

window.title = "Choose a demo"

// Demos
demos_object_indices = object_get_children(obj_demo) // create demo list (ds_list of object indices)
//demos = ds_list_create() // list of instantiated demos

// Add buttons for demos
for (var i = 0; i < ds_list_size(demos_object_indices); i ++) {

	var _demo = create_ui(0, 0, demos_object_indices[|i]) // instantiate demo
	var _button = window.add_button()
	_button.text = _demo.name
	_button.clicked_callback = start_lobby_from_demo

}

function start_lobby_from_demo() {
	show_message("Starting demo! Yet to implement LobbyConfiguration struct.")
}