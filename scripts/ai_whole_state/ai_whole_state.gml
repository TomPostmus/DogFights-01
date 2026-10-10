/// @function WholeState()
/// @description Create a WholeState, consisting of internal player state and external vision state
function WholeState() constructor {
	hp = 0
	defense_power = 0
	social_health = 0
	mission_success = 0
	knowledge = 0
	pois = ds_list_create()
	
	// Cleanup WholeState
	function cleanup() {
		ds_list_destroy(pois)
	}
}

/// @function WholeStateWeights()
/// @description Weights struct, associating importance to each WholeState field for H cost computation
function WholeStateWeights() constructor {
	w_hp = 1000
	w_defense_power = 100
	w_mission_success = 10
	w_social_health = 10
	w_knowledge = 1
}