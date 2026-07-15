// Grow RRT given a certain motion planning field (rrt_field)
function rrt_update(_body_x, _body_y, _body_rot){
	
	var _nr_branches = ds_list_size(rrt_branches)
	
	// (re)compute manifold properties and S cost for each branch
	for (var i = 0; i < _nr_branches; i ++) {
		var _branch = rrt_branches[|i]
							
		var _field_vars = rrt_field(_branch.x_end, _branch.y_end, _branch.th_end)
		_branch.mani_z = _field_vars[0]
		_branch.mani_tang_x = _field_vars[1]
		_branch.mani_tang_y = _field_vars[2]
		_branch.mani_slope = _field_vars[3]
		
		rrt_compute_s_cost(_branch)
	}
	
	// find maximum and minimum S cost between open branches
	var _s_cost_min = infinity
	var _s_cost_max = -infinity
	for (var i = 0; i < _nr_branches; i ++) {
		var _branch = rrt_branches[|i]
		var _s_cost = _branch.s_cost
				
		// define min and max S costs
		if (_s_cost < _s_cost_min) 
			_s_cost_min = _s_cost
		if (_s_cost > _s_cost_max)
			_s_cost_max = _s_cost
	}

	var _rrt_max_tree_size = 50
	var _prune_chance = max(0, (_nr_branches / _rrt_max_tree_size - 0.5) * 2) // random chance for pruning
	var _grow_or_prune = _nr_branches < _rrt_max_tree_size //&& !(irandom(100 * _prune_chance)) // whether to grow tree (true) or prune (false)
	
	if (_grow_or_prune) {
	repeat(1) { // how many branches to create per step
				
		// choose an open branch based on probability weighted with h cost
		var _chosen = undefined // the chosen branch
		var _nr_open = ds_list_size(rrt_branches_open)
		
		if (_nr_open == 0) { // if there are no open branches
			rrt_mark_del(rrt_branch) // reset tree
			rrt_branch = undefined
		} else if (_nr_open == 1) { // if there is only 1 branch
			_chosen = rrt_branches_open[|0]
		} else {				
			// do power-law weighting to determine weights for branches
			var _ws = array_create(_nr_open) // weights
			var _w_sum = 0 // sum of weights
			for (var i = 0; i < _nr_open; i ++) {
				var _branch = rrt_branches_open[|i]
				
				var _cost_norm = 1 + 9 * (_branch.s_cost - _s_cost_min) / (_s_cost_max - _s_cost_min) // normalize cost vals between 1 and 10 to avoid div by zero (or close to zero)
					
				var _w = 1 / power(_cost_norm, rrt_powerlaw_p) // compute weight
				_w_sum += _w
				_ws[i] = _w
			}
			
			// choose branch randomly, taking into account weights
			var _rn = random(1) // random number from 0 to 1
			var _acc = 0 // var that accumulates probabilities
			for (var i = 0; i < _nr_open; i ++) {
				var _p_i = _ws[i] / _w_sum // probability of branch i
				if (_rn >= _acc && _rn < _acc + _p_i) { // if _rn falls between weighted portion
					_chosen = rrt_branches_open[|i] // choose this branch
					break
				}
				_acc += _p_i
			}
		}
				
		// create new branch
		if (_chosen != undefined) {
			
			// build bundle on chosen branch
			var _straight_len = 20
			var _arc_len = 22.5
			var _bundle = ds_list_create() // bundle of five elements: left forward arc, straight forward segment and right forward arc, left backward arc, straight backward segment and right backward arc
				// excluding the one that is identical to the one it came with
				
			if (false && abs(_chosen.h_cost) < rrt_tolerance) { // if chosen branch falls within completion tolerance
				var _identity_turn = new rrt_turn_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _chosen.th_end) // make identity turn (this will prevent new elements being added to position we're already satisfied with)
				ds_list_add(_bundle, _identity_turn)
			} else {
				if !(_chosen.type == RRT_STRAIGHT && _chosen.gear == RS_BACKWARD) { // check element type of how it came here
					var _straight_f = new rrt_straight_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _straight_len, RS_FORWARD) // make forward straight element
					if (_straight_f.collision_free(colslider, obstr_objects)) { // check if has no collisions
						ds_list_add(_bundle, _straight_f) // add to list
					} else {
						ds_list_destroy(_straight_f.links) // else destroy
					}
				}
				
				if !(_chosen.type == RRT_STRAIGHT && _chosen.gear == RS_FORWARD) {
					var _straight_b = new rrt_straight_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _straight_len, RS_BACKWARD) // make backward straight element
					if (_straight_b.collision_free(colslider, obstr_objects)) { // check if has no collisions
						ds_list_add(_bundle, _straight_b) // add to list
					} else {
						ds_list_destroy(_straight_b.links) // else destroy (freeing links list, struct itself is further not referenced so automatically garb. collected)
					}
				}
				
				if !(_chosen.steering == RS_LEFT && _chosen.gear == RS_BACKWARD) {
					var _arc_left_f = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _arc_len, RS_LEFT, RS_FORWARD) // make forward left arc
					if (_arc_left_f.collision_free(colslider, obstr_objects)) {
						ds_list_add(_bundle, _arc_left_f) // add to list
					} else {
						ds_list_destroy(_arc_left_f.links) // else destroy
					}
				}
				
				if !(_chosen.steering == RS_LEFT && _chosen.gear == RS_FORWARD) {
					var _arc_left_b = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _arc_len, RS_LEFT, RS_BACKWARD) // make backward left arc
					if (_arc_left_b.collision_free(colslider, obstr_objects)) {
						ds_list_add(_bundle, _arc_left_b) // add to list
					} else {
						ds_list_destroy(_arc_left_b.links) // else destroy
					}
				}
				
				if !(_chosen.steering == RS_RIGHT && _chosen.gear == RS_BACKWARD) {
					var _arc_right_f = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _arc_len, RS_RIGHT, RS_FORWARD) // make forward right arc
					if (_arc_right_f.collision_free(colslider, obstr_objects)) {
						ds_list_add(_bundle, _arc_right_f) // add to list
					} else {
						ds_list_destroy(_arc_right_f.links) // else destroy
					}
				}
				
				if !(_chosen.steering == RS_LEFT && _chosen.gear == RS_FORWARD) {
					var _arc_right_b = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _arc_len, RS_RIGHT, RS_BACKWARD) // make backward right arc
					if (_arc_right_b.collision_free(colslider, obstr_objects)) {
						ds_list_add(_bundle, _arc_right_b) // add to list
					} else {
						ds_list_destroy(_arc_right_b.links) // else destroy
					}
				}
			
				if (_chosen.type != RRT_TURN) {
					//var _furthvis_pt = astpath_compute_furthest_visible_point(_chosen.x_end, _chosen.y_end) // index of furthest visible point
				
					//var _pt_x = path_get_point_x(astpath, _furthvis_pt)
					//var _pt_y = path_get_point_y(astpath, _furthvis_pt)
					//var _furthvis_dir = point_direction(_chosen.x_end, _chosen.y_end, _pt_x, _pt_y) // distance and direction from element end point to furthest visible point
					//var _furthvis_dist = point_distance(_chosen.x_end, _chosen.y_end, _pt_x, _pt_y)
				
					//var _pt_dir = astpath_ths[|_furthvis_pt] // orientation of furthest visible  A* path point
					//var _weight = min(1, _furthvis_dist / astpath_cell_size) // weight is 1 if dist is larger than or eq to A* cell size
					//var _dir = _pt_dir * (1 - _weight) + _furthvis_dir * _weight // weigthed orientation
				
					var _mani_dist = point_distance(0, 0, _chosen.mani_tang_x, _chosen.mani_tang_y) // magnitude and direction of projected normal vector of tangent plane
					var _mani_dir = point_direction(0, 0, _chosen.mani_tang_x, _chosen.mani_tang_y)
					//if (_mani_dist >= 0.001) { // if tangent plane is sufficiently inclined
						
						var _turn = new rrt_turn_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _mani_dir) // make turn element in direction of tangent plane slope
						if (_turn.collision_free(colslider, obstr_objects)) {
							ds_list_add(_bundle, _turn) // add to list
						} else {
							ds_list_destroy(_turn.links) // else destroy
						}
						
					//}
				}
			}
				
			// for new branches in bundle, compute costs and add to relevant lists
			var _nr_added = ds_list_size(_bundle) // number of branches added at end of chosen branch
			for (var i = 0; i < _nr_added; i ++) {
				var _new_branch = _bundle[|i]
				ds_list_add(_chosen.links, _new_branch) // add new branch to chosen branch links
				ds_list_add(rrt_branches, _new_branch) // add to total list of branches
				ds_list_add(rrt_branches_open, _new_branch) // add new branch to open branches list
			}
				
			// if elements were added
			rrt_grow(_chosen, _nr_added) // backpropagate branch thickness growth
			//if (_nr_added > 0) {
				//rrt_repdrop_counter += 1
				//if (rrt_repdrop_counter >= rrt_repdrop_every) {
				//	var _rep_source = create_groundhigh(_chosen.x, _chosen.y, obj_ai_apf_source)
				//	ds_list_add(apf_sources, _rep_source)
				//	rrt_repdrop_counter = 0
				//}
			//}
				
			var i = ds_list_find_index(rrt_branches_open, _chosen) // find in open list
			ds_list_delete(rrt_branches_open, i) // remove chosen branch from open branch list (it's no longer open), also if 0 branches were added (it's not suitable for choice in later steps)
			ds_list_destroy(_bundle)
			
			// if only 1 open branch and 0 branches could be added
			if (_nr_open == 1 && _nr_added == 0) {
				rrt_mark_del(rrt_branch) // mark root for deletion, player is likely stuck or drifted away from tree root position (not well tested yet)
				rrt_branch = undefined
			}
		}
			
	}
	
	// Else, prune tree
	} else {
		
		var _chosen = undefined // the chosen branch to prune
				
		// do power-law weighting to determine weights for branches
		var _ws = array_create(_nr_branches) // weights
		var _w_sum = 0 // sum of weights
		for (var i = 0; i < _nr_branches; i ++) {
			var _branch = rrt_branches[|i]
				
			var _cost_norm = 1 + 9 * (_branch.s_cost - _s_cost_min) / (_s_cost_max - _s_cost_min) // normalize cost vals between 1 and 10 to avoid div by zero (or close to zero)
					
			var _w = power(_cost_norm, rrt_powerlaw_p) // compute weight
			_w_sum += _w
			_ws[i] = _w
		}
			
		// choose branch randomly, taking into account weights
		var _rn = random(1) // random number from 0 to 1
		var _acc = 0 // var that accumulates probabilities
		for (var i = 0; i < _nr_branches; i ++) {
			var _p_i = _ws[i] / _w_sum // probability of branch i
			if (_rn >= _acc && _rn < _acc + _p_i) { // if _rn falls between weighted portion
				_chosen = rrt_branches[|i] // choose this branch
				break
			}
			_acc += _p_i
		}
		
		// Prune branch
		if (_chosen != undefined) {
			rrt_mark_del(_chosen) // mark for deletion
		}
		
	}
	
	// Prune RTT branch if it is in contact with dynamic objects (players)
	//for (var i = 0; i < ds_list_size(rrt_branches); i ++) { // loop through all branches
	//	var _branch = rrt_branches[|i]
		
	//	var _contact = instance_position(_branch.x_end, _branch.y_end, obj_hitmask)
	//	if (instance_exists(_contact) && _contact.player != player) {// if endpoint is in contact with a hitmask
	//		var _child_count = rrt_mark_del(_branch) // mark for deletion
			
	//		if (_branch.parent != undefined) { // if has parent
	//			var _branch_i = ds_list_find_index(_branch.parent.links, _branch)
	//			ds_list_delete(_branch.parent.links, _branch_i) // remove this branch from its parent's links
				
	//			_branch.parent.thickness -= _child_count // subtract number of children that was removed from thickness so that thickness represents again how many child branches are hanging from parent branch
	//		}
			
	//		if (_branch == rrt_branch) // if to be pruned branch is current root branch
	//			rrt_branch = undefined // reset current rrt_branch variable
	//	}
	//}

}