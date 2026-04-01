/// @param element
/// @param left
/// @param top
function ui_window_add_element() {

	var element = argument[0];
	var left = argument[1];
	var top = argument[2];

	var button_coord = array_create(2);
	button_coord[0] = left
	button_coord[1] = top

	ds_list_add(elements, element)
	ds_map_add(element_positions, element, button_coord)


}
