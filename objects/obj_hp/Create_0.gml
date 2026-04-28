// obj_player_hp: Contains player health and handles regeneration logic.

player = noone // player reference

// Health state
hp = 0
hp_previous = 0

// Health constants
hp_max = 100
hp_regen_downtime = 200
hp_regen_amount = 10
hp_regen_time = 120
hp_regen_tick = 0

// Damage bill
damage_bill = ds_list_create() // list of tuples mapping player to damage dealt [player, damage] like a bill
last_affector = noone // last affector player that dealt damage

// Initialize hp (e.g. when spawning)
function init_hp() {
	hp = hp_max
}

// Register damage
function register_damage(_p_affector, _damage) {
	hp -= _damage
	
	ds_list_add(damage_bill, [_p_affector, _damage]) // add entry to bill
	
	last_affector = _p_affector // remember the player as last affector player that dealt damage
}

// Add to, or subtract from hp
function add_hp(_additive_hp) {
	hp += _additive_hp
}