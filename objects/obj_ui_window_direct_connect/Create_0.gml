event_inherited()

title = "Direct connect"
header = false
height = 160

var address_text = create_ui(0, 0, obj_ui_text)
address_text.font = ft_normal
address_text.text = "IPv4 Address: "
address_text.colour = c_black
address_text.halign = fa_left

ui_window_add_element(address_text, 15, 49)

address_field = create_ui(0, 0, obj_ui_input)
address_field.width = 150
address_field.height = 20
address_field.text_h_offset = 7
address_field.text_maxchar -= 1
address_field.backg_alpha = 0.3
address_field.text_colour = c_black
address_field.text = "127.0.0.1"

ui_window_add_element(address_field, width - address_field.width - 10, 40)

var port_text = create_ui(0, 0, obj_ui_text)
port_text.font = ft_normal
port_text.text = "Port number: "
port_text.colour = c_black
port_text.halign = fa_left

ui_window_add_element(port_text, 15, 79)

port_field = create_ui(0, 0, obj_ui_input)
port_field.width = 150
port_field.height = 20
port_field.text_h_offset = 7
port_field.text_maxchar -= 1
port_field.backg_alpha = 0.3
port_field.text_colour = c_black
port_field.text = "5678"

ui_window_add_element(port_field, width - port_field.width - 10, 70)

var game_text = create_ui(0, 0, obj_ui_text)
game_text.font = ft_normal
game_text.text = "Game id: "
game_text.colour = c_black
game_text.halign = fa_left

ui_window_add_element(game_text, 15, 109)

game_field = create_ui(0, 0, obj_ui_input)
game_field.width = 150
game_field.height = 20
game_field.text_h_offset = 7
game_field.text_maxchar -= 1
game_field.backg_alpha = 0.3
game_field.text_colour = c_black
game_field.text = "0"

ui_window_add_element(game_field, width - game_field.width - 10, 100)

connect_button = create_ui(0, 0, obj_ui_button)
connect_button.width = 70
connect_button.height = 20
connect_button.text = "Connect"
connect_button.icon = spr_ui_icon_proceedarrow

ui_window_add_element(connect_button, width - connect_button.width - 10, height - connect_button.height - 10)