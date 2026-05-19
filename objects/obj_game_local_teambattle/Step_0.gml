event_inherited()

// End criterion
var _total_lives = 0
for (var i = 0; i < teams_number; i ++)
	_total_lives += team_lives[i] // sum lives
	
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