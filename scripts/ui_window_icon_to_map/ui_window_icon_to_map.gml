/// @param map_name
function ui_window_icon_to_map() {

	var map_name = argument[0];

	if (map_name == "Joseph's farm") {
		return spr_ui_map_josephsfarm
	} else if (map_name == "Ijs map") {
		return spr_ui_map_ijsmap
	} else if (map_name == "Desert map") {
		return spr_ui_map_desertmap
	}


}
