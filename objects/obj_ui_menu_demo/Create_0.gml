// Inherit the parent event
event_inherited();

// Create main window
window = create_ui(0, 0, obj_ui_window_menu_buttons_list)
window.button_h = 40
obj_ui.center_window(window)
ds_list_add(windows, window)

window.title = "Choose a demo"

// Demos
demos = ds_list_create() // list of instantiated demos
demo_buttons = ds_list_create()

// Add buttons for demos
var _demo_object_indices = object_get_children(obj_demo) // get demo list (ds_list of object indices)
for (var i = 0; i < ds_list_size(_demo_object_indices); i ++) {

	var _demo = create_ui(0, 0, _demo_object_indices[|i]) // instantiate demo
	ds_list_add(demos, _demo)
	
	var _button = window.add_button() // add button for demo
	_button.text = _demo.name
	ds_list_add(demo_buttons, _button)

}
ds_list_destroy(_demo_object_indices)