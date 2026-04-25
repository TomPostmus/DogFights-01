event_inherited()

teams = undefined // array of lists that are the teams
friendly_fire = false
teams_number = 2 // how many teams
team_colors = [c_red, c_blue, c_green] // team identification colors
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

// Register damage, check team ids and decide whether to deal damage
function register_damage(_p_affected, _p_affector, _damage) {
	if (_p_affected.team_id != _p_affector.team_id || friendly_fire) {
		_p_affected.hp.add_hp(-_damage)
	}
}