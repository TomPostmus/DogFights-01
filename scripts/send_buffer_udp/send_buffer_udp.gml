/// @param buffer
/// @param send_from_socket
/// @param address
/// @param port
function send_buffer_udp() {

	var buffer = argument[0];
	var source_socket = argument[1];
	var address = argument[2];
	var port = argument[3];

	network_send_udp(source_socket, address, port, buffer, buffer_get_size(buffer))

	buffer_delete(buffer)


}
