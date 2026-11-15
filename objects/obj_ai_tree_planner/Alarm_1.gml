/// @description State machine update event

alarm[1] = path_update_frames // rearm timer

update_costs()
	
if (sm_state == "explore") {
	
	// Find element with lowest H cost
	var _destination = find_destination_lowest_h_cost()
	if (_destination) {
			
		compute_path(_destination)
			
		if (_destination.h_cost < sm_h_cost_threshold) // if branch to destination found
			sm_state = "optimize"
			
	}
	
} else if (sm_state == "optimize") {
	
	// Find element to destination with lowest G cost
	var _destination = find_destination_lowest_g_cost_within_completion()
	if (_destination)
		compute_path(_destination)
		
	if (root && root.h_cost < sm_h_cost_threshold) // if root is at destination
		sm_state = "done" // go to done state
	
}