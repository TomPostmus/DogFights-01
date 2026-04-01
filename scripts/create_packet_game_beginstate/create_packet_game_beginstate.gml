/// @param game_number
function create_packet_game_beginstate() {

	var game_number = argument[0];

	var buffer = buffer_create(2, buffer_grow, 1)
	buffer_seek(buffer, buffer_seek_start, 0)

	buffer_write(buffer, buffer_u8, MSG_GAME_BEGINSTATE)
	buffer_write(buffer, buffer_u8, game_number)

	return buffer;


}
