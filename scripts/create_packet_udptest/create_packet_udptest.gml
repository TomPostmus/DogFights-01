function create_packet_udptest() {
	var buffer = buffer_create(3, buffer_grow, 1)
	buffer_seek(buffer, buffer_seek_start, 0)

	buffer_write(buffer, buffer_u8, MSG_UDPTEST)

	return buffer;


}
