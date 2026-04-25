event_inherited()

turn_input = 0
move_input = 0
input_attack = false

// Delete RTT branches that are marked for deletion
for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
	var _branch = rrt_branches[|i]
	if (_branch.del) {
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
		if (holpath == undefined && irandom(100) == 0) {
			if (instance_number(obj_ai_path_point) > 0) {
				var path_point_marker = instance_find(obj_ai_path_point, irandom(instance_number(obj_ai_path_point)-1));
				create_holonomic_path(path_point_marker.x, path_point_marker.y)
			} else {
				create_holonomic_path(random(room_width), random(room_width))
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
	
	// Walk holonomic path by lower level RS path segments
	if (holpath != undefined && path_exists(holpath)) {
		// Make RS path to reachable path point in holonomic path
		//if (rs_path == undefined) {
		//	var _holpath_total = path_get_number(holpath)
		//	var _lookahead = min(10, _holpath_total) // how many path points to initially look ahead
		//	var _pt_lookahead = holpath_point + _lookahead
		//	while (true) {
		//		var _pt_x = path_get_point_x(holpath, _pt_lookahead)
		//		var _pt_y = path_get_point_y(holpath, _pt_lookahead)
		//		var _pt_th = 0 // angle of path point (angle to next pt or from pt)
		//		if (_pt_lookahead + 1 < _holpath_total) { // if next pt exists
		//			var _next_pt_x = path_get_point_x(holpath, _pt_lookahead + 1)
		//			var _next_pt_y = path_get_point_y(holpath, _pt_lookahead + 1)
		//			_pt_th = point_direction(_pt_x, _pt_y, _next_pt_x, _next_pt_y) // compute angle to next pt
		//		} else if (_pt_lookahead - 1 >= 0) { // else if previous pt exists
		//			var _prev_pt_x = path_get_point_x(holpath, _pt_lookahead - 1)
		//			var _prev_pt_y = path_get_point_y(holpath, _pt_lookahead - 1)
		//			_pt_th = point_direction(_prev_pt_x, _prev_pt_y, _pt_x, _pt_y) // comput angle from previous pt
		//		}
				
		//		rs_start = [body.get_x(), body.get_y(), body.get_rotation()]
		//		rs_target = [_pt_x, _pt_y, _pt_th]
		//		rs_path = rs_optimal_path(rs_start, rs_target, rs_min_r)
		//		rs_path_elem_i = 0
		//		if (!rs_path_free(rs_path)) {
		//			if (_lookahead == 1) { // if lookahead is already one give up on path
		//				rs_path = undefined
		//				reset_path()
		//				break
		//			}
		//			_lookahead = ceil(_lookahead / 2) // look at new point halfway
		//			_pt_lookahead = holpath_point + _lookahead
		//		} else { // free path found
		//			holpath_point = _pt_lookahead
		//			break // break while loop
		//		}				
				
		//	}
		//}
		
		//if (astriver != undefined) {
		//	// Build A* river
		//	if (astriver_build_i < path_get_number(holpath)) {
		//		var _src_pt_x = path_get_point_x(holpath, astriver_build_i) // get location of current source cell
		//		var _src_pt_y = path_get_point_y(holpath, astriver_build_i)
		//		var _src_cell_x = floor(_src_pt_x / holpath_cell_size) // the source cell x,y indices
		//		var _src_cell_y = floor(_src_pt_y / holpath_cell_size)
		//		var _src_flowdir = astriver[?_src_cell_y][?_src_cell_x] // direction of flow at source cell
				
		//		var _kernel_radius = astriver_radius * holpath_cell_size // radius (in pixels) of the kernel with which we're building river
		//		for (var _cell_x = _src_cell_x - astriver_radius; _cell_x <= _src_cell_x + astriver_radius; _cell_x ++) { // loop through kernel around source point
		//			for (var _cell_y = _src_cell_y - astriver_radius; _cell_y <= _src_cell_y + astriver_radius; _cell_y ++) {
		//				if !(_cell_x == _src_cell_x && _cell_y == _src_cell_y) { // skip source cell itself
		//					var _pt_x = _cell_x * holpath_cell_size // location of cell in kernel
		//					var _pt_y = _cell_y * holpath_cell_size
		//					var _dist_to_src = point_distance(_pt_x, _pt_y, _src_pt_x, _src_pt_y) // distance from this cell to source cell
		//					var _dir_to_src = point_direction(_pt_x, _pt_y, _src_pt_x, _src_pt_y) // distance from this cell to source cell
							
		//					if (_dist_to_src <= _kernel_radius) {
		//						var _norm_dist = _dist_to_src / _kernel_radius // normalized distance to center (0 is in center, 1 is at edge of river)
		//						var _flow_x = lengthdir_x(1 - _norm_dist, _src_flowdir) + lengthdir_x(_norm_dist, _dir_to_src) // flow at this cell
		//						var _flow_y = lengthdir_y(1 - _norm_dist, _src_flowdir) + lengthdir_y(_norm_dist, _dir_to_src)
							
		//						var _flow_dir = point_direction(0, 0, _flow_x, _flow_y)
							
		//						if (!ds_map_exists(astriver, _cell_y)) { // check if row exists in 2D A* river map
		//							astriver[?_cell_y] = ds_map_create() // if not, create map
		//							ds_list_add(astriver_rows, _cell_y) // keep track that this row is being used
		//						}
							
		//						astriver[?_cell_y][?_cell_x] = _flow_dir // store flow direction in this cell
		//						ds_list_add(astriver_cells, [_cell_x, _cell_y]) // keep track that this column is being used
		//					}
		//				}
		//			}
		//		}
				
		//		astriver_build_i ++ // move to next point for next step
		//	}
		//}
			
		// Build RRT* tree
		if (rrt_branch = undefined) {
			rrt_branch = new rs_turn_element(_body_x, _body_y, _body_rot, _body_rot) // node that tree starts from
			rrt_branch.g_cost = 0
			rrt_branch.h_cost = compute_h_cost(_body_x, _body_y, _body_rot)
			ds_list_add(rrt_branches, rrt_branch)
		} else {
			// try finding random test point nearby
			//var _found_cell = false
			//var _pt_test_x, _pt_test_y, _pt_test_th
			//var _cell_test_x, _cell_test_y
			//var _r = astriver_radius * holpath_cell_size // around what radius to look
			//repeat (5) { // try 5 times
			//	_pt_test_x = _body_x + random_range(-_r, _r) // random point around player
			//	_pt_test_y = _body_y + random_range(-_r, _r)
			//	_cell_test_x = floor(_pt_test_x / holpath_cell_size)
			//	_cell_test_y = floor(_pt_test_y / holpath_cell_size)
			//	if (ds_map_exists(astriver, _cell_test_y) && ds_map_exists(astriver[?_cell_test_y], _cell_test_x)) {
			//		_pt_test_th = astriver[?_cell_test_y][?_cell_test_x] // get orientation of test point
			//		_found_cell = true
			//		break // stop trying
			//	}
			//}
			
			// update nearest point to player in path
			var _next_pt = holpath_point + 1
			var _prev_pt = holpath_point - 1
			var _cur_pt_dist = point_distance(_body_x, _body_y, path_get_point_x(holpath, holpath_point), path_get_point_y(holpath, holpath_point))
			var _next_pt_dist = infinity
			if (holpath_point < path_get_number(holpath)) // if next point exists
				_next_pt_dist = point_distance(_body_x, _body_y, path_get_point_x(holpath, _next_pt), path_get_point_y(holpath, _next_pt)) // distance from next pt to player
			var _prev_pt_dist = infinity
			if (holpath_point > 0) // if previous point exists
				_prev_pt_dist = point_distance(_body_x, _body_y, path_get_point_x(holpath, _prev_pt), path_get_point_y(holpath, _prev_pt)) // distance from previous pt to player
			if (_next_pt_dist == min(_cur_pt_dist, _next_pt_dist, _prev_pt_dist)) // if next point has minimal distance
				holpath_point ++ // move to next pt
			else if (_prev_pt_dist < _cur_pt_dist) // else if prev point has minimal distance
				holpath_point -- // move to prev pt
			
			// pick test point at A* path between player and certain lookahead
			var _lookahead = 10 // how many path pts to lookahead
			var _test_path_point = min(path_get_number(holpath)-1, holpath_point + irandom(_lookahead)) // choose random point ahead, without exceeding total nr of path points
			var _pt_test_x = path_get_point_x(holpath, _test_path_point)
			var _pt_test_y = path_get_point_y(holpath, _test_path_point)
			rrt_test_pt = [_pt_test_x, _pt_test_y]
				
			// find nearest RTT branch
			var _nearest = undefined
			var _cost = infinity
			for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
				var _branch = rrt_branches[|i]
				var _branch_cost = point_distance(_branch.x_end, _branch.y_end, _pt_test_x, _pt_test_y)// + abs(angle_difference(_branch.th_end, _pt_test_th)) // combined distance & angle difference cost from branch end point to test point
				if (_branch_cost < _cost) {
					_nearest = _branch
					_cost = _branch_cost
				}
			}
				
			// create new branch
			if (_nearest != undefined) {
				var _new_branch = undefined
				var _dist = point_distance(_nearest.x_end, _nearest.y_end, _pt_test_x, _pt_test_y) // distance branch end point to test point
				var _dir = point_direction(_nearest.x_end, _nearest.y_end, _pt_test_x, _pt_test_y)
				var _angdiff = angle_difference(_dir, _nearest.th_end) // angle diff from node orientation to test point orientation
				//if (abs(_angdiff) <= 22.5) {
				//	_new_branch = new rs_straight_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 25, RS_FORWARD)
				//} else if (abs(_angdiff) <= 45) {
				//	_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 45, sign(_angdiff), RS_FORWARD, rs_min_r)
				//} else if (abs(_angdiff) <= 67.5) {
				//	_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 67.5, sign(_angdiff), RS_FORWARD, rs_min_r)
				//} else if (abs(_angdiff) <= 90) {
				//	_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 90, sign(_angdiff), RS_FORWARD, rs_min_r)
				//} else if (abs(_angdiff) <= 112.5) {
				//	_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 112.5, sign(_angdiff), RS_FORWARD, rs_min_r)
				//} else if (abs(_angdiff) <= 135) {
				//	_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 135, sign(_angdiff), RS_FORWARD, rs_min_r)
				//} else if (abs(_angdiff) <= 157.5) {
				//	_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 157.5, sign(_angdiff), RS_FORWARD, rs_min_r)
				//} else if (abs(_angdiff) <= 180) {
				//	_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 180, sign(_angdiff), RS_FORWARD, rs_min_r)
				//}
				
				var _angdiff_discr = floor(abs(_angdiff) / 22.5) // divide up into discrete angle difference
				if (_angdiff_discr == 0) { // if is approximately in same direction
					_new_branch = new rs_straight_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 25, RS_FORWARD) // try straight element
				} else {
					_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 22.5, sign(_angdiff), RS_FORWARD, rs_min_r) // try arc element
				}
				
				// If arc or line is not collision free, try shortening
				var _success = 1 // assume successful shorten attempt
				if (!_new_branch.collision_free(colslider, obstr_objects))
					_success = _new_branch.shorten(colslider, obstr_objects)
				
				// If still not collsion free, turn into turn element
				if (_success == 0) { // if shortening unsuccessful
					_new_branch.destroy() // destroy old branch
					_new_branch = new rs_turn_element(_nearest.x_end, _nearest.y_end, _nearest.th, _dir) // make turn element
				}
				
				_new_branch.compute_g_cost(rrt_branch.g_cost) // compute cost variables for RRT*
				_new_branch.h_cost = compute_h_cost(_new_branch.x_end, _new_branch.y_end, _new_branch.th_end)
				ds_list_add(_nearest.links, _new_branch) // add new branch to branch links
				ds_list_add(rrt_branches, _new_branch) // add to total list of branches
						
				//// compute cost and delete if falls outside A* river
				//var _success = _new_branch.compute_cost(astriver, holpath_cell_size)
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
				} else if (rrt_branch.type == RRT_LINE) {
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
					var _link_cost = _link.g_cost + _link.h_cost
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
		
		// Check if holonomic path is completed
		var _path_end_x = path_get_point_x(holpath, path_get_number(holpath)-1)
		var _path_end_y = path_get_point_y(holpath, path_get_number(holpath)-1)
		var _dist = point_distance(body.get_x(), body.get_y(), _path_end_x, _path_end_y)
		var _holpath_completion_tolerance = 30
		if (_dist <= _holpath_completion_tolerance) {
			reset_path()
		}
	}
	
	// Walk RS path
	//if (rs_path != undefined) {
	//	var _p_elem = rs_path[|rs_path_elem_i] // get current path element
	//	if (_p_elem.steering == RS_STRAIGHT || _p_elem.l < 10) { // walk line segment
				
	//		move_input = _p_elem.gear // move according to gear
	//		turn_input = 0
				
	//		// Steering correction
	//		var _to_player_dir = point_direction(_p_elem.x, _p_elem.y, body.get_x(), body.get_y()) // direction and distance from line base to player
	//		var _to_player_dist = point_distance(_p_elem.x, _p_elem.y, body.get_x(), body.get_y())
	//		var _center_offset = lengthdir_y(_to_player_dist, angle_difference(_to_player_dir, _p_elem.th)) // offset of player from line (treat this lengthdir_y as a sin())
	//		var _correction_tolerance = 5 // tolerance outside which to start correcting
	//		if (_center_offset > _correction_tolerance) { // deviated too much on left side
	//			turn_input = _p_elem.gear // steer to right (or left if in reverse gear)
	//		} else if (_center_offset < -_correction_tolerance) { // deviated too much on right side
	//			turn_input = -_p_elem.gear // steer to left (or right if in reverse gear)
	//		} else {
	//			turn_input = input_dir(_p_elem.th)
	//		}
				
	//		// Abort path
	//		var _commitance_tolerance = 30 // tolerance outisde which to give up path
	//		if (abs(_center_offset) > _commitance_tolerance) {
	//			reset_path() // give up path
	//		}
				
	//		// Track progression
	//		var _completion_tolerance = 5 // tolerance on when path element is considered to be completed
	//		var _l = _p_elem.l ? _p_elem.steering == RS_STRAIGHT : (_p_elem.l * _p_elem.r)
	//		var _progression = _p_elem.gear * lengthdir_x(_to_player_dist,  angle_difference(_to_player_dir, _p_elem.th)) // progression on line (treat this lengthdir_x as cosine)
	//		if (_progression >=  max(0, _p_elem.l - _completion_tolerance)) { // if progression exceeds is on line segment length
	//			rs_path_elem_i ++ // move to next path element
	//		}
				
	//	} else { // walk arc segment
				
	//		move_input = _p_elem.gear // move according to gear and steering
	//		//turn_input = _p_elem.gear * _p_elem.steering
				
	//		// Steering correction
	//		var _to_player_dist = point_distance(_p_elem.center_x, _p_elem.center_y, body.get_x(), body.get_y()) // distance and direction from arc center to player
	//		var _to_player_dir = point_direction(_p_elem.center_x, _p_elem.center_y, body.get_x(), body.get_y())
	//		var _arc_angle = _to_player_dir + 90 * _p_elem.steering // what the angle of the arc is from player progression
	//		turn_input = input_dir(_arc_angle)
				
	//		//var _offset_tolerance = 5
	//		//if (_p_elem.r - _to_player_dist > _offset_tolerance) { // deviated too on inside of arc
	//		//	turn_input = 0 // stop steering, simply move straight until in center again
	//		//} else if (_p_elem.r - _to_player_dist < -_offset_tolerance) // deviated too on outside of arc
	//		//  and (abs(angle_difference(_to_player_dir + 90 * _p_elem.steering, body.get_rotation())) > 5) { 
	//		//	move_input = 0 // stop movement, wait until angle is within acceptable limits
				
	//		//}
				
	//		// Abort path
	//		var _commitance_tolerance = 30 // tolerance outisde which to give up path
	//		if (abs(_p_elem.r - _to_player_dist) > _commitance_tolerance) {
	//			reset_path() // give up path
	//		}
				
	//		// Track progression
	//		var _completion_tolerance = 5 // tolerance on when path element is considered to be completed
	//		var _progression = _p_elem.steering * _p_elem.gear * angle_difference(_to_player_dir + 90 * _p_elem.steering, _p_elem.th) // difference from arc starting angle to where player is on arc
	//		if (_progression >= max(0, _p_elem.l - _completion_tolerance)) {
	//			rs_path_elem_i ++ // move to next path element
	//		}
	//	}
			
	//	// Check if completed RS path
	//	if (rs_path != undefined && rs_path_elem_i >= ds_list_size(rs_path)) {
	//		rs_path = undefined // reset
	//	}
	//}
	
	// Walk along path
	//if (path != undefined) {
	//	var path_point_distance = point_distance(body.get_x(), body.get_y(), path_get_point_x(path, path_point), path_get_point_y(path, path_point));
	//	var path_point_direction = point_direction(body.get_x(), body.get_y(), path_get_point_x(path, path_point), path_get_point_y(path, path_point));
		
	//	// Give input to move to path point
	//	turn_input = input_dir(path_point_direction);
	//	if (abs(angle_difference(path_point_direction, body.get_rotation())) > 55) {
	//		move_input = -1
	//	} else move_input = 1
		
	//	// Move path point counter, for smooth and robust traversal of path
	//	var path_point_line_free = line_movable(path_get_point_x(path, path_point), path_get_point_y(path, path_point))
	//	if (path_point_line_free && path_point_distance < 75) { // check next point
	//		var next_point_line_free = line_movable(path_get_point_x(path, path_point+1), path_get_point_y(path, path_point+1))
	//		if (next_point_line_free) {	
	//			path_point ++
	//		}
	//	} else { // unreachable point, move back counter
	//		path_point --
	//	}
	//	path_point = min(path_point, path_get_number(path) - 1)
		
	//	if (path_point < 0 || // if initial point unreachable, destroy path
	//		(path_point_distance < 30 && path_point >= path_get_number(path)-1)) { // end of path reached
	//		path_delete(path)
	//		path = undefined
	//	}		
	//}
}
