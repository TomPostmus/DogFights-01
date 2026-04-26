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

score_win = 30 // score for winning
team_scores = array_create(teams_number, 0)

// Register damage, check team ids and decide whether to deal damage
function register_damage(_p_affected, _p_affector, _damage) {
	if (_p_affected.team_id != _p_affector.team_id || friendly_fire) {
		_p_affected.hp.add_hp(-_damage)
		
		if (_p_affected.hp.hp <= 0) { // if died
			register_kik(_p_affected, _p_affector) // register kik (cute word for kill)
		}
	}
}

// Register that affected player has been kikked by affector player
function register_kik(_p_affected, _p_affector) {
	var _ti = _p_affector.team_id
	team_scores[_ti] += 1
}

// Draw game state in HUD
function draw_hud(_parent) {
	var _m = _parent.cont_margin
	var _xp = _parent.x + _m
	var _yp = _parent.y + _m
	
	var _bar_w = _parent.width - _m * 2
	for (var i = 0; i < teams_number; i ++) {
		var _score = team_scores[i]
		_yp = _parent.y + _m + i*_m*2
		
		draw_set_colour(#555555) // background color
		var _bar_h = 4 // height of outer border lines
		draw_line(_xp, _yp - _bar_h/2-1, _xp, _yp + _bar_h/2-1) // draw background border lines
		draw_line(_xp + _bar_w, _yp - _bar_h/2-1, _xp + _bar_w, _yp + _bar_h/2-1)
		draw_line(_xp, _yp, _xp + _bar_w, _yp) // horizontal line
		draw_line(_xp, _yp-1, _xp + _bar_w, _yp-1)
		
		draw_set_colour(team_colors[i])
		if (_score > 0) {
			draw_line(_xp, _yp - _bar_h/2-1, _xp, _yp + _bar_h/2-1)
			
			var _score_w = (_score / score_win) * _bar_w
			draw_line(_xp + _score_w, _yp - _bar_h/2-1, _xp + _score_w, _yp + _bar_h/2-1) // right red border line
			var _hp_h_inner = 2 // inner height of hp bar
			draw_rectangle(_xp, _yp - _hp_h_inner/2, _xp + _score_w, _yp + _hp_h_inner/2-1, false) // draw inner bar
		}		
	}
	
	return teams_number * _m * 2 // return height of inner elements
}