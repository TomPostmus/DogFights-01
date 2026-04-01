if (surface_get_width(map_surface) != width || surface_get_height(map_surface) != height) {
	surface_resize(map_surface, width, height)
}

//Check mouse actions
click = false
clicked = false
hover_index = -1
var description_height = maps[|0].height
var mouse = window_to_gui_coordinates(window_mouse_get_x(), window_mouse_get_y())
if (point_in_rectangle(mouse[0], mouse[1], left, top, left + width - 30, top + height)) {
	hover_index = floor((mouse[1] - top - ceil(scroll_value*(height - ds_list_size(maps)*description_height)))/description_height)
	hover_index = clamp(hover_index, 0, ds_list_size(maps)-1)
	click = mouse_check_button(mb_left)
	clicked = maps[|hover_index].hover && mouse_check_button_released(mb_left)
}

//Hover & click state
for (var i = 0; i < ds_list_size(maps); i ++) {
	maps[|i].hover = false
	maps[|i].click = false
}

if (active && subfocus) {
	for (var i = 0; i < ds_list_size(maps); i ++) {
		maps[|i].hover = hover_index == i
		maps[|i].click = hover_index == i && click
	}
}

//Draw descriptions to surface
surface_set_target(map_surface)

var description_height = maps[|0].height
for (var i = 0; i < ds_list_size(maps); i ++) {
	maps[|i].width = width
	maps[|i].left = 0
	maps[|i].top = i*description_height + ceil(scroll_value*(height - ds_list_size(maps)*description_height))
	ui_mapdescription_draw(maps[|i])
}

surface_reset_target()