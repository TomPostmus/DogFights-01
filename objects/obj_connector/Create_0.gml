//address and port should be externally defined

state = "before_connection"

game_number = undefined
server_tcp_socket = undefined
server_udp_port = undefined
server_address = undefined

loading_window = ui_create_window(obj_ui_window_loading, display_get_gui_width()/2 - 125, display_get_gui_height()/2 - 40)
tcp_socket = network_create_socket(network_socket_tcp)

udp_port = 5678
udp_socket = network_create_socket_ext(network_socket_udp, udp_port)
while (udp_socket < 0 && udp_port < 10000) {
	udp_port ++
	udp_socket = network_create_socket_ext(network_socket_udp, udp_port)
}

udp_test_tick = 0

error_code = -1
cancel_button = undefined
room_index = 0
game_size = 0