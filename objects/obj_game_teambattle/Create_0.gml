event_inherited()

// Game stats
friendly_fire = false
score_win = 60 // score for winning
lives_init = 0 // how many lives each team begins with (army size), defined in creation code in rooms

// Teams
teams = ds_list_create() // list of obj_team
team_colors = [c_red, c_blue, c_green] // team identification colors
team_appearances = [obj_appearance_pip, obj_appearance_bear]

/// @function initialize_teams(n_teams)
/// @description Create N team objects and add to teams list
/// @param {int} n_teams The number of team objects to create
/// @context obj_game_teambattle
function initialize_teams(_n_teams) {
	if (!ds_list_empty(teams))
		show_error("Team list expected to be empty when calling initialize_teams().", true)
		
	// Create teams
	for (var i = 0; i < _n_teams; i ++) {
		var _team = create_controllers(obj_team)
		_team.team_id = i // assign team id
		_team.team_appearance = team_appearances[i]
		ds_list_add(teams, _team)
	}
	
}

/// @function compute_team_size_uniform_with_remainder(n_teams, n_players)
/// @description Given a number of teams and players, compute integer team sizes such that players are evenly distributed and some teams get an extra player from the remainder
/// @returns {array: int} Array of integers that represent team sizes
/// @pure
function compute_team_size_uniform_with_remainder(_n_teams, _n_players) {
	if (_n_teams < 1)
		show_error("Cannot compute team sizes; n_teams smaller than or equal to 0.", true)
	if (_n_players < 0)
		show_error("Cannot compute team sizes; n_players smaller than 0.", true)

	var _team_sizes = array_create(_n_teams) // array of team sizes
	var _team_avg_size = floor(_n_players / _n_teams) // floored average size of teams
	var _remainder = _n_players - _team_avg_size * _n_teams // how many remaining players (after dividing in equal portions)
	for (var i = 0; i < _n_teams; i ++) { // determine distribution
		if (_remainder > 0) {
			_team_sizes[i] = _team_avg_size + 1
			_remainder -= 1 // use up one of remaining (unassigned) players
		} else {
			_team_sizes[i] = _team_avg_size
		}
	}
	
	return _team_sizes
	
}

/// @function initial_player_team_assignment()
/// @description Assign all players to a team
/// @param {ds_list} players The list of players to assign to the teams
/// @context obj_game_teambattle
function initial_player_team_assignment(_players) {
	
	var _player_i = 0 // index of player inst
	var _team_sizes = compute_team_size_uniform_with_remainder(ds_list_size(teams), ds_list_size(_players))
	for (var i = 0; i < ds_list_size(teams); i ++) {
		var _team = teams[|i]
		repeat (_team_sizes[i]) {
			var _player = _players[|_player_i] // find next player
			
			_team.assign_player_to_team(_player)
			_player_i += 1
		}
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
	var _scrwin_w = string_width(lives_init)
	draw_set_valign(fa_top)
	draw_text(
		_parent.x + _parent.width - _m - _scrwin_w, 
		_parent.y + _parent.height/2 - 1, 
		lives_init
	)
	
	var _max_w = 0 // compute maximum string width between lives
	for (var i = 0; i < ds_list_size(teams); i ++) {
		var _lives = ds_list_size(teams[|i].characters)
		if (string_width(_lives) > _max_w)
			_max_w = string_width(_lives)
	}
	
	for (var i = 0; i <  ds_list_size(teams); i ++) {
		var _lives = ds_list_size(teams[|i].characters)
		var _yp = _parent.y + _m + i*_m*2
		var _xp = _parent.x + _m + _max_w / 2
		
		// Draw team score text
		draw_set_font(ft_small)
		draw_set_color(c_white)
		draw_set_halign(fa_center)
		draw_text(_xp, _yp, _lives)
		draw_set_halign(fa_left)
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
	
	return ds_list_size(teams) * _m * 2 // return height of inner elements
}