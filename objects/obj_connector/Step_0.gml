//Loading window
loading_window.left = display_get_gui_width()/2 - loading_window.width/2
loading_window.top = display_get_gui_height()/2 - loading_window.height/2

//Cancel button
if (cancel_button != undefined && cancel_button.clicked) {
	network_destroy(tcp_socket)
	network_destroy(udp_socket)
	instance_destroy(loading_window)
	instance_destroy()
	exit
}

//Connection states
if (state == "error") {
	loading_window.loading_text_obj.text = "Error"
	switch(error_code) {
		default: loading_window.description_text = "Unknown error (Error code: " + string(error_code) + ")"; break;
		case ERR_INVALIDUSER: loading_window.description_text = "Failed to authenticate"; break;
		case ERR_GAMEFULL: loading_window.description_text = "The game you try to join is full"; break;
		case ERR_NONEXISTINGGAME: loading_window.description_text = "The game you try to join does not exist"; break;
	}
}

if (state == "before_connection") {
	network_set_config(network_config_use_non_blocking_socket, true)
	network_set_config(network_config_connect_timeout, 10000)
	server_tcp_socket = network_connect(tcp_socket, server_address, server_tcp_port)
	alarm[0] = 240
	state = "awaiting_connection"
}

if (state == "awaiting_connection") {
	loading_window.loading_text_obj.text = "Connecting..."
	loading_window.description_text = "Trying to connect with the server"
}

if (state == "connection_made") {
	loading_window.height = 120
	
	cancel_button = ui_window_red_secondary_button()
	cancel_button.height = 20
	cancel_button.width = 90
	cancel_button.text = "Cancel"
	cancel_button.icon = spr_ui_icon_exitwindow
	with (loading_window) {
		ui_window_add_element(other.cancel_button, width - other.cancel_button.width - 10, height - other.cancel_button.height - 10)
	}
	
	var separator_line = create_ui(0, 0, obj_ui_line)
	separator_line.end_x = loading_window.width - 1
	separator_line.colour = loading_window.backg_colour
	with (loading_window) {
		ui_window_add_element(separator_line, 0, height - other.cancel_button.height - 20)
	}
	
	state = "authenticate"
}

if (state == "authenticate") {
	state = "await_authentication"
	var packet = create_packet_authenticate(0, 0)
	send_buffer_tcp(packet, tcp_socket)
}

if (state == "await_authentication") {
	loading_window.loading_text_obj.text = "Connecting..."
	loading_window.description_text = "Authenticating"
}

if (state == "send_udp_port") {
	state = "await_server_udp_port"
	var packet = create_packet_udpport(udp_port)
	send_buffer_tcp(packet, tcp_socket)
}

if (state == "await_server_udp_port") {
	loading_window.loading_text_obj.text = "Connecting..."
	loading_window.description_text = "Fetching UDP remote port"
}

if (state == "connection_timeout") {
	loading_window.loading_text_obj.text = "Time-out"
	loading_window.description_text = "Connection time-out"
}

if (state == "connection_failed") {
	loading_window.loading_text_obj.text = "Failed"
	loading_window.description_text = "Could not connect"
}

if (state == "udp_test") {
	loading_window.loading_text_obj.text = "Connecting..."
	loading_window.description_text = "Testing UDP stream"
	
	udp_test_tick--
	if (udp_test_tick <= 0) {
		udp_test_tick = 1
		var buffer = create_packet_udptest();
		send_buffer_udp(buffer, udp_socket, server_address, server_udp_port)
	}
}

if (state == "request_join_game") {
	state = "await_join_game_request"
	var packet = create_packet_joingame(game_number)
	send_buffer_tcp(packet, tcp_socket)
}

if (state == "await_join_game_request") {
	loading_window.loading_text_obj.text = "Connecting..."
	loading_window.description_text = "Joining game"
}

if (state == "request_gameinfo") {
	var packet_buffer = create_packet_game_info(game_number);
	send_buffer_tcp(packet_buffer, tcp_socket)
	state = "await_gameinfo_request"
}

if (state == "await_gameinfo_request") {
	loading_window.loading_text_obj.text = "Connecting..."
	loading_window.description_text = "Requesting game information"
}

if (state == "connected") {
	var game = create_controllers(obj_game_remote);
	game.game_size = game_size
	game.slots = array_create(game_size, noone)
	
	var game_handler = create_ui(0, 0, obj_game_network_handler);
	game_handler.tcp_socket = tcp_socket
	game_handler.server_tcp_socket = server_tcp_socket
	game_handler.udp_socket = udp_socket
	game_handler.udp_port = udp_port
	game_handler.server_address = server_address
	game_handler.server_udp_port = server_udp_port
	game_handler.room_index = room_index
	game_handler.game_number = game_number
	game_handler.player_id_slots = array_create(game_size, -1)
	game_handler.game_obj = game
	
	
	room_goto(global.room_index_list[|room_index])
	instance_destroy(loading_window)
	instance_destroy(self)
}