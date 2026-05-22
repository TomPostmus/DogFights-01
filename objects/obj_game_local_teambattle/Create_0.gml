event_inherited()

// Game stats
friendly_fire = false
teams_number = 2 // how many teams
score_win = 60 // score for winning
lives_init = 12 // how many lives each team begins with (army size)

// Team vars
team_colors = [c_red, c_blue, c_green] // team identification colors
team_scores = array_create(teams_number, 0) // array keeping track of scores of teams
team_reserves = array_create(teams_number, undefined) // array of lists of reserves (remaining soldier/characters) that teams have
team_spawns = array_create(teams_number, undefined)
team_lives = array_create(teams_number, lives_init) // array keeping track of team lives

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

// Register damage, check team ids and decide whether to deal damage
function register_damage(_c_affected, _c_affector_team_id, _p_affector, _damage) {
	if (_c_affected.team_id != _c_affector_team_id || friendly_fire) {
		_c_affected.register_damage(_p_affector, _damage) // register damage at affected character
	}
}

// Register that affected player has been kikked by affector player
function register_kik(_p_affected, _p_affector) {
	var _ti_affector = _p_affector.team_id
	var _ti_affected = _p_affected.team_id
	team_scores[_ti_affector] += 1
}

// Draw game state in HUD (hud controller as _parent)
function draw_hud(_parent) {
	var _m = _parent.cont_margin
	
	// Draw score to win in big text
	draw_set_font(ft_score_big)
	draw_set_color(c_white)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_left)
	var _scrwin_w = string_width(lives_init)
	draw_text(
		_parent.x + _parent.width - _m - _scrwin_w, 
		_parent.y + _parent.height/2 - 1, 
		lives_init
	)
	
	var _max_w = 0 // compute maximum string width between lives
	for (var i = 0; i < teams_number; i ++) {
		var _lives = team_lives[i]
		if (string_width(_lives) > _max_w)
			_max_w = string_width(_lives)
	}
	
	for (var i = 0; i < teams_number; i ++) {
		var _lives = team_lives[i]
		var _yp = _parent.y + _m + i*_m*2
		var _xp = _parent.x + _m + _max_w / 2
		
		// Draw team score text
		draw_set_font(ft_small)
		draw_set_color(c_white)
		draw_set_halign(fa_center)
		draw_text(_xp, _yp, _lives)
		_xp += _m + _max_w / 2
		
		var _bar_w = _parent.width - (_xp - _parent.x) - _m * 2 - _scrwin_w
		draw_set_colour(#555555) // background color
		var _bar_h = 4 // height of outer border lines
		draw_line(_xp, _yp - _bar_h/2-1, _xp, _yp + _bar_h/2-1) // draw background border lines
		draw_line(_xp + _bar_w, _yp - _bar_h/2-1, _xp + _bar_w, _yp + _bar_h/2-1)
		draw_line(_xp, _yp, _xp + _bar_w, _yp) // horizontal line
		draw_line(_xp, _yp-1, _xp + _bar_w, _yp-1)
		
		draw_set_colour(team_colors[i])
		if (_lives > 0) {
			draw_line(_xp, _yp - _bar_h/2-1, _xp, _yp + _bar_h/2-1)
			
			var _lives_w = (_lives / lives_init) * _bar_w
			draw_line(_xp + _lives_w, _yp - _bar_h/2-1, _xp + _lives_w, _yp + _bar_h/2-1) // right red border line
			var _hp_h_inner = 2 // inner height of hp bar
			draw_rectangle(_xp, _yp - _hp_h_inner/2, _xp + _lives_w, _yp + _hp_h_inner/2-1, false) // draw inner bar
		}		
	}
	
	return teams_number * _m * 2 // return height of inner elements
}