/// @description Path update event

alarm[1] = path_update_frames // rearm timer

// Update H and S costs of elements
for (var i = 0; i < ds_list_size(elements); i ++) {
	var _element = elements[|i]
	
	compute_h_cost(_element) // compute H cost for element
	_element.s_cost =_element.h_cost + _element.g_cost // compute S cost
}

// Compute path
if (path_mode == AI_PATH_MODE.DESTINATION_BASED) {
	
	var _destination = undefined
	var _s_cost_min = infinity
	for (var i = 0; i < ds_list_size(elements); i ++) // find destination first
		if (elements[|i].s_cost < _s_cost_min) {
			_s_cost_min = elements[|i].s_cost
			_destination = elements[|i]
		}
	
	if (_destination)
		compute_path(_destination)
	
} else if (path_mode == AI_PATH_MODE.FLOW_BASED) {

	compute_path_flow()

}