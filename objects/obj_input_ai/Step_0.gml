event_inherited()

turn_input = 0
move_input = 0
input_attack = false

// Delete RTT branches that are marked for deletion
for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
	var _branch = rrt_branches[|i]
	if (_branch.del) {
		var j = ds_list_find_index(rrt_open_branches, _branch) // also find in open branches list
		if (j != -1)
			ds_list_delete(rrt_open_branches, j)
		
		
		delete _branch // delete struct
		ds_list_delete(rrt_branches, i) // remove from list
		i --
	}
}

// Basic behaviour
if (instance_exists(player) && instance_exists(player.body)) {
	var body = player.body
	var camera = player.camera
	var weapon = player.weapon
	
	var _body_x = body.get_x()
	var _body_y = body.get_y()
	var _body_rot = body.get_rotation()
		
	//Find targets
	ds_list_clear(targets)
	for (var i = 0; i < instance_number(obj_player); i ++) {
		var target_player = instance_find(obj_player, i);
		if (target_player != player && instance_exists(target_player.body)
			&& (player.team_id == undefined || player.team_id != target_player.team_id)) {
			if (point_in_rectangle(target_player.body.get_x(), target_player.body.get_y(), camera.x - camera.get_width()/2, camera.y - camera.get_height()/2, camera.x + camera.get_width()/2, camera.y + camera.get_height()/2))
				ds_list_add(targets, target_player.body)
		}
	}
	
	//Find closest target
	self.target = noone
	var dist = infinity;
	for (var i = 0; i < ds_list_size(targets); i ++) {
		if (point_distance(body.get_x(), body.get_y(), targets[|i].get_x(), targets[|i].get_y()) < dist) {
			self.target = targets[|i];
			dist = point_distance(body.get_x(), body.get_y(), targets[|i].get_x(), targets[|i].get_y())
		}
	}
	
	//Choose state
	//var new_state = instance_exists(target) ? "attack" : "explore"
	//if (new_state != state) {
	//	if (path != undefined)
	//		path_delete(path)
	//	path = undefined
	//	state = new_state
	//}
	
	
	// Update decision tree
	dtree_timer --
	if (dtree_timer <= 0) {
		update_decision_tree()
		dtree_timer = dtree_update_time
	}
	
	// Execute decision tree state
	if (!conflict) { // explore state
		if (astpath == undefined && irandom(100) == 0) {
			if (instance_number(obj_ai_path_point) > 0) {
				var path_point_marker = instance_find(obj_ai_path_point, irandom(instance_number(obj_ai_path_point)-1));
				astpath_targ_x = path_point_marker.x
				astpath_targ_y = path_point_marker.y
				compute_astpath()
			} else {
				astpath_targ_x = random(room_width)
				astpath_targ_y = random(room_height)
				compute_astpath()
			}
		}
	} else if (conflict && instance_exists(target)) { // conflict state
		var target_x = target.get_x()
		var target_y = target.get_y()
		var target_distance = point_distance(body.get_x(), body.get_y(), target_x, target_y)
		var line_of_fire = line_shootable(target_x, target_y)
		var shoot = false
		
		if (fight_or_flight == "fight") {
			if (line_of_fire) {
				shoot = true
				reset_path()
				
				// Get closer
				if (target_distance > 100) {
					move_input = 1
				}
			} else {
				path_recompute_timer --
				if (path_recompute_timer <= 0) {
					shoot_path(target_x, target_y)
					path_recompute_timer = path_recompute_time
				}
			}
		} else if (fight_or_flight == "flight") {
			
		} else if (fight_or_flight == "await") {
			reset_path()
			if (line_of_fire) {
				shoot = true
			}
		}
		
		if (shoot) {
			var barrel_x = weapon.get_weapon_barrel_x(body)
			var barrel_y = weapon.get_weapon_barrel_y(body)
			var desired_weapon_dir = point_direction(barrel_x, barrel_y, target_x, target_y)
	
			// Align weapon rotation
			var dead_angle = 4
			var angle_diff = angle_difference(weapon.get_weapon_rotation(body), desired_weapon_dir)
			turn_input = (angle_diff < -dead_angle) - (angle_diff > dead_angle)
			
			if (abs(angle_diff) <= 10) {
				trigger_timer --
				if (trigger_timer <= 0) {
					input_attack = true
					trigger_timer = target_distance * 0.3
				}
			}
			
		}
	}
	
	//Exploration state
	//if (state == "explore") {
	//	if (path == undefined && irandom(100) == 0) {
	//		if (instance_number(obj_ai_path_point) > 0) {
	//			var path_point_marker = instance_find(obj_ai_path_point, irandom(instance_number(obj_ai_path_point)-1));
	//			path = path_add()
	//			path_point = 0
	//			if (!mp_grid_path(grid, path, body.get_x(), body.get_y(), path_point_marker.x, path_point_marker.y, false)) {
	//				path_delete(path)
	//				path = undefined
	//			}
	//		} else {
	//			path = path_add()
	//			path_point = 0
	//			if (!mp_grid_path(grid, path, body.get_x(), body.get_y(), random(room_width), random(room_height), false)) {
	//				path_delete(path)
	//				path = undefined
	//			}
	//		}
	//		path_point = 0
	//	}
	//} else if (state == "attack") {
	//	last_seen_target_x = target.get_x()
	//	last_seen_target_y = target.get_y()
	//	var line_free = line_movable(target.get_x(), target.get_y())
	//	if (!line_free) {
	//		if (path == undefined) {
	//			path = path_add()
	//			path_point = 0
	//			if (!mp_grid_path(grid, path, body.get_x(), body.get_y(), target.get_x(), target.get_y(), false)) {
	//				path_delete(path)
	//				path = undefined
	//			}
	//		}
	//	} else {
	//		if (path != undefined && path_exists(path)) path_delete(path)
	//		path = undefined
	//		var distance = point_distance(body.get_x(), body.get_y(), target.get_x(), target.get_y());
	//		if (distance > 80) move_input = 1
	//		turn_input = aim_weapon(target.get_x(), target.get_y());
	//		if (abs(angle_difference(point_direction(body.get_x(), body.get_y(), target.get_x(), target.get_y()), body.get_rotation())) < 20) {
	//			input_attack = irandom(40) == 0
	//		}
	//	}
	//}
	
	if (astpath != undefined && path_exists(astpath)) {
		
		// Update current path point to nearest point to player in path
		var _next_pt = astpath_point + 1
		var _prev_pt = astpath_point - 1
		var _cur_pt_dist = point_distance(_body_x, _body_y, path_get_point_x(astpath, astpath_point), path_get_point_y(astpath, astpath_point))
		
		var _next_pt_dist = infinity
		if (astpath_point < path_get_number(astpath)) // if next point exists
			_next_pt_dist = point_distance(_body_x, _body_y, path_get_point_x(astpath, _next_pt), path_get_point_y(astpath, _next_pt)) // distance from next pt to player
			
		var _prev_pt_dist = infinity
		if (astpath_point > 0) // if previous point exists
			_prev_pt_dist = point_distance(_body_x, _body_y, path_get_point_x(astpath, _prev_pt), path_get_point_y(astpath, _prev_pt)) // distance from previous pt to player
			
		if (_next_pt_dist == min(_cur_pt_dist, _next_pt_dist, _prev_pt_dist)) // if next point has minimal distance
			astpath_point ++ // move to next pt
		else if (_prev_pt_dist < _cur_pt_dist) // else if prev point has minimal distance
			astpath_point -- // move to prev pt
		
		// Check if A* path is completed
		var _path_end_x = path_get_point_x(astpath, path_get_number(astpath)-1)
		var _path_end_y = path_get_point_y(astpath, path_get_number(astpath)-1)
		var _dist = point_distance(body.get_x(), body.get_y(), _path_end_x, _path_end_y)
		var _astpath_completion_tolerance = 30
		if (_dist <= _astpath_completion_tolerance) {
			
			reset_path()
			
		} else if (!line_movable(path_get_point_x(astpath, astpath_point), path_get_point_y(astpath, astpath_point))) { // if no free line to path point
			
			compute_astpath() // recompute A* path
			
		// Build RRT* tree
		} else if (rrt_branch = undefined) { // if there is no current node
			
			rrt_branch = new rrt_turn_element(undefined, _body_x, _body_y, _body_rot, _body_rot) // node that tree starts from
			rrt_branch.g_cost = 0 // initialize G cost
			rrt_branch.h_cost = compute_h_cost(_body_x, _body_y, _body_rot) // H cost for init node
			ds_list_add(rrt_branches, rrt_branch)
			ds_list_add(rrt_open_branches, rrt_branch)
			
		} else { // if there is a current node, start adding nodes to it, each step
			// try finding random test point nearby
			//var _found_cell = false
			//var _pt_test_x, _pt_test_y, _pt_test_th
			//var _cell_test_x, _cell_test_y
			//var _r = astriver_radius * astpath_cell_size // around what radius to look
			//repeat (5) { // try 5 times
			//	_pt_test_x = _body_x + random_range(-_r, _r) // random point around player
			//	_pt_test_y = _body_y + random_range(-_r, _r)
			//	_cell_test_x = floor(_pt_test_x / astpath_cell_size)
			//	_cell_test_y = floor(_pt_test_y / astpath_cell_size)
			//	if (ds_map_exists(astriver, _cell_test_y) && ds_map_exists(astriver[?_cell_test_y], _cell_test_x)) {
			//		_pt_test_th = astriver[?_cell_test_y][?_cell_test_x] // get orientation of test point
			//		_found_cell = true
			//		break // stop trying
			//	}
			//}
			
			repeat(1) {
			
			//// pick test point at A* path between player and certain lookahead
			//var _front_lookahead = 10 // how many path pts to lookahead
			//var _back_lookahead = 0 // how many path pts to look back
			//var _test_path_point = clamp(astpath_point + irandom_range(-_back_lookahead, _front_lookahead), 0, path_get_number(astpath)-1) // choose random point ahead, without exceeding total nr of path points
			
			//var _random_dir = irandom(359)
			//var _random_dist = random(astpath_cell_size * 5) // radius of random displacement around test point
			//var _pt_test_x = path_get_point_x(astpath, _test_path_point) + lengthdir_x(_random_dist, _random_dir) // pick test point from and with random displacement
			//var _pt_test_y = path_get_point_y(astpath, _test_path_point) + lengthdir_y(_random_dist, _random_dir)
			//rrt_test_pt = [_pt_test_x, _pt_test_y] // save in instance var for drawing in draw event
				
			//// find nearest RTT branch
			//var _nearest = undefined
			//var _cost = infinity
			//var _dir, _dist
			//for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
			//	var _branch = rrt_branches[|i]
			//	_dist = point_distance(_branch.x_end, _branch.y_end, _pt_test_x, _pt_test_y)
			//	_dir = point_direction(_branch.x_end, _branch.y_end, _pt_test_x, _pt_test_y)
			//	var _branch_cost = _dist + abs(angle_difference(_branch.th_end, _dir)) // combined distance & angle difference cost from branch end point to test point
			//	//var _branch_cost = _branch.h_cost + _branch.g_cost
			//	if (_branch_cost < _cost) {
			//		_nearest = _branch
			//		_cost = _branch_cost
			//	}
			//}
			
			//// find maximum and minimum h cost between open branches
			//var _hcost_min = infinity
			//var _hcost_max = -infinity
			//for (var i = 0; i < _nr_open; i ++) {
			//	var _hcost = rrt_open_branches[|i].h_cost
			//	if (_hcost < _hcost_min) 
			//		_hcost_min = _hcost
			//	if (_hcost > _hcost_max)
			//		_hcost_max = _hcost
			//}
			
			// choose an open branch based on probability weighted with h cost
			var _chosen = undefined // the chosen branch
			var _nr_open = ds_list_size(rrt_open_branches)
			if (_nr_open == 1) // if there is only 1 branch
				_chosen = rrt_open_branches[|0]
			else {
				// do power-law weighting
				var _e = 0.00001 // small constant to avoid div by zero
				var _p = 3 // power coefficient, p = 0 means uniform dist., p = 1 means mild preference for lower H cost, p = 2 means strong preference
				var _ws = array_create(_nr_open)
				var _w_sum = 0
				for (var i = 0; i < _nr_open; i ++) {
					var _branch = rrt_open_branches[|i]
					var _hcost = _branch.h_cost
					
					var _w = 1 / power(_hcost + _e, _p) // compute weight
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
				var _bundle = ds_list_create() // bundle of three elements: left arc, straight segment and right arc
				var _straight = new rrt_straight_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, 25, RS_FORWARD) // make straight element
				if (_straight.collision_free(colslider, obstr_objects)) { // check if has no collisions
					ds_list_add(_bundle, _straight) // add to list
				} else {
					_straight.destroy() // else destroy
				}
				
				var _arc_left = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, 22.5, RS_LEFT, RS_FORWARD, rrt_arc_r) // make left arc
				if (_arc_left.collision_free(colslider, obstr_objects)) {
					ds_list_add(_bundle, _arc_left) // add to list
				} else {
					_arc_left.destroy() // else destroy
				}
				
				var _arc_right = new rrt_arc_element(_chosen, _chosen.x_end, _chosen.y_end, _chosen.th_end, 22.5, RS_RIGHT, RS_FORWARD, rrt_arc_r) // make right arc
				if (_arc_right.collision_free(colslider, obstr_objects)) {
					ds_list_add(_bundle, _arc_right) // add to list
				} else {
					_arc_right.destroy() // else destroy
				}
				
				// for new branches in bundle, compute costs and add to relevant lists
				var _nr_added = ds_list_size(_bundle) // number of branches added at end of chosen branch
				for (var i = 0; i < _nr_added; i ++) {
					var _new_branch = _bundle[|i]
					_new_branch.compute_g_cost(_chosen.g_cost) // compute cost variables for RRT*
					_new_branch.h_cost = compute_h_cost(_new_branch.x_end, _new_branch.y_end, _new_branch.th_end)
					ds_list_add(_chosen.links, _new_branch) // add new branch to chosen branch links
					ds_list_add(rrt_branches, _new_branch) // add to total list of branches
					ds_list_add(rrt_open_branches, _new_branch) // add new branch to open branches list
					_chosen.grow() // backpropagate branch thickness growth
				}
				
				// if elements were added, remove chosen branch from open branch list (it's no longer open)
				if (_nr_added > 0) {
					var i = ds_list_find_index(rrt_open_branches, _chosen)
					ds_list_delete(rrt_open_branches, i)
				}
				ds_list_destroy(_bundle)
				
				// If arc or line is not collision free, try shortening
				//var _success = 1 // assume successful shorten attempt
				//if (!_new_branch.collision_free(colslider, obstr_objects))
				//	_success = _new_branch.shorten(colslider, obstr_objects)
				
				//// If still not collsion free, turn into turn element
				//if (_success == 0) { // if shortening unsuccessful
				//	_new_branch.destroy() // destroy old branch
				//	_new_branch = new rs_turn_element(_nearest.x_end, _nearest.y_end, _nearest.th, _dir) // make turn element
				//}
				
				//_new_branch.compute_g_cost(rrt_branch.g_cost) // compute cost variables for RRT*
				//_new_branch.h_cost = compute_h_cost(_new_branch.x_end, _new_branch.y_end, _new_branch.th_end)
				//ds_list_add(_nearest.links, _new_branch) // add new branch to branch links
				//ds_list_add(rrt_branches, _new_branch) // add to total list of branches
						
				//// compute cost and delete if falls outside A* river
				//var _success = _new_branch.compute_cost(astriver, astpath_cell_size)
				//if (_success == -1) { // if falls outside A* river, replace with turn element
				//	delete _new_branch // delete old
				//	_new_branch = new rs_turn_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, _dir)
				//	_new_branch.compute_cost()
				//}
						
				// check collision and try shortening if not collision free
				//if (_new_branch != undefined) {
				//	_success = _new_branch.shorten(colslider, obstr_objects)
				//	if (_success != 0) {
				//		_new_branch.compute_g_cost(rrt_branch.g_cost)
				//		_new_branch.h_cost = compute_h_cost(_new_branch.x_end, _new_branch.y_end)
						
				//		// add new branch to nearest branch end point
				//		ds_list_add(_nearest.links, _new_branch) // add new branch to branch links
				//		ds_list_add(rrt_branches, _new_branch) // add to total list of branches
								
				//		// for shortened arc, add in-place turn element to comlete desired rotation
				//		if (_success == 2 && _new_branch.type == RRT_ARC) { // if element was shortened and of arc element type
				//			var _turn_element = new rs_turn_element(_new_branch.x_end, _new_branch.y_end, _new_branch.th, _dir)
				//			_turn_element.compute_g_cost(rrt_branch.g_cost)
				//			_turn_element.h_cost = compute_h_cost(_turn_element.x_end, _turn_element.y_end)
				//			ds_list_add(_new_branch.links, _turn_element) // attach turn element to end point of arc
				//			ds_list_add(rrt_branches, _turn_element)
				//		}
				//	}
				//}
			}
			
			}
				
			// Walk RRT* branch element
			var _abort = false // abort flag
			if (!rrt_completed) {
				if (rrt_branch.type == RRT_TURN) { // execute turn
					//rrt_branch.x = _body_x
					//rrt_branch.y = _body_y
					
					move_input = 0
					turn_input = input_dir(rrt_branch.th_end)
					
					// RRT path abortion
					var _abortion_tolerance = 10 // distance from which to abort path
					if (point_distance(_body_x, _body_y, rrt_branch.x, rrt_branch.y) > _abortion_tolerance)
						_abort = true // raise flag
					
					// check completion
					var _completion_tolerance = 5 // completion tolerance (in degrees) on when turn is considered to be completed
					if (abs(angle_difference(rrt_branch.th_end, _body_rot)) < _completion_tolerance) {
						rrt_completed = true
					}
				} else if (rrt_branch.type == RRT_STRAIGHT) {
					move_input = rrt_branch.gear // move according to gear
					turn_input = 0
				
					var _to_player_dir = point_direction(rrt_branch.x, rrt_branch.y, _body_x, _body_y) // direction and distance from line base to player
					var _to_player_dist = point_distance(rrt_branch.x, rrt_branch.y, _body_x, _body_y)
					var _center_offset = lengthdir_y(_to_player_dist, angle_difference(_to_player_dir, rrt_branch.th)) // offset of player from line (treat this lengthdir_y as a sin())
					var _progression = rrt_branch.gear * lengthdir_x(_to_player_dist,  angle_difference(_to_player_dir, rrt_branch.th)) // progression on line (treat this lengthdir_x as cosine)
					
					// steering correction
					var _correction_tolerance = 3 // tolerance outside which to start correcting
					if (_center_offset > _correction_tolerance) { // deviated too much on left side
						turn_input = rrt_branch.gear // steer to right (or left if in reverse gear)
					} else if (_center_offset < -_correction_tolerance) { // deviated too much on right side
						turn_input = -rrt_branch.gear // steer to left (or right if in reverse gear)
					} else {
						turn_input = input_dir(rrt_branch.th)
					}
					
					// RRT path abortion
					var _abortion_tolerance = 8 // distance from which to abort path
					if (_center_offset > _abortion_tolerance)
						_abort = true // raise flag
					if (_progression < -_abortion_tolerance || _progression > rrt_branch.l + _abortion_tolerance)
						_abort = true
				
					// check completion
					var _completion_tolerance = 5 // tolerance (in pixels) on when line is considered to be completed
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
					var _offset_tolerance = 5
					if (_to_player_dist < rrt_branch.r - _offset_tolerance) { // deviated too on inside of arc
						turn_input = 0 // stop steering, simply move straight until in center again
					} else if (_to_player_dist > rrt_branch.r + _offset_tolerance) { // deviated too on outside of arc
						if (abs(angle_difference(_arc_angle, _body_rot)) > 20) 
							move_input = 0 // stop movement, wait until angle is within acceptable limits
						turn_input = input_dir(_arc_angle + 10 * rrt_branch.steering * rrt_branch.gear)
					} else {
						turn_input = input_dir(_arc_angle)
					}
					
					// RRT path abortion
					var _abortion_tolerance = 8 // distance from which to abort path
					var _abrt_angle_tolerance = radtodeg(_abortion_tolerance / rrt_branch.r) // tolerance in degrees for arc angle progression
					if (_to_player_dist > rrt_branch.r + _abortion_tolerance || _to_player_dist < rrt_branch.r - _abortion_tolerance)
						_abort = true // raise flag
					if (_progression < -_abrt_angle_tolerance || _progression > rrt_branch.l + _abrt_angle_tolerance)
						_abort = true
				
					// check completion
					var _completion_tolerance = 5 // tolerance on when path element is considered to be completed
					if (_progression >= max(0, rrt_branch.l - _completion_tolerance)) {
						rrt_completed = true
					}
				}
			}
			
			// Check if abort flag was raised
			if (_abort) {
				rrt_branch.destroy()
				rrt_branch = undefined
				
			// Choose next branch (wait if necessary), and delete the current branch (and children that are not chosen)
			} else if (rrt_completed) {
				var _cost = infinity
				var _next_branch = undefined
				var _next_branch_i = 0
				for (var i = 0; i < ds_list_size(rrt_branch.links); i ++) { // loop through linked branches of current branch
					var _link = rrt_branch.links[|i]
					var _link_cost = _link.g_cost + _link.h_cost - _link.thickness//_link.g_cost + _link.h_cost
					if (_link_cost < _cost) {
						_cost = _link_cost
						_next_branch = _link
						_next_branch_i = i // remember index in list
					}
				}
					
				if (_next_branch != undefined) { // if found the next branch to walk
					ds_list_delete(rrt_branch.links, _next_branch_i) // decouple chosen branch from old branch, to avoid deleting the chosen branch along with deleting old branch
					rrt_branch.destroy() // delete old branch
					rrt_branch = _next_branch
					rrt_completed = false
				} else { // otherwise, wait
					move_input = 0
					turn_input = 0
				}
			}
		}
	}
}
