// Create in-game related player objects (so outside of lobby room)
if (global.ingame()) { // if in in-game room
	
	// Gather team spawns in lists
	for (var i = 0; i < teams_number; i ++)
		ds_list_clear(team_spawns[i]) // clear lists
		
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