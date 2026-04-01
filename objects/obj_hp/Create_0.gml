// obj_player_hp: Contains player health and handles regeneration logic.

// Health state
hp = 0
hp_previous = 0

// Health constants
hp_max = 100
hp_regen_downtime = 200
hp_regen_amount = 10
hp_regen_time = 120
hp_regen_tick = 0

// Initialize hp (e.g. when spawning)
function init_hp() {
	hp = hp_max
}

// Add to, or subtract from hp
function add_hp(_additive_hp) {
	hp += _additive_hp
}