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
		_p_affected.hp.register_damage(_p_affector, _damage) // register at hp object
	}
}

// Draw game state in HUD (hud controller as _parent)
function draw_hud(_parent) {
	var _m = _parent.cont_margin
	
	// Draw score to win in big text
	draw_set_font(ft_score_big)
	draw_set_color(c_white)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_left)
	var _scrwin_w = string_width(score_win)
	draw_text(
		_parent.x + _parent.width - _m - _scrwin_w, 
		_parent.y + _parent.height/2 - 1, 
		score_win
	)
	
	var _max_w = 0 // compute maximum string width between scores
	for (var i = 0; i < teams_number; i ++) {
		if (string_width(team_scores[i]) > _max_w)
			_max_w = string_width(team_scores[i])
	}
	
	for (var i = 0; i < teams_number; i ++) {
		var _score = team_scores[i]
		var _yp = _parent.y + _m + i*_m*2
		var _xp = _parent.x + _m + _max_w / 2
		
		// Draw team score text
		draw_set_font(ft_small)
		draw_set_color(c_white)
		draw_set_halign(fa_center)
		draw_text(_xp, _yp, _score)
		_xp += _m + _max_w / 2
		
		var _bar_w = _parent.width - (_xp - _parent.x) - _m * 2 - _scrwin_w
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