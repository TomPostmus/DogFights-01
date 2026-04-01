/// @param packet_buffer
function handle_tcp_data_packet_game() {

	var packet = argument[0];

	buffer_seek(packet, buffer_seek_start, 0)
	var msg_code = buffer_read(packet, buffer_u8)
	
	switch(msg_code) {
		case MSG_GAME_JOINPLAYER:
			var request_number = buffer_read(packet, buffer_u8)
			var player_id = buffer_read(packet, buffer_u8)
			var player_obj = request_number_to_player[?request_number];
			if (player_obj != undefined) {
				player_obj.player_id = player_id
				local_players[?player_id] = player_obj
				all_players[?player_id] = player_obj
			}
		break;
		case MSG_GAME_PLAYERS:
			//Compare the received entries with own slot entries
			for (var i = 0; i < buffer_get_size(packet) - 1; i ++) {
				var player_id = buffer_read(packet, buffer_u8) - 1;
				if (player_id != player_id_slots[i]) {
					if (player_id == -1) {
						instance_destroy(game_obj.slots[i])
						game_obj.slots[i] = noone
						local_players[?player_id] = undefined
						all_players[?player_id] = undefined
					} else {
						if (local_players[?player_id] != undefined) {
							game_obj.slots[i] = local_players[?player_id]
						} else if (local_players[?player_id] == undefined) {
							var new_player = create_controllers(obj_player_remote);
							new_player.player_id = player_id
							all_players[?player_id] = new_player
							game_obj.slots[i] = new_player
						}
					}
					player_id_slots[i] = player_id
				}
			}
		break
	}


}
