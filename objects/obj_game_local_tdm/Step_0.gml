event_inherited()

// End criterion
for (var i = 0; i < teams_number; i ++) {
	if (team_scores[i] >= score_win) {
		show_message($"Team {i} wins!")
		game_end()
	}
}