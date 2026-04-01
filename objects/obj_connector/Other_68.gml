var type = async_load[? "type"];
var dedicated_socket = async_load[? "id"];

if (dedicated_socket == udp_socket) {
	var packet_buffer = async_load[? "buffer"];
	buffer_seek(packet_buffer, buffer_seek_start, 0)
	var msg_code = buffer_read(packet_buffer, buffer_u8)
	if (msg_code == MSG_UDPTEST && state == "udp_test") {
		state = "request_join_game"
	}
} else {
	if (type == network_type_non_blocking_connect) {
		if (state == "awaiting_connection") {
			if (server_tcp_socket < 0) {
				state = "connection_failed"
			} else {
				state = "connection_made"
				alarm[0] = 0
			}
		}
	} else if (type == network_type_data) {
		var packet_buffer = async_load[? "buffer"];
		buffer_seek(packet_buffer, buffer_seek_start, 0)
		var msg_code = buffer_read(packet_buffer, buffer_u8)
		if (msg_code == MSG_ERROR) {
			var error_code = buffer_read(packet_buffer, buffer_u8)
			state = "error"
			self.error_code = error_code
		}
		if (msg_code == MSG_AUTHENTICATE && state == "await_authentication") {
			state = "send_udp_port"
		}
		if (msg_code == MSG_JOINGAME && state == "await_join_game_request") {
			state = "request_gameinfo"
		}
		if (msg_code == MSG_UDPPORT && state == "await_server_udp_port") {
			server_udp_port = buffer_read(packet_buffer, buffer_u16)
			state = "udp_test"
		}
		if (msg_code == MSG_GAME_INFO && state == "await_gameinfo_request") {
			room_index = buffer_read(packet_buffer, buffer_u8);
			game_size = buffer_read(packet_buffer, buffer_u8);
			state = "connected"
		}
	}
}