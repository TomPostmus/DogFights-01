/// @param dropdown
/// @param option_text
/// @param option_icon
function ui_dropdown_add_option() {

	var dropdown = argument[0];
	var option_text = argument[1];
	var option_icon = argument[2];

	var option = create_ui(0, 0, obj_ui_button)
	option.text = option_text
	option.icon = option_icon

	ds_list_add(dropdown.options, option)

	return option


}
