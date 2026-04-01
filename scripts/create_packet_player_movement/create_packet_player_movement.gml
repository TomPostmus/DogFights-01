/// @param game_number
/// @param player_id
/// @param update_number
/// @param x
/// @param y
/// @param speed_x
/// @param speed_y
/// @param rotation
function create_packet_player_movement() {

	var game_number = argument[0];
	var player_id = argument[1];
	var update_number = argument[2];
	var x_pos = argument[3];
	var y_pos = argument[4];
	var speed_x = argument[5];
	var speed_y = argument[6];
	var rotation = argument[7];

	var buffer = buffer_create(18, buffer_grow, 1)
	buffer_seek(buffer, buffer_seek_start, 0)

	buffer_write(buffer, buffer_u8, MSG_PLAYER_MOVEMENT)
	buffer_write(buffer, buffer_u8, game_number)
	buffer_write(buffer, buffer_u8, player_id)
	buffer_write(buffer, buffer_u8, update_number)
	buffer_write(buffer, buffer_f32, x_pos)
	buffer_write(buffer, buffer_f32, y_pos)
	buffer_write(buffer, buffer_f16, speed_x)
	buffer_write(buffer, buffer_f16, speed_y)
	buffer_write(buffer, buffer_f16, rotation)

	return buffer;


}
