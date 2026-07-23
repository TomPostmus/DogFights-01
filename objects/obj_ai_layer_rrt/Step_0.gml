if (body_x != undefined && body_y != undefined && body_th != undefined && cost_field != undefined) { // check if received inputs from player

	// Update RRT
	rrt_curbranch ??= new rrt_turn_element(undefined, body_x, body_y, body_th, body_th) // if no current branch, make identity turn element as root element
	
	// Update H cost and S cost
	for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
		var _branch = rrt_branches[|i]
			
		_branch.h_cost = cost_field(_branch.x_end, _branch.y_end, _branch.th_end) // update heuristic cost from cost field
		_branch.s_cost = _branch.g_cost + _branch.h_cost // update S cost
	}
	
	// Grow or prune RRT
	{
	
		// choose whether to grow or prune
		var _rrt_size = ds_list_size(rrt_branches)
		var _rrt_max_size = 50
		//var _prune_chance = max(0, (_rrt_size / _rrt_max_size - 0.5) * 2) // random chance for pruning
		var _prune = _rrt_size >= _rrt_max_size// || irandom(100 * _prune_chance) // whether to prune grid
	
		var _nr_open = ds_list_size(rrt_branches_open) // number of open cells
		
		var _cost_min = infinity
		var _cost_max = -infinity
		for (var i = 0; i < _nr_open; i ++) { // update costs and determine min and max costs
			var _cell = rrt_branches_open[|i]
		
			var _s_cost = _cell.s_cost
				
			if (_s_cost < _cost_min) // define min and max S costs
				_cost_min = _s_cost
			if (_s_cost > _cost_max)
				_cost_max = _s_cost
		}
	
		var _chosen = undefined // chosen cell for exploration
	
		if (_nr_open == 1) { // if just one cell
		
			_chosen = rrt_branches_open[|0] // choose that one
		
		} else if (_nr_open > 1) { // do power law weighting for choosing cell
	
			var _ws = array_create(_nr_open) // weights
			var _w_sum = 0 // sum of weights
			var _cost_range = _cost_max - _cost_min // range of cost (same for each cell)
			for (var i = 0; i < _nr_open; i ++) {
				var _cell = rrt_branches_open[|i]
		
				var _cost_norm = 0.1 + 0.9 * (_cell.s_cost - _cost_min) / _cost_range // normalise in range of 0.1, 1
				if (!_prune)		
					_ws[i] = 1 / power(_cost_norm, 1) // power of cost (the higher the power, the stronger lower costs are favoured)
				else
					_ws[i] = power(_cost_norm, 1) // otherwise weight is inverse (the higher costs are favoured for pruning)
				_w_sum += _ws[i]
			}
	
			// choose cell randomly, weighted with cost
			var _rn = random(1) // draw random number within 0, 1
			var _acc = 0 // var that accumulates probabilities
			for (var i = 0; i < _nr_open; i ++) {
				var _p_i = _ws[i] / _w_sum // probability of branch i
				if (_rn >= _acc && _rn < _acc + _p_i) { // if _rn falls between weighted portion
					_chosen = rrt_branches_open[|i] // choose this cell
					break
				}
				_acc += _p_i
			}
		
		}
	
		if (_chosen != undefined) { // if cell was chosen
		
			if (!_prune) { // if explore
			
				//var _bundle = ds_list_create() // bundle of five elements: left forward arc, straight forward segment and right forward arc, left backward arc, straight backward segment and right backward arc
				// excluding the one that is identical to the one it came with
				
				var _nr_added = 0 // how many branches are added to chosen node
				
				if !(_chosen.type == RRT_STRAIGHT && _chosen.gear == RRT_BACKWARD) { // check element type of how it came here
					var _straight_f = new rrt_straight_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, rrt_straight_len, RRT_FORWARD) // make forward straight element
					if (!_straight_f.collision_free(colslider, obstr_objects)) { // if has collision
						_straight_f.destroy()
					} else _nr_added ++
				}
				
				if !(_chosen.type == RRT_STRAIGHT && _chosen.gear == RRT_FORWARD) {
					var _straight_b = new rrt_straight_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, rrt_straight_len, RRT_BACKWARD) // make backward straight element
					if (!_straight_b.collision_free(colslider, obstr_objects)) {
						_straight_b.destroy()
					} else _nr_added ++
				}
				
				if !(_chosen.steering == RRT_LEFT && _chosen.gear == RRT_BACKWARD) {
					var _arc_left_f = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, rrt_arc_len, RRT_LEFT, RRT_FORWARD) // make forward left arc
					if (!_arc_left_f.collision_free(colslider, obstr_objects)) {
						_arc_left_f.destroy()
					} else _nr_added ++
				}
				
				if !(_chosen.steering == RRT_LEFT && _chosen.gear == RRT_FORWARD) {
					var _arc_left_b = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, rrt_arc_len, RRT_LEFT, RRT_BACKWARD) // make backward left arc
					if (!_arc_left_b.collision_free(colslider, obstr_objects)) {
						_arc_left_b.destroy()
					} else _nr_added ++
				}
				
				if !(_chosen.steering == RRT_RIGHT && _chosen.gear == RRT_BACKWARD) {
					var _arc_right_f = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, rrt_arc_len, RRT_RIGHT, RRT_FORWARD) // make forward right arc
					if (!_arc_right_f.collision_free(colslider, obstr_objects)) {
						_arc_right_f.destroy()
					} else _nr_added ++
				}
				
				if !(_chosen.steering == RRT_LEFT && _chosen.gear == RRT_FORWARD) {
					var _arc_right_b = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, rrt_arc_len, RRT_RIGHT, RRT_BACKWARD) // make backward right arc
					if (!_arc_right_b.collision_free(colslider, obstr_objects)) {
						_arc_right_b.destroy()
					} else _nr_added ++
				}
			
				// TODO: add retrieval of lowest cost direction information from cost field
				//if (_chosen.type != RRT_TURN) {
				//	var _mani_dist = point_distance(0, 0, _chosen.mani_tang_x, _chosen.mani_tang_y) // magnitude and direction of projected normal vector of tangent plane
				//	var _mani_dir = point_direction(0, 0, _chosen.mani_tang_x, _chosen.mani_tang_y)
				//	//if (_mani_dist >= 0.001) { // if tangent plane is sufficiently inclined
				//		var _turn = new rrt_turn_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _mani_dir) // make turn element in direction of tangent plane slope
				//		if (_turn.collision_free(colslider, obstr_objects)) {
				//			ds_list_add(_bundle, _turn) // add to list
				//		} else {
				//			ds_list_destroy(_turn.links) // else destroy
				//		}
				//	//}
				//}
							
				// chosen branch no longer open
				var i = ds_list_find_index(rrt_branches_open, _chosen) // find in open list
				ds_list_delete(rrt_branches_open, i) // remove chosen branch from open branch list
				_chosen.open = false // set open property to false
			
				// if only 1 open branch and 0 branches could be added
				if (_nr_open == 1 && _nr_added == 0) {
					rrt_curbranch.destroy() // destroy root, player is likely stuck or drifted away from tree root position
				}
			
			} else { // if prune
			
				_chosen.destroy()
			
			}
		
		}
	
	}
	
	// Find minimal cost node, and compute path to that node
	{
	
		// find destination branch
		var _destination = rrt_curbranch // destination branch
		var _min_cost = infinity
		for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
			var _branch = rrt_branches[|i]
				
			if (_branch.h_cost == undefined) // if newly added cell, heuristic cost is not defined yet
				continue // skip
				
			var _s_cost = _branch.g_cost + _branch.h_cost
				
			if (_s_cost < _min_cost) {
				_destination = _branch
				_min_cost = _s_cost
			}
		}
		
		// compute path
		ds_list_clear(rrt_path) // clear path
		var _next_branch = _destination // start backtracking from destination
		ds_list_insert(rrt_path, 0, _next_branch) // add destination to path
		while (_next_branch != rrt_curbranch) { // backtrack through parents until found current (root) branch
			_next_branch = _next_branch.parent
			ds_list_insert(rrt_path, 0, _next_branch)
		}
	
	}
	
	// Compute movement outputs based on current branch
	{
	
		var _abort = false // abort flag for aborting RRT, e.g. in case player has drifted too far from the tree
		var _abortion_tolerance = 35 // deviation distance from current element, from which to abort path
		if (!rrt_branch_completed) {
		
			// check timer for completing element
			rrt_walk_timer --
			if (rrt_walk_timer <= 0)
				_abort = true // maximal time for completing element elapsed, abort RRT tree
			
		
			if (rrt_curbranch.type == RRT_TURN) { // execute turn					
				move_input = 0
				turn_input = sign(angle_difference(rrt_curbranch.th_end, body_th))
					
				// RRT path abortion
				if (point_distance(body_x, body_y, rrt_curbranch.x, rrt_curbranch.y) > _abortion_tolerance)
					_abort = true // raise flag
					
				// check completion
				var _completion_tolerance = 3 // completion tolerance (in degrees) on when turn is considered to be completed
				if (abs(angle_difference(rrt_curbranch.th_end, body_th)) < _completion_tolerance) {
					rrt_branch_completed = true
				}
			} else if (rrt_curbranch.type == RRT_STRAIGHT) {
				move_input = rrt_curbranch.gear // move according to gear
				turn_input = 0
				
				var _to_player_dir = point_direction(rrt_curbranch.x, rrt_curbranch.y, body_x, body_y) // direction and distance from line base to player
				var _to_player_dist = point_distance(rrt_curbranch.x, rrt_curbranch.y, body_x, body_y)
				var _center_offset = lengthdir_y(_to_player_dist, angle_difference(_to_player_dir, rrt_curbranch.th)) // offset of player from line (treat this lengthdir_y as a sin())
				var _progression = rrt_curbranch.gear * lengthdir_x(_to_player_dist,  angle_difference(_to_player_dir, rrt_curbranch.th)) // progression on line (treat this lengthdir_x as cosine)
					
				// RRT path abortion
				if (abs(_center_offset) > _abortion_tolerance)
					_abort = true // raise flag
				if (_progression < -_abortion_tolerance || _progression > rrt_curbranch.l + _abortion_tolerance)
					_abort = true
				
				// check completion
				var _completion_tolerance = 2 // tolerance (in pixels) on when line is considered to be completed
				if (_progression >=  max(0, rrt_curbranch.l - _completion_tolerance)) { // if progression exceeds is on line segment length
					rrt_branch_completed = true
				}
			} else if (rrt_curbranch.type == RRT_ARC) {
				move_input = rrt_curbranch.gear // move according to gear and steering
				turn_input = rrt_curbranch.gear * rrt_curbranch.steering
				
				var _to_player_dist = point_distance(rrt_curbranch.center_x, rrt_curbranch.center_y, body_x, body_y) // distance and direction from arc center to player
				var _progression = angle_difference(body_th, rrt_curbranch.th) * rrt_curbranch.steering * rrt_curbranch.gear // progression is measure as difference with start angle of arc, normalized to 0, arc_length
			
				// RRT path abortion
				var _abrt_angle_tolerance = 10 // tolerance in degrees for arc angle progression
				if (_to_player_dist > RRT_R + _abortion_tolerance || _to_player_dist < RRT_R - _abortion_tolerance) // if distance from arc too large
					_abort = true // raise flag
				if ( _progression < -_abrt_angle_tolerance)
					_abort = true
				
				// check completion
				var _completion_tolerance = 1 // tolerance on when path element is considered to be completed
				if (_progression >= rrt_curbranch.l - _completion_tolerance) {
					rrt_branch_completed = true
				}
			}			
				
		// If completed walking the current branch wait until next branch is chosen
		} else {
			
			// do check if we are not drifting in the mean time
			var _dist = point_distance(body_x, body_y, rrt_curbranch.x_end, rrt_curbranch.y_end) // deviation to end point
			if (_dist >= _abortion_tolerance)
				_abort = true
			
			// choose next branch from the path as current branch
			if (ds_list_size(rrt_path) > 1) {
				ds_list_delete(rrt_path, 0) // delete 1st element (that is the branch we just completed)
				var _next_branch = rrt_path[|0] // choose next branch
				
				var _next_branch_i = ds_list_find_index(rrt_curbranch.links, _next_branch)
				ds_list_delete(rrt_curbranch.links, _next_branch_i) // decouple next branch from old branch, to avoid deleting the chosen branch along with deleting old branch
				rrt_curbranch.destroy() // destroy old branch
				rrt_curbranch = _next_branch
				rrt_curbranch.parent = undefined // new root, so no parent
				rrt_branch_completed = false
				rrt_walk_timer = rrt_walk_maxtime // reset timer
				
				var _g_cost_before = rrt_curbranch.g_cost // remember G cost before reset
				for (var i = 0; i < ds_list_size(rrt_branches); i ++)			
					rrt_branches[|i].g_cost -= _g_cost_before // subtract G cost for every branch			
			}
		
		}
		
		// Check if abort flag was raised
		if (_abort) {
			rrt_curbranch.destroy() // destroy RRT
		}
	
	}

}