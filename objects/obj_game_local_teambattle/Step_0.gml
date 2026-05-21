event_inherited()

if (global.ingame()) { // if in in-game room

	// Assign character from reserve to player
	with (obj_player) {
		if (!instance_exists(character)) {
			character = other.team_reserves[team_id][|0]
			ds_list_delete(other.team_reserves[team_id], 0) // remove from list
		
			character.player_id = player_id
		}
	}

	// End criterion
	var _total_lives = 0
	for (var i = 0; i < teams_number; i ++)
		_total_lives += ds_list_size(team_reserves[i]) // sum lives
	
	if (_total_lives == 0) {
		show_message($"It's a draw!")
		game_end()
	} else {
		for (var i = 0; i < teams_number; i ++) {
			if (ds_list_size(team_reserves[i]) == _total_lives) { // if this team is only team that has lives left
				show_message($"Team {i} wins!") // wins
				game_end()
			}
		}
	}

}