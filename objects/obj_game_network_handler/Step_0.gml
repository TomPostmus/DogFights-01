effect_create_above(ef_explosion, 0, 0, 1, c_white)

//Try joining local players into game
with (obj_player_local) {
	if (player_id == undefined && ds_list_find_index(other.players_requested_id, id) == -1) {
		var packet = create_packet_game_joinplayer(other.game_number, other.players_request_number, PLYR_MAIN)
		send_buffer_tcp(packet, other.tcp_socket)
		ds_list_add(other.players_requested_id, id)
		other.request_number_to_player[?other.players_request_number] = id
		other.players_request_number ++
		other.players_request_number = other.players_request_number mod 255
	}
}

//Request begin state
if (request_begin_state && game_number != undefined) {
	var packet_buffer = create_packet_game_beginstate(game_number)
	send_buffer_tcp(packet_buffer, tcp_socket)
	request_begin_state = false
}

//SEND LOCAL PLAYER INFO TO SERVER
	//CONTINUOUS INFORMATION TRANSMITS
	for (var i = 0; i < ds_list_size(game_obj.local_players); i ++) {
		var player = game_obj.local_players[|i];
		if (instance_exists(player.dog)) {
			var packet_buffer = create_packet_player_movement(game_number, player.player_id, 0, player.dog.x, player.dog.y, player.dog.speed_x, player.dog.speed_y, player.dog.rotation);
			send_buffer_udp(packet_buffer, udp_socket, server_address, server_udp_port)
		}
	}

	//TIMED INFORMATION TRANSMITS
	transmit_tick --
	if (transmit_tick <= 0) {
		for (var i = 0; i < ds_list_size(game_obj.local_players); i ++) {
			var player = game_obj.local_players[|i];
			var packet_buffer = create_packet_player_hp(game_number, player.player_id, player.hp);
			send_buffer_tcp(packet_buffer, tcp_socket)
		}
		transmit_tick = 15
	}
	
	//EVENTUAL INFORMATION TRANSMITS
	for (var i = 0; i < ds_list_size(game_obj.local_players); i ++) {
		var player = game_obj.local_players[|i];
		//HP update
		if (local_players_hp[?player] == undefined || local_players_hp[?player] != player.hp) {
			var packet_buffer = create_packet_player_hp(game_number, player.player_id, player.hp);
			send_buffer_tcp(packet_buffer, tcp_socket)
			local_players_hp[?player] = player.hp
		}
	}