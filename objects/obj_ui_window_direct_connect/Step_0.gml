event_inherited()

//Center
left = display_get_gui_width()/2 - width/2 
top = display_get_gui_height()/2 - height/2

//Clicked connect
if (connect_button.clicked) {
	var connector = create_controllers(obj_connector);
	connector.server_address = address_field.text
	connector.server_tcp_port = port_field.text
	connector.game_number = real(game_field.text)
}