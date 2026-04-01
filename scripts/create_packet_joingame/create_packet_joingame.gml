/// @param game_number
function create_packet_joingame() {

	var game_number = argument[0];

	var buffer = buffer_create(2, buffer_grow, 1)
	buffer_seek(buffer, buffer_seek_start, 0)

	buffer_write(buffer, buffer_u8, MSG_JOINGAME)
	buffer_write(buffer, buffer_u8, game_number)

	return buffer;


}
