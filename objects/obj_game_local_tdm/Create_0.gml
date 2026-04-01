event_inherited()

teams_number = 2 // how many teams
var _players_number = instance_number(obj_player)
var _team_size = floor(_players_number / teams_number) // floored average size of teams
var _remainder = _players_number - _team_size * teams_number // how many remaining players (after dividing in equal portions)

team_sizes = array_create(teams_number) // array of team sizes (players divided across teams equally, with remainder)
for (var i = 0; i < teams_number; i ++) { // determine distribution
	if (_remainder > 0) {
		team_sizes[i] = _team_size + 1
		_remainder -= 1 // use up one of remaining (unassigned) players
	} else {
		team_sizes[i] = _team_size
	}
}

// Populate teams
teams = array_create(teams_number) // array of teams (lists) of players
var _player_i = 0 // index of player inst
for (var i = 0; i < teams_number; i ++) {
	teams[i] = ds_list_create()
	repeat (team_sizes[i]) {
		var _player = instance_find(obj_player, _player_i) // find next player
		ds_list_add(teams[i], _player) // add to team
		_player.team_id = i // set team id of player
		_player_i += 1
	}
}