/// @param game_number
function create_packet_game_info() {

	var game_number = argument[0];

	var buffer = buffer_create(2, buffer_grow, 1)
	buffer_seek(buffer, buffer_seek_start, 0)

	buffer_write(buffer, buffer_u8, MSG_GAME_INFO)
	buffer_write(buffer, buffer_u8, game_number)

	return buffer;


}
