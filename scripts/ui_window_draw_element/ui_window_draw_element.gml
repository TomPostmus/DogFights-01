/// @param element
function ui_window_draw_element() {

	var element = argument[0];

	if (element.object_index == obj_ui_button || object_is_ancestor(element.object_index, obj_ui_button)) {
		ui_button_draw(element)
	} else if (element.object_index == obj_ui_line || object_is_ancestor(element.object_index, obj_ui_line)) {
		ui_line_draw(element)
	} else if (element.object_index == obj_ui_text || object_is_ancestor(element.object_index, obj_ui_text)) {
		ui_text_draw(element)
	} else if (element.object_index == obj_ui_mapcycle || object_is_ancestor(element.object_index, obj_ui_mapcycle)) {
		ui_mapcycle_draw(element)
	} else if (element.object_index == obj_ui_scrollbar || object_is_ancestor(element.object_index, obj_ui_scrollbar)) {
		ui_scrollbar_draw(element)
	} else if (element.object_index == obj_ui_mapselection || object_is_ancestor(element.object_index, obj_ui_mapselection)) {
		ui_mapselection_draw(element)
	} else if (element.object_index == obj_ui_container || object_is_ancestor(element.object_index, obj_ui_container)) {
		ui_container_draw(element)
	} else if (element.object_index == obj_ui_input || object_is_ancestor(element.object_index, obj_ui_input)) {
		ui_input_draw(element)
	} else if (element.object_index == obj_ui_gamemodeselection || object_is_ancestor(element.object_index, obj_ui_gamemodeselection)) {
		ui_gamemodeselection_draw(element)
	} else if (element.object_index == obj_ui_dropdown || object_is_ancestor(element.object_index, obj_ui_dropdown)) {
		ui_dropdown_draw(element)
	} else if (element.object_index == obj_ui_cycle || object_is_ancestor(element.object_index, obj_ui_cycle)) {
		ui_cycle_draw(element)
	} else if (element.object_index == obj_ui_loader || object_is_ancestor(element.object_index, obj_ui_loader)) {
		ui_loader_draw(element)
	}


}
