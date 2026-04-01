/// @param udp_port
function create_packet_udpport() {

	var udp_port = argument[0];

	var buffer = buffer_create(3, buffer_grow, 1)
	buffer_seek(buffer, buffer_seek_start, 0)

	buffer_write(buffer, buffer_u8, MSG_UDPPORT)
	buffer_write(buffer, buffer_u16, udp_port)

	return buffer;


}
