event_inherited()

ui_window_create_exit_button()

var button = create_ui(0, 0, obj_ui_button);
button.width = 60
button.height = 20
button.left = 400 - button.width
button.top = 300 - button.height
button.text = "Sok"
button.icon = spr_ui_icon_checkmark
button.text_h_offset = -4

button.colour = $FF18E0B8
button.border_colour = c_black
button.secborder_colour = $FF15967C

button.colour_hover = $FF35FFDA
button.border_hover_colour = c_black
button.secborder_hover_colour = $FF15967C

button.colour_click = $FF20A38B
button.border_click_colour = $FF10A348
button.secborder_click_colour = c_black

ui_window_add_element(button, width - 10 - button.width, height - 10 - button.height)

var button = create_ui(0, 0, obj_ui_button);
button.width = 60
button.height = 20
button.left = 400 - button.width
button.top = 300 - button.height
button.text = "Ok"
button.icon = spr_ui_icon_checkmark
button.text_h_offset = -4

button.text_colour = c_white
button.colour = $FF007231
button.border_colour = c_black
button.secborder_colour = $FF32A861

button.text_hover_colour = c_white
button.colour_hover = $FF00873A
button.border_hover_colour = c_black
button.secborder_hover_colour = $FF32A861

button.text_click_colour = c_white
button.colour_click = $FF006029
button.border_click_colour = $FF41D37C
button.secborder_click_colour = c_black

ui_window_add_element(button, width - 20 - 120, height - 10 - button.height)