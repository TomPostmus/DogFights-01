/// @param display_x_pos
/// @param display_y_pos
function display_to_gui_coordinates() {

	var x_pos = argument[0];
	var y_pos = argument[1];

	var return_tuple = array_create(2)
	return_tuple[0] = (x_pos/global.width)*display_get_gui_width()
	return_tuple[1] = (y_pos/global.height)*display_get_gui_height()

	return return_tuple


}
