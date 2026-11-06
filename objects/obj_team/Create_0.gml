score_ = undefined // number of points scored by team
players = ds_list_create() // list of players that play for team
characters = ds_list_create() // list of characters that team is comprised of
team_id = -1
team_color = c_white

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

/// @description Spawn a team from a coordinate in a given formation
function start_spawn(_size, _x, _y, _rot, _formation="piramid") {

	var _complete = function() {return ds_list_size(characters) == _size} // evaluate whether spawn complete
	if (_formation == "piramid") {
	
		var _m_trans = 30 // transverse margin between characters
		var _m_long = 40 // longitudinal margin between characters
		
		var _x_acc, _y_acc
		var _row_count = 0 // which row we're at
		while (!_complete()) {
			_x_acc = lengthdir_x(-_m_long * _row_count, _rot) + 0.5 * lengthdir_x(_m_trans * _row_count, _rot - 90) // right-most position in row
			_y_acc = lengthdir_y(-_m_long * _row_count, _rot) + 0.5 * lengthdir_y(_m_trans * _row_count, _rot - 90)
			
			repeat (_row_count+1) {
				
				obj_spawns_controller.spawn_character(_x + _x_acc, _y + _y_acc, _rot)
				
				_x_acc += lengthdir_x(_m_trans, _rot - 90) // move a tranverse margin distance over to the left
				_y_acc += lengthdir_y(_m_trans, _rot - 90)
				
				if (_complete())
					break
					
			}
			
		}
	
	} else if (_formation == "V") {
		// TODO: implement if you feel like it :)
	} else {
		show_error("Unknown formation given to start spawn team in: " + _formation, true)
	}

}