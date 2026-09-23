player = noone // reference to player object that planning layer belongs to

atree_max_depth = 3 //maximum depth Action tree can have
atree_list = ds_list_create() // list of nodes in Action tree
atree_curaction = undefined // current Action we are at
atree_update_time = 120 // after how many frames to update Action tree
atree_update_counter = atree_update_time

// Player progress state
pstate = { // the current 'progress state' of the player
	hp: 0,
	defpower: 0,
	mission_success: 0,
	sochealth: 0,
	knowlegde: 0
}

// Weights
w_hp = 1000
w_defpower = 100
w_mission_success = 10
w_sochealth = 10
w_knowledge = 1

function compute_social_health(_x, _y) {
	show_error("Not implemented", true)
}

function compute_path_cost(_dest_x, _dest_y) {
	show_error("Not implemented", true)
}

// Compute defense power based on current weapon state
function compute_defpower() {	
	show_error("Not implemented", true)
	
	//if (!instance_exists(player))
	//	show_error("Player does not exist", true)
	
	//if (!instance_exists(player.weapon)) // if has no weapon
	//	return 0
}