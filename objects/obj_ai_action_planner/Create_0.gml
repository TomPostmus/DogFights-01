player = noone // reference to player object that planning layer belongs to

atree_max_depth = 3 //maximum depth Action tree can have
atree_list = ds_list_create() // list of nodes in Action tree
atree_curaction = undefined // current Action we are at
atree_update_time = 120 // after how many frames to update Action tree
atree_update_counter = atree_update_time

// Player progress state
wstate = new WellnessState()
wstate_weights = new WellnessStateWeights() // weights associated with each wstate dimension

// For a given x, y position, compute the social energy, which is given by height of manifold bulked by teammates
// (positive/attractive social energy) and dented by enemies (negative/repulsive), seen by vision of player
/// @param {real} x
/// @param {real} y
/// @param {ds_list} _teammates List of teammate Pois
/// @param {ds_list} _enemies List of enemy Pois
/// @returns {integer} Height on manifold, between -500 and 500
function compute_social_energy(_x, _y, _teammates, _enemies) {	 
	show_error("Not implemented", true)
}

// For a weapon and given hp_max value compute the defense power which measures how many kiks can be made using weapon
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