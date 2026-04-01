event_inherited()

ui_window_create_exit_button()

backg_colour = $FF10A348

var button = create_ui(0, 0, obj_ui_button);
button.width = 60
button.height = 20
button.left = 400 - button.width
button.top = 300 - button.height
button.text = "Ok"
button.icon = spr_ui_icon_checkmark
button.text_h_offset = -4

button.colour = $FF34D1C1//$FF47FFE6
button.border_colour = c_black
button.secborder_colour = $FF10A348

button.colour_hover = $FF87FFEF
button.border_hover_colour = c_black
button.secborder_hover_colour = $FF10A348

button.colour_click = $FF36BCAA
button.border_click_colour = $FF10A348
button.secborder_click_colour = c_black

ui_window_add_element(button, width - 10 - button.width, height - 10 - button.height)