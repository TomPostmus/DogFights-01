/// @param packet_buffer
function handle_tcp_data_packet_generic() {

	var packet = argument[0];

	buffer_seek(packet, buffer_seek_start, 0)
	var msg_code = buffer_read(packet, buffer_u8)
	
	switch(msg_code) {
		case MSG_ERROR:
			show_message("Server error")
		break;
	}


}
