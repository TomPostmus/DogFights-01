score_ = undefined // number of points scored by team
players = ds_list_create() // list of players that play for team
characters = ds_list_create() // list of characters that team is comprised of
team_id = -1
team_color = c_white

// Character to player
character_to_player = ds_map_create() // backwards mapping from character to player

/// @function assign_player_to_team(player, team)
/// @description Put player in team, expects player is yet unassigned
/// @param {obj_player} The player to put in team
/// @context obj_team
function assign_player_to_team(_player) {
	if (_player.team_id != -1)
		show_error(string("Player's team_id is expected to be -1, is {0}. Cannot reassign player to a team", _player.team_id), true)
	
	_player.team_id = team_id
	_player.team_color = team_color
		
	ds_list_add(players, _player) // add to players list

}

/// @function start_spawn_team(n_characters)
/// @description Spawn characters for this team at the corresponding start spawn marker
/// @param {int} n_characters The number of characters to spawn
/// @context obj_game_teambattle
function start_spawn_team_characters(_n_characters) {

	var _marker = find_start_spawn_marker() // find start spawn marker
	if (!instance_exists(_marker)) {
		show_error(string("Could not start spawn team with id {0}; no start spawn marker found", team_id), false)
		return
	}
	
	var _characters = spawn_team_in_formation(_n_characters, _marker.x, _marker.y, _marker.image_angle) // spawn characters at marker
	
	for (var i = 0; i < ds_list_size(_characters); i ++) // add to characters list
		ds_list_add(characters, _characters[|i])
	ds_list_destroy(_characters)
	
}

/// @function find_start_spawn_marker()
/// @description Find the start spawn marker in the room that has same team id
/// @context obj_game_teambattle
find_start_spawn_marker = function() {
	
	var _marker = noone
	with (obj_marker_team_spawn) {
		if (team_id == other.team_id) {
			_marker = id
			break
		}
	}
	
	return _marker
	
}

/// @function spawn_team_in_formation(size, x, y, rot, [formation])
/// @description Spawn a team from a coordinate in a given formation
/// @param {real} x The x coordinate to spawn team
/// @param {real} y The y coordinate
/// @param {real} rotation What rotation to spawn team in
/// @param {string} [formation] What type of formation to spawn team in
/// @returns {ds_list} A list of spawned characters
/// @pure (only dependent on existance of obj_spawns_controller)
spawn_team_in_formation = function(_size, _x, _y, _rot, _formation="piramid") {
	
	var _characters = ds_list_create()
	if (_formation == "piramid") {
	
		var _m_trans = 30 // transverse margin between characters
		var _m_long = 40 // longitudinal margin between characters
		
		var _x_acc, _y_acc
		var _row_count = 0 // which row we're at
		while (ds_list_size(_characters) < _size) {
			_x_acc = lengthdir_x(-_m_long * _row_count, _rot) + 0.5 * lengthdir_x(_m_trans * _row_count, _rot - 90) // right-most position in row
			_y_acc = lengthdir_y(-_m_long * _row_count, _rot) + 0.5 * lengthdir_y(_m_trans * _row_count, _rot - 90)
			
			repeat (_row_count+1) {
				
				var _character = obj_spawns_controller.spawn_character(_x + _x_acc, _y + _y_acc, _rot)
				ds_list_add(_characters, _character)
				
				_x_acc += lengthdir_x(-_m_trans, _rot - 90) // move a tranverse margin distance over to the left
				_y_acc += lengthdir_y(-_m_trans, _rot - 90)
				
				if (ds_list_size(_characters) == _size)
					break
					
			}
			
			_row_count ++
			
		}
	
	} else if (_formation == "V") {
		// TODO: implement if you feel like it :)
	} else {
		show_error("Unknown formation given to start spawn team in: " + _formation, true)
	}
	
	return _characters

}

/// @function initial_character_assignment()
/// @description Assign characters to all players at the start
/// @context obj_team
function initial_character_assignment() {
	if (!ds_map_empty(character_to_player)) {
		show_error("Cannot do initial assignment of characters; no character is expected to be assigned.", false)
		return
	}
	
	for (var i = 0; i < ds_list_size(players); i ++) {
		var _player = players[|i]
		var _character = find_first_unassigned_character()
		if (instance_exists(_character))
			assign_character_to_player(_character, _player)
	}
	
}

/// @description Assigns a character to a player
/// @param {obj_character} character The character to assign to the player
/// @param {obj_player} player The player to which character is assigned
/// @context obj_team
function assign_character_to_player(_character, _player) {
	if (ds_map_exists(character_to_player, _character)) {
		show_error(string("Cannot assign character {0} to player {1}; already assigned.", _character, _player), false)
		return
	}
	
	// TODO: disable HP protection if still applicable
	_player.character = _character
	_character.player = _player // TODO: replace backwards dependency on player with more light-weight observer pattern

	character_to_player[?_character] = _player // update mapping

}

/// @description Find first character in list that is not assigned to a player
/// @returns {obj_character} The character that is found, or noone if there is no unassigned character
/// @context obj_team
function find_first_unassigned_character() {
	for (var i = 0; i < ds_list_size(characters); i ++) {
		var _character = characters[|i]
		if (!ds_map_exists(character_to_player, _character)) // if character has no mapping to player
			return _character
	}
	
	return noone
}