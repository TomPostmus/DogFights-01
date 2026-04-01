/// @param buffer
/// @param tcp_socket
function send_buffer_tcp() {

	var buffer = argument[0];
	var socket = argument[1];

	network_send_packet(socket, buffer, buffer_get_size(buffer))

	buffer_delete(buffer)


}
