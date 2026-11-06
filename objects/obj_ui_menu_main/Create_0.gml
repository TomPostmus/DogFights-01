// Inherit the parent event
event_inherited();

// Create main window
window = create_ui(0, 0, obj_ui_window_menu_buttons_list)
obj_ui.center_window(window)
ds_list_add(windows, window) // add main menu window to windows

window.title = "DogFights"

// Add buttons
var _button_start_game = window.add_button()
_button_start_game.text = "Start game"

var _button_demos = undefined
if (obj_init.debug) { // if game runs in debug mode
	_button_demos = window.add_button() // demos become visible
	_button_demos.text = "Demos"
	_button_demos.clicked_callback = function() {obj_ui_menu_tree.step_in(obj_ui_menu_demo)}
}

var _button_settings = window.add_button()
_button_settings.text = "Settings"

var _button_exit = window.add_button()
_button_exit.text = "Exit"
_button_exit.clicked_callback = function() {game_end()}