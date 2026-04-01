if (active && subfocus) {
	//Mouse interaction
	hover = false
	click = false
	var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
	if (point_in_rectangle(mouse[0], mouse[1], left, top, left + width, top + height-1)) {
		hover = true
	}
	
	if (hover && mouse_check_button(mb_left)) {
		click = true
	}
	
	if (hover && mouse_check_button_released(mb_left)) {
		dropdown = !dropdown
	}
	
	//Click option
	if (dropdown) {
		for (var i = 0; i < ds_list_size(options); i++) {
			var option = options[|i];
			if (option.clicked) {
				option_index = i
				dropdown = false
			}
		}
		
		if (!point_in_rectangle(mouse[0], mouse[1], left, top, left + width, top + height + options_draw_height) && mouse_check_button_pressed(mb_left)) {
			dropdown = false
		}
	}
}

//Dropdown animation
var full_height = ds_list_size(options) > 0 ? ds_list_size(options)*options[|0].height : 0
options_draw_height += dropdown ? dropdown_speed : -dropdown_speed
options_draw_height = clamp(options_draw_height, 0, full_height)

//Draw options to surface
for (var i = 0; i < ds_list_size(options); i++) {
	var button = options[|i];
	button.text_colour = options_text_colour
	button.text_hover_colour = options_text_colour_hover
	button.text_click_colour = options_text_colour_click
	button.text_inactive_colour = options_text_colour_inactive
	
	button.colour = options_colour
	button.colour_hover = options_colour_hover 
	button.colour_click = options_colour_click
	button.colour_inactive = options_colour_inactive 

	button.border_colour = options_border_colour 
	button.border_hover_colour = options_border_hover_colour
	button.border_click_colour = options_border_click_colour 
	button.border_inactive_colour = options_border_inactive_colour
	button.border_alpha = options_border_alpha

	button.secborder_colour = options_secborder_colour 
	button.secborder_hover_colour = options_secborder_hover_colour
	button.secborder_click_colour = options_secborder_click_colour
	button.secborder_inactive_colour = options_secborder_inactive_colour
	button.secborder_alpha = options_secborder_alpha
	
	button.left = left
	button.top = top + height + i*button.height
	button.width = width
}

surface_resize(options_surface, left + width, top + height + options_draw_height)
surface_set_target(options_surface)
for (var i = 0; i < ds_list_size(options); i++) {
	ui_button_draw(options[|i])
}
surface_reset_target()

//Value
value = options[|option_index].text
if (ds_list_size(options) == 0) value = ""