var type = async_load[? "type"];
var dedicated_socket = async_load[? "id"];

if (dedicated_socket == udp_socket) {
	var from_port = async_load[? "port"]
	var from_address = async_load[? "ip"]
	if (from_port == server_udp_port && from_address == server_address) {
		var packet_buffer = async_load[? "buffer"];
		buffer_seek(packet_buffer, buffer_seek_start, 0)
		var msg_code = buffer_read(packet_buffer, buffer_u8)
		if (msg_code >= 100) {
			handle_udp_data_packet_player(packet_buffer)
		}
	}	
} else {
	if (type == network_type_data) {
		var packet_buffer = async_load[? "buffer"];
		buffer_seek(packet_buffer, buffer_seek_start, 0)
		var msg_code = buffer_read(packet_buffer, buffer_u8)
		if (msg_code >= 0 && msg_code < 10) {
			handle_tcp_data_packet_generic(packet_buffer)
		} else if (msg_code >= 10 && msg_code < 100) {
			handle_tcp_data_packet_game(packet_buffer)
		} else if (msg_code >= 100) {
			handle_tcp_data_packet_player(packet_buffer)
		}
	} else {
		show_error("Game handler received non-data type packet", false)
	}
}