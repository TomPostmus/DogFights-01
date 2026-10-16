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
	
	/// @function deep_copy() Return deep copy of self
	/// @description Returns a deep copy of WholeState, where pois is a unique list with unique POI structs
	/// @returns {WholeState} The deep copied WholeState
	/// @context WholeState
	function deep_copy() {
		var _wstate_copy = variable_clone(self) // clone all fields
		_wstate_copy.pois = ds_list_create() // create new list
		for (var i = 0; i < ds_list_size(pois); i ++)
			ds_list_add(_wstate_copy.pois, variable_clone(pois[|i])) // fill list with cloned POIs
			
		return _wstate_copy
	}
}

/// @function WholeStateWeights()
/// @description Weights struct, associating importance to each WholeState field for H cost computation
function WholeStateWeights() constructor {
	w_hp = 100
	w_defense_power = 500
	w_mission_success = 10
	w_social_health = 10
	w_knowledge = 1
}