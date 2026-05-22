event_inherited()

if (global.ingame()) { // if in in-game room
	
	// Reset count
	for (var i = 0; i < teams_number; i ++) 
		team_lives[i] = 0 // reset
		
	// Count lives
	with (obj_character) {
		other.team_lives[team_id] ++ // increase count
	}

	// Assign character from reserve to player
	with (obj_player) {
		if (!instance_exists(character) && ds_list_size(other.team_reserves[team_id]) > 0) { // if not alive and there are reserves left
			character = other.team_reserves[team_id][|0]
			ds_list_delete(other.team_reserves[team_id], 0) // remove from list
		
			character.player = id
			character.hp_protection = false // disable HP protection
		}
	}

	// End criterion
	var _total_lives = 0
	for (var i = 0; i < teams_number; i ++) {
		_total_lives += team_lives[i] // sum lives
	}
	
	if (_total_lives == 0) {
		show_message($"It's a draw!")
		game_end()
	} else {
		for (var i = 0; i < teams_number; i ++) {
			if (team_lives[i] == _total_lives) { // if this team is only team that has lives left
				show_message($"Team {i} wins!") // wins
				game_end()
			}
		}
	}

}