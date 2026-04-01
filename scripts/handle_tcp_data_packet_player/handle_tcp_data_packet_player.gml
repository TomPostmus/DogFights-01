/// @param packet_buffer
function handle_tcp_data_packet_player() {

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
		case MSG_PLAYER_QUEUE:
			var queue_pos = buffer_read(packet, buffer_u8);
			players_queue_positions[?player_obj] = queue_pos
		break;
		case MSG_PLAYER_HP:
			var hp = buffer_read(packet, buffer_u16);
			if (local_players[?player_id] == undefined) {
				player_obj.hp = hp
			}
		break;
	}


}
