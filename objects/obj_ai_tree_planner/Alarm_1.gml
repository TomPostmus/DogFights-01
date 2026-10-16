/// @description Path update event

alarm[1] = path_update_frames // rearm timer

// Update H and S costs of elements
for (var i = 0; i < ds_list_size(elements); i ++) {
	var _element = elements[|i]
	
	compute_h_cost(_element) // compute H cost for element
	_element.s_cost =_element.h_cost + _element.g_cost // compute S cost
}

// Compute path
