// Populate teams
teams = array_create(teams_number) // array of teams (lists) of players
var _player_i = 0 // index of player inst
for (var i = 0; i < teams_number; i ++) {
	teams[i] = ds_list_create()
	repeat (team_sizes[i]) {
		var _player = instance_find(obj_player, _player_i) // find next player
		var _team_color = team_colors[i]
		ds_list_add(teams[i], _player) // add to team
		_player.set_team(i, _team_color) // set team of player
		_player_i += 1
	}
}

// Start spawn teams
for (var _ti = 0; _ti < teams_number; _ti ++) {
	var _team_spawns = ds_list_create()
	with (obj_marker_team_spawn) {
		if (team_id == _ti) ds_list_add(_team_spawns, id) // add team spawns with corresponding team id
	}
	
	for (var i = 0; i < ds_list_size(teams[_ti]); i ++) { // spawn player at corresponding team spawn
		var _team_spawn = _team_spawns[|i]
		var _player = teams[_ti][|i]
		_player.spawn(_team_spawn.x, _team_spawn.y, _team_spawn.image_angle)
	}
	
	ds_list_destroy(_team_spawns)
}