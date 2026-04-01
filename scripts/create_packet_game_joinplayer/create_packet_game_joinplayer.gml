/// @param game_number
/// @param request_number
/// @param player_type
function create_packet_game_joinplayer() {

	var game_number = argument[0];
	var request = argument[1];
	var type = argument[2];

	var buffer = buffer_create(4, buffer_grow, 1)
	buffer_seek(buffer, buffer_seek_start, 0)

	buffer_write(buffer, buffer_u8, MSG_GAME_JOINPLAYER)
	buffer_write(buffer, buffer_u8, game_number)
	buffer_write(buffer, buffer_u8, request)
	buffer_write(buffer, buffer_u8, type)

	return buffer;


}
