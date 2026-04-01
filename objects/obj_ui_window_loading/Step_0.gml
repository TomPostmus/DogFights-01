event_inherited()

if (description) {
	if (description_obj == undefined) {
		description_obj = create_ui(0, 0, obj_ui_text)
		description_obj.font = ft_small
		description_obj.colour = c_white
		description_obj.halign = fa_left
		description_obj.valign = fa_top
		description_obj.line_width = 150
		description_obj.line_sep = 10
		ui_window_add_element(description_obj, height/2 + 32, height/2 + 3)
		ui_window_position_element(loading_text_obj, height/2 + 30, height/2 - 7)
	}
	
	description_obj.text = description_text
} else {

}