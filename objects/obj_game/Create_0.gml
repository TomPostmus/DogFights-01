slots = undefined
game_size = undefined
game_mode = undefined
game_state = undefined
game_settings = ds_map_create()

is_initialized = false // game object is only initialized after Room Start to allow Creation Code initialization

// Register damage, check team ids and decide whether to deal damage
function register_damage(_p_affected, _p_affector, _damage) {
	_p_affected.hp.register_damage(_p_affector, _damage) // register at hp object
}


// Register that affected player has been kikked by affector player
function register_kik(_p_affected, _p_affector) {
	var _ti = _p_affector.team_id
	team_scores[_ti] += 1
}