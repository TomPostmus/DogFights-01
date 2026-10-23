/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

backg_colour = c_gray
backg_alpha = 1
border_colour = c_black

dragable = false // stationary window
header = false // no title and exit button
has_title = true
title = "Main menu"

text_colour = c_white

// Set shape
width = 400
height = 500
corner_size = 15
update_vertices()

// Helper functionality to create button
margin = 10
button_h = 0
function add_button() {
	var _button = create_ui(0, 0, obj_ui_button)
	_button.width = 400 - margin * 2
	_button.height = 70
	_button.text_font = ft_menu_title
	
	ds_list_add(elements, _button) // add to elements
	element_positions[? _button] = [margin, 30 + margin + button_h]	
	button_h += _button.height + margin // move accumulated h position down
	
	return _button
}

// Add buttons
button_start_game = add_button()
button_start_game.text = "Start game"

button_demos = undefined
if (obj_init.debug) { // if game runs in debug mode
	button_demos = add_button() // demos become visible
	button_demos.text = "Demos"
}

button_settings = add_button()
button_settings.text = "Settings"

button_exit = add_button()
button_exit.text = "Exit"
button_exit.clicked_callback = function() {game_end()}