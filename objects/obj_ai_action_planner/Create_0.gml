event_inherited()

player = noone // reference to player object that planning layer belongs to

wstate_weights = new WholeStateWeights() // weights associated with each wstate dimension

// Timer
tree_update_frames = 120 // set timer lengths
path_update_frames = 120

/// @description Compute H cost for AIAction element
/// @context obj_ai_action_planner
function compute_h_cost(_action) {
	_action.h_cost = -wstate_weights.w_hp * _action.expected_wstate.hp 
			- wstate_weights.w_defense_power * _action.expected_wstate.defense_power
			- wstate_weights.w_mission_success * _action.expected_wstate.mission_success
			- wstate_weights.w_social_health * _action.expected_wstate.social_health
			- wstate_weights.w_knowledge * _action.expected_wstate.knowledge
}

/// @description For a given x, y position, compute the social energy, which is given by height of manifold bulked by teammates
/// (positive/attractive social energy) and dented by enemies (negative/repulsive), seen by vision of player
/// @param {real} x
/// @param {real} y
/// @param {ds_list} _teammates List of teammate Pois
/// @param {ds_list} _enemies List of enemy Pois
/// @returns {integer} Height on manifold, between -500 and 500
function compute_social_energy(_x, _y, _teammates, _enemies) {	 
	show_error("Not implemented", true)
}

/// @description For a weapon and given hp_max value compute the defense power which measures how many kiks can be made using weapon
/// @param {Inst} _weapon Instance of obj_weapon
/// @param {integer} hp_max Maximum HP for living character
/// @returns {real} The defense power, roughly representing how many kiks can be made with weapon
function compute_defense_power(_weapon, _hp_max) {
	if (!object_is_class(_weapon.object_index, obj_weapon_gun))
		show_error("Computation of defense power for non-gun type not implemented yet.", true)

	var _nr_bullets = _weapon.ammo_mag + _weapon.ammo_reserve
	return _nr_bullets *_weapon.stats.damage /_hp_max
}

function compute_path_cost(_dest_x, _dest_y) {	
	show_error("Not implemented", true)
}