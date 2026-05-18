// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function rrt_update_tree(){
	var body = player.body
	var _body_x = body.get_x()
	var _body_y = body.get_y()
	var _body_rot = body.get_rotation()

	var _rrt_max_tree_size = 300
	if (ds_list_size(rrt_branches) < _rrt_max_tree_size) {
	repeat(1) {
				
		// choose an open branch based on probability weighted with h cost
		var _chosen = undefined // the chosen branch
		var _nr_open = ds_list_size(rrt_open_branches)
		if (_nr_open == 1) // if there is only 1 branch
			_chosen = rrt_open_branches[|0]
		else {
			// find maximum and minimum h cost between open branches
			var _cost_min = infinity
			var _cost_max = -infinity
			for (var i = 0; i < _nr_open; i ++) {
				var _branch = rrt_open_branches[|i]
				var _cost = _branch.h_cost + _branch.g_cost
				if (_cost < _cost_min) 
					_cost_min = _cost
				if (_cost > _cost_max)
					_cost_max = _cost
			}
				
			// do power-law weighting
			var _e = 0.00001 // small constant to avoid div by zero
			var _p = 1.8 // power coefficient, p = 0 means uniform dist., p = 1 means mild preference for lower H cost, p = 2 means strong preference
			var _ws = array_create(_nr_open)
			var _w_sum = 0
			for (var i = 0; i < _nr_open; i ++) {
				var _branch = rrt_open_branches[|i]
				var _cost = _branch.h_cost + _branch.g_cost
				var _cost_norm = 1 + 9 * (_cost - _cost_min) / (_cost_max - _cost_min) // normalize cost vals between 1 and 10
					
				var _w = 1 / power(_cost_norm + _e, _p) // compute weight
				_w_sum += _w
				_ws[i] = _w
			}
				
			var _rn = random(1) // random number from 0 to 1
			var _acc = 0 // var that accumulates probabilities
			for (var i = 0; i < _nr_open; i ++) {
				var _p_i = _ws[i] / _w_sum // probability of branch i
				if (_rn >= _acc && _rn < _acc + _p_i) { // if _p falls between weighted portion
					_chosen = rrt_open_branches[|i] // choose this branch
					break
				}
				_acc += _p_i
			}
		}
				
		// create new branch
		if (_chosen != undefined) {
			//_dist = point_distance(_nearest.x_end, _nearest.y_end, _pt_test_x, _pt_test_y) // distance branch end point to test point
			//_dir = point_direction(_nearest.x_end, _nearest.y_end, _pt_test_x, _pt_test_y)
			//var _angdiff = angle_difference(_dir, _nearest.th_end) // angle diff from node orientation to test point orientation
				
			//var _angdiff_discr = floor(abs(_angdiff) / 22.5) // divide up into discrete angle difference
			//if (_angdiff_discr == 0) { // if is approximately in same direction
			//	var _new_branch = new rrt_straight_element(_nearest, _nearest.x_end, _nearest.y_end, _nearest.th_end, 25, RS_FORWARD) // try straight element
			//	var _return_code = _new_branch.shorten(colslider, obstr_objects)
					
			//	if (_return_code != 0) { // if shorten succesful or unnecessary (collision free without shortening)
			//		_new_branch.compute_g_cost(rrt_branch.g_cost) // compute cost variables for RRT*
			//		_new_branch.h_cost = compute_h_cost(_new_branch.x_end, _new_branch.y_end, _new_branch.th_end)
			//		ds_list_add(_nearest.links, _new_branch) // add new branch to branch links
			//		ds_list_add(rrt_branches, _new_branch) // add to total list of branches
			//		_nearest.grow() // backpropagate branch thickness growth
			//	} else {
			//		_new_branch.destroy() // else destroy
			//	}
			//} else {
			//	var _new_arc = new rrt_arc_element(_nearest, _nearest.x_end, _nearest.y_end, _nearest.th_end, 22.5, sign(_angdiff), RS_FORWARD, rrt_arc_r) // try arc element
					
			//	if (_new_arc.collision_free(colslider, obstr_objects)) { // check if collision free
			//		_new_arc.compute_g_cost(rrt_branch.g_cost) // compute cost variables for RRT*
			//		_new_arc.h_cost = compute_h_cost(_new_arc.x_end, _new_arc.y_end, _new_arc.th_end)
			//		ds_list_add(_nearest.links, _new_arc) // add new branch to branch links
			//		ds_list_add(rrt_branches, _new_arc) // add to total list of branches
			//	} else {
			//		_new_arc.destroy() // else destroy
					
			//		//var _new_turn = new rrt_turn_element(_nearest, _nearest.x_end, _nearest.y_end, _nearest.th, _dir) // also make turn element with angle directly towards test point
					
			//		//_new_turn.compute_g_cost(rrt_branch.g_cost) // compute cost variables for RRT*
			//		//_new_turn.h_cost = compute_h_cost(_new_turn.x_end, _new_turn.y_end, _new_turn.th_end)
			//		//ds_list_add(_nearest.links, _new_turn) // add new branch to branch links
			//		//ds_list_add(rrt_branches, _new_turn) // add to total list of branches
			//	}
			//	_nearest.grow()
			//}
				
			// build bundle on chosen branch
			var _straight_len = 20
			var _arc_len = 22.5
			var _bundle = ds_list_create() // bundle of five elements: left forward arc, straight forward segment and right forward arc, left backward arc, straight backward segment and right backward arc
				// excluding the one that is identical to the one it came with
				
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
				var _furthvis_pt = compute_furthest_visible_point(_chosen.x_end, _chosen.y_end) // index of furthest visible point
				
				var _pt_x = path_get_point_x(astpath, _furthvis_pt)
				var _pt_y = path_get_point_y(astpath, _furthvis_pt)
				var _furthvis_dir = point_direction(_chosen.x_end, _chosen.y_end, _pt_x, _pt_y) // distance and direction from element end point to furthest visible point
				var _furthvis_dist = point_distance(_chosen.x_end, _chosen.y_end, _pt_x, _pt_y)
				
				//var _pt_dir = astpath_ths[|_furthvis_pt] // orientation of furthest visible  A* path point
				//var _weight = min(1, _furthvis_dist / astpath_cell_size) // weight is 1 if dist is larger than or eq to A* cell size
				//var _dir = _pt_dir * (1 - _weight) + _furthvis_dir * _weight // weigthed orientation
				
				var _turn = new rrt_turn_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, _furthvis_dir) // make turn element
				ds_list_add(_bundle, _turn)
			}
				
			// for new branches in bundle, compute costs and add to relevant lists
			var _nr_added = ds_list_size(_bundle) // number of branches added at end of chosen branch
			for (var i = 0; i < _nr_added; i ++) {
				var _new_branch = _bundle[|i]
				_new_branch.h_cost = compute_h_cost(_new_branch.x_end, _new_branch.y_end, _new_branch.th_end)
				ds_list_add(_chosen.links, _new_branch) // add new branch to chosen branch links
				ds_list_add(rrt_branches, _new_branch) // add to total list of branches
				ds_list_add(rrt_open_branches, _new_branch) // add new branch to open branches list
				rrt_grow(_chosen) // backpropagate branch thickness growth
			}
				
			// if elements were added, remove chosen branch from open branch list (it's no longer open)
			if (_nr_added > 0) {
				var i = ds_list_find_index(rrt_open_branches, _chosen)
				ds_list_delete(rrt_open_branches, i)
			}
			ds_list_destroy(_bundle)
		}
			
	}
	}
				
	// Walk RRT* branch element
	var _abort = false // abort flag
	if (!rrt_completed) {
		
		rrt_walk_timer --
		if (rrt_walk_timer <= 0)
			_abort = true // maximal time for completing element elapsed, abort RRT tree
			
			
		if (rrt_branch.type == RRT_ROOT) {
			rrt_completed = true
		} else if (rrt_branch.type == RRT_TURN) { // execute turn					
			move_input = 0
			turn_input = input_dir(rrt_branch.th_end)
					
			// RRT path abortion
			var _abortion_tolerance = 10 // distance from which to abort path
			if (point_distance(_body_x, _body_y, rrt_branch.x, rrt_branch.y) > _abortion_tolerance)
				_abort = true // raise flag
					
			// check completion
			var _completion_tolerance = 3 // completion tolerance (in degrees) on when turn is considered to be completed
			if (abs(angle_difference(rrt_branch.th_end, _body_rot)) < _completion_tolerance) {
				rrt_completed = true
			}
		} else if (rrt_branch.type == RRT_STRAIGHT) {
			move_input = rrt_branch.gear // move according to gear
			turn_input = input_dir(rrt_branch.th)
				
			var _to_player_dir = point_direction(rrt_branch.x, rrt_branch.y, _body_x, _body_y) // direction and distance from line base to player
			var _to_player_dist = point_distance(rrt_branch.x, rrt_branch.y, _body_x, _body_y)
			var _center_offset = lengthdir_y(_to_player_dist, angle_difference(_to_player_dir, rrt_branch.th)) // offset of player from line (treat this lengthdir_y as a sin())
			var _progression = rrt_branch.gear * lengthdir_x(_to_player_dist,  angle_difference(_to_player_dir, rrt_branch.th)) // progression on line (treat this lengthdir_x as cosine)
					
			// steering correction
			//var _correction_tolerance = 3 // tolerance outside which to start correcting
			//if (_center_offset > _correction_tolerance) { // deviated too much on left side
			//	turn_input = rrt_branch.gear // steer to right (or left if in reverse gear)
			//} else if (_center_offset < -_correction_tolerance) { // deviated too much on right side
			//	turn_input = -rrt_branch.gear // steer to left (or right if in reverse gear)
			//} else {
			//	turn_input = input_dir(rrt_branch.th)
			//}
					
			// RRT path abortion
			var _abortion_tolerance = 10 // distance from which to abort path
			if (_center_offset > _abortion_tolerance)
				_abort = true // raise flag
			if (_progression < -_abortion_tolerance || _progression > rrt_branch.l + _abortion_tolerance)
				_abort = true
				
			// check completion
			var _completion_tolerance = 1 // tolerance (in pixels) on when line is considered to be completed
			if (_progression >=  max(0, rrt_branch.l - _completion_tolerance)) { // if progression exceeds is on line segment length
				rrt_completed = true
			}
		} else if (rrt_branch.type == RRT_ARC) {
			move_input = rrt_branch.gear // move according to gear and steering
			turn_input = rrt_branch.gear * rrt_branch.steering
				
			var _to_player_dist = point_distance(rrt_branch.center_x, rrt_branch.center_y, _body_x, _body_y) // distance and direction from arc center to player
			var _to_player_dir = point_direction(rrt_branch.center_x, rrt_branch.center_y, _body_x, _body_y)
			var _arc_angle = _to_player_dir + 90 * rrt_branch.steering // what the angle of the arc is from player progression
			var _progression = rrt_branch.steering * rrt_branch.gear * angle_difference(_arc_angle, rrt_branch.th) // difference from arc starting angle to where player is on arc
					
			// steering correction
			//var _offset_tolerance = 5
			//if (_to_player_dist < RRT_R - _offset_tolerance) { // deviated too on inside of arc
			//	turn_input = 0 // stop steering, simply move straight until in center again
			//} else if (_to_player_dist > RRT_R + _offset_tolerance) { // deviated too on outside of arc
			//	if (abs(angle_difference(_arc_angle, _body_rot)) > 20) 
			//		move_input = 0 // stop movement, wait until angle is within acceptable limits
			//	turn_input = input_dir(_arc_angle + 10 * rrt_branch.steering * rrt_branch.gear)
			//} else {
			//	turn_input = input_dir(_arc_angle)
			//}
			
			turn_input = input_dir(_arc_angle)
					
			// RRT path abortion
			var _abortion_tolerance = 10 // distance from which to abort path
			var _abrt_angle_tolerance = radtodeg(_abortion_tolerance / RRT_R) // tolerance in degrees for arc angle progression
			if (_to_player_dist > RRT_R + _abortion_tolerance || _to_player_dist < RRT_R - _abortion_tolerance)
				_abort = true // raise flag
			if (_progression < -_abrt_angle_tolerance || _progression > rrt_branch.l + _abrt_angle_tolerance)
				_abort = true
				
			// check completion
			var _completion_tolerance = 0 // tolerance on when path element is considered to be completed
			if (_progression >= max(0, rrt_branch.l - _completion_tolerance)) {
				rrt_completed = true
			}
		}
	}
			
	// Check if abort flag was raised
	if (_abort) {
		rrt_mark_del(rrt_branch)
		rrt_branch = undefined
				
	// Choose next branch (wait if necessary), and delete the current branch (and children that are not chosen)
	} else if (rrt_completed) {
		var _cost = infinity
		var _next_branch = undefined
		var _next_branch_i = 0
		for (var i = 0; i < ds_list_size(rrt_branch.links); i ++) { // loop through linked branches of current branch
			var _link = rrt_branch.links[|i]
			var _link_cost = 2 * -_link.thickness// + _link.g_cost + _link.h_cost
			if (_link_cost < _cost) {
				_cost = _link_cost
				_next_branch = _link
				_next_branch_i = i // remember index in list
			}
		}
					
		if (_next_branch != undefined) { // if found the next branch to walk
			ds_list_delete(rrt_branch.links, _next_branch_i) // decouple chosen branch from old branch, to avoid deleting the chosen branch along with deleting old branch
			rrt_mark_del(rrt_branch) // delete old branch
			rrt_branch = _next_branch
			rrt_branch.parent = undefined // new branch is root, so has no parent
			rrt_completed = false
			rrt_walk_timer = rrt_walk_maxtime // reset timer
		} else { // otherwise, wait
			move_input = 0
			turn_input = 0
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