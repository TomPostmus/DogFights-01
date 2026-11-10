slots = undefined
game_size = undefined
game_mode = undefined
game_state = undefined
game_settings = ds_map_create()

// Register damage, check team ids and decide whether to deal damage
function register_damage(_p_affected, _p_affector, _damage) {
	_p_affected.hp.register_damage(_p_affector, _damage) // register at hp object
}