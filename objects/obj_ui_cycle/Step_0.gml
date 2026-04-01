button_up.colour = button_colour
button_up.colour_hover = button_colour_hover
button_up.colour_click = button_colour_click

button_up.border_colour = button_border_colour
button_up.border_hover_colour = button_border_hover_colour
button_up.border_click_colour = button_border_click_colour

button_down.colour = button_colour
button_down.colour_hover = button_colour_hover
button_down.colour_click = button_colour_click

button_down.border_colour = button_border_colour
button_down.border_hover_colour = button_border_hover_colour
button_down.border_click_colour = button_border_click_colour

button_down.active = active
button_up.active = active
button_down.subfocus = subfocus
button_up.subfocus = subfocus

clicked = button_down.clicked || button_up.clicked

//Value
value = ""
if (ds_list_size(options) > 0) {
	value = options[|option_index]
	if (button_up.clicked) option_index ++ 
	if (button_down.clicked) option_index --
	option_index = option_index mod ds_list_size(options)
	if (option_index < 0) option_index = ds_list_size(options)-1
}