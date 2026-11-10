// Inherit the parent event
event_inherited();

// Create main window
window = create_ui(0, 0, obj_ui_window_menu_buttons_list)
window.button_h = 40
obj_ui.center_window(window)
ds_list_add(windows, window)

window.title = "Choose a demo"

// Demos
demo_buttons = ds_list_create()
demo_object_indices = [ // demo list
	obj_demo_engine_layer_ai_astar_path, 
	obj_demo_game_josephs_farm_teambattle,
	obj_demo_game_teambattle_test_room,
	obj_demo_engine_layer_start_spawn_characters
]
demo_names = [ // corresponding names
	"AI player A* path example",
	"Joseph's Farm Teambattle",
	"Test Room Teambattle",
	"Team start spawn"
]

// Add buttons for demos
for (var i = 0; i < array_length(demo_object_indices); i ++) {
	
	var _button = window.add_button() // add button for demo
	_button.text = demo_names[i]
	ds_list_add(demo_buttons, _button)

}