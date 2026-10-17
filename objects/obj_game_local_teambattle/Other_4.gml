event_inherited()

// Create in-game related player objects (so outside of lobby room)
if (global.ingame()) { // if in in-game room
	
	team_scores = array_create(teams_number, 0)
	team_lives = array_create(teams_number, lives_init) // reset lives
	team_spawns = array_create(teams_number, undefined)
	team_reserves = array_create(teams_number, undefined)
	team_scores = array_create(teams_number, 0)
	
	for (var i = 0; i < teams_number; i ++) {
		team_spawns[i] = ds_list_create() // create lists
		team_reserves[i] = ds_list_create()
	}
	
	// Determine team sizes
	var _players_number = ds_list_size(obj_lobby.players)
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
			_player.team_id = i
			_player.team_color = team_colors[i]
		
			ds_list_add(teams[i], _player) // add to team
			_player_i += 1
		}
	}
		
	with (obj_marker_team_spawn) {
		if (team_id < other.teams_number) // if team is used
			ds_list_add(other.team_spawns[team_id], id) // for every team spawn marker add to list
	}
	
	// Create characters for each team
	for (var _ti = 0; _ti < teams_number; _ti ++) {
		for (var i = 0; i < lives_init; i ++) { // for each live, create character
			var _spawn = team_spawns[_ti][|i]
			
			var _character = create_groundhigh(_spawn.x, _spawn.y, obj_character)
			_character.rotation = _spawn.image_angle
			_character.team_id = _ti
			_character.hp_protection = true // enable HP protection by default (disabled when player takes over)
			ds_list_add(team_reserves[_ti], _character) // add to army list
			
			with (_character) {
				if (_ti == 0) {
					appearance = create_controllers(obj_appearance_pip)
					appearance.character = id
				} else if (_ti == 1) {
					appearance = create_controllers(obj_appearance_bear)
					appearance.character = id
				}
			
				weapon = create_controllers(obj_weapon_gun_usp) // characters start with usp
				weapon.character = id
				weapon.anim_init()		
				
				initialize()
			}
			
		}
	}

	// Start spawn teams
	//for (var _ti = 0; _ti < teams_number; _ti ++) {
	//	var _team_spawns = ds_list_create()
	//	with (obj_marker_team_spawn) {
	//		if (team_id == _ti) ds_list_add(_team_spawns, id) // add team spawns with corresponding team id
	//	}
	
	//	for (var i = 0; i < ds_list_size(teams[_ti]); i ++) { // spawn player at corresponding team spawn
	//		var _team_spawn = _team_spawns[|i]
	//		var _player = teams[_ti][|i]
	//		_player.spawn(_team_spawn.x, _team_spawn.y, _team_spawn.image_angle)
	//	}
	
	//	ds_list_destroy(_team_spawns)
	//}
}