/// @param game_number
/// @param player_id
/// @param hp
function create_packet_player_hp() {

	var game_number = argument[0];
	var player_id = argument[1];
	var hp = argument[2];

	var buffer = buffer_create(6, buffer_fixed, 1)
	buffer_seek(buffer, buffer_seek_start, 0)

	buffer_write(buffer, buffer_u8, MSG_PLAYER_HP)
	buffer_write(buffer, buffer_u8, game_number)
	buffer_write(buffer, buffer_u8, player_id)
	buffer_write(buffer, buffer_u16, hp)

	return buffer;


}
