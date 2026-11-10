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

text_colour = c_white

// Set shape
width = 400
height = 500
corner_size = 15
update_vertices()

// Helper functionality to create button
margin = 10
button_h = 70 // height of buttons
button_y = 0 // accumulated y position
function add_button() {
	var _button = create_ui(0, 0, obj_ui_button)
	_button.width = 400 - margin * 2
	_button.height = button_h
	_button.text_font = ft_menu_title
	
	ds_list_add(elements, _button) // add to elements
	element_positions[? _button] = [margin, 30 + margin + button_y]	
	button_y += _button.height + margin // move accumulated y position down
	
	return _button
}