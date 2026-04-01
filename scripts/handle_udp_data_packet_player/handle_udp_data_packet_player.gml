/// @param packet_buffer
function handle_udp_data_packet_player() {

	var packet = argument[0];

	buffer_seek(packet, buffer_seek_start, 0)
	var msg_code = buffer_read(packet, buffer_u8)
	var player_id = buffer_read(packet, buffer_u8)

	//Find corresponding player instance
	var player_obj = undefined
	with (obj_player) {
		if (self.player_id == player_id) {
			player_obj = id
		}
	}

	if (player_obj == undefined) exit;
	
	switch(msg_code) {
		case MSG_PLAYER_MOVEMENT:
			if (local_players[?player_id] == undefined && instance_exists(player_obj.dog)) {
				var update_number = buffer_read(packet, buffer_u8);
				var pos_x = buffer_read(packet, buffer_f32);
				var pos_y = buffer_read(packet, buffer_f32);
				var speed_x = buffer_read(packet, buffer_f16);
				var speed_y = buffer_read(packet, buffer_f16);
				var rotation = buffer_read(packet, buffer_f16);
				joint_set_speed(player_obj.dog.joint, speed_x, speed_y)
				joint_set_position(player_obj.dog.joint, pos_x, pos_y)
				player_obj.dog.rotation = rotation
			}
		break;
	}


}
