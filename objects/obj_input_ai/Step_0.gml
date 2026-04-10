event_inherited()

turn_input = 0
move_input = 0
input_attack = false

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
		
		if (astriver != undefined) {
			// Build A* river
			if (astriver_build_i < path_get_number(holpath)) {
				var _src_pt_x = path_get_point_x(holpath, astriver_build_i) // get location of current source cell
				var _src_pt_y = path_get_point_y(holpath, astriver_build_i)
				var _src_cell_x = floor(_src_pt_x / holpath_cell_size) // the source cell x,y indices
				var _src_cell_y = floor(_src_pt_y / holpath_cell_size)
				var _src_flowdir = astriver[?_src_cell_y][?_src_cell_x] // direction of flow at source cell
				
				var _kernel_radius = astriver_radius * holpath_cell_size // radius (in pixels) of the kernel with which we're building river
				for (var _cell_x = _src_cell_x - astriver_radius; _cell_x <= _src_cell_x + astriver_radius; _cell_x ++) { // loop through kernel around source point
					for (var _cell_y = _src_cell_y - astriver_radius; _cell_y <= _src_cell_y + astriver_radius; _cell_y ++) {
						if !(_cell_x == _src_cell_x && _cell_y == _src_cell_y) { // skip source cell itself
							var _pt_x = _cell_x * holpath_cell_size // location of cell in kernel
							var _pt_y = _cell_y * holpath_cell_size
							var _dist_to_src = point_distance(_pt_x, _pt_y, _src_pt_x, _src_pt_y) // distance from this cell to source cell
							var _dir_to_src = point_direction(_pt_x, _pt_y, _src_pt_x, _src_pt_y) // distance from this cell to source cell
							
							if (_dist_to_src <= _kernel_radius) {
								var _norm_dist = _dist_to_src / _kernel_radius // normalized distance to center (0 is in center, 1 is at edge of river)
								var _flow_x = lengthdir_x(1 - _norm_dist, _src_flowdir) + lengthdir_x(_norm_dist, _dir_to_src) // flow at this cell
								var _flow_y = lengthdir_y(1 - _norm_dist, _src_flowdir) + lengthdir_y(_norm_dist, _dir_to_src)
							
								var _flow_dir = point_direction(0, 0, _flow_x, _flow_y)
							
								if (!ds_map_exists(astriver, _cell_y)) { // check if row exists in 2D A* river map
									astriver[?_cell_y] = ds_map_create() // if not, create map
									ds_list_add(astriver_rows, _cell_y) // keep track that this row is being used
								}
							
								astriver[?_cell_y][?_cell_x] = _flow_dir // store flow direction in this cell
								ds_list_add(astriver_cols, _cell_x) // keep track that this column is being used
							}
						}
						
						//var _top_cost, _right_cost, _bottom_cost, _left_cost
						//if (ds_map_exists(astriver, _cell_y - 1) && ds_map_exists(astriver[?_cell_y - 1], _cell_x)) // top neighbor
						//	_top_cost = astriver[?_cell_y - 1][?_cell_x].dist_to_center
						//else _top_cost = infinity
						//if (ds_map_exists(astriver, _cell_y) && ds_map_exists(astriver[?_cell_y], _cell_x + 1)) // right neighbor
						//	_right_cost = astriver[?_cell_y][?_cell_x + 1].dist_to_center
						//else _right_cost = infinity
						//if (ds_map_exists(astriver, _cell_y + 1) && ds_map_exists(astriver[?_cell_y + 1], _cell_x)) // bottom neighbor
						//	_bottom_cost = astriver[?_cell_y + 1][?_cell_x].dist_to_center
						//else _bottom_cost = infinity
						//if (ds_map_exists(astriver, _cell_y) && ds_map_exists(astriver[?_cell_y], _cell_x - 1)) // left neighbor
						//	_left_cost = astriver[?_cell_y][?_cell_x - 1].dist_to_center
						//else _left_cost = infinity
					
						//var _th = 0
						//var _min_cost = min(_top_cost, _right_cost, _bottom_cost, _left_cost)
						//if (_top_cost == _min_cost) _th = 90
						//if (_bottom_cost == _min_cost) _th = 270
						//if (_left_cost == _min_cost) _th = 180
					
						//var _cost = _min_cost + holpath_cell_size
					}
				}
				
				astriver_build_i ++ // move to next point for next step
			}
			
			// Build RRT* tree
			if (rrt_branch = undefined) {
				rrt_branch = new rs_turn_element(_body_x, _body_y, _body_rot, _body_rot) // node that tree starts from
				ds_list_add(rrt_branches, rrt_branch)
			} else {
				var _cell_test_x = astriver_cols[|irandom(ds_list_size(astriver_cols)-1)] // get random cell from A* river
				var _cell_test_y = astriver_rows[|irandom(ds_list_size(astriver_rows)-1)] 
				var _pt_test_x = _cell_test_x * holpath_cell_size // use cell location as test point
				var _pt_test_y = _cell_test_y * holpath_cell_size
				var _pt_test_th = astriver[?_cell_test_y][?_cell_test_x] // get orientation of test point
				
				// find nearest RTT branch (more precisely, lowest cost, defined in both distance to test point and angle difference with test point orientation)
				var _nearest = undefined
				var _cost = infinity
				for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
					var _branch = rrt_branches[|i]
					var _branch_cost = point_distance(_branch.x_end, _branch.y_end, _pt_test_x, _pt_test_y) + abs(angle_difference(_branch.th_end, _pt_test_th)) // combined distance & angle difference cost from branch end point to test point
					if (_branch_cost < _cost) {
						_nearest = _branch
						_cost = _branch_cost
					}
				}
				
				// create new branch
				if (_nearest != undefined) {
					var _new_branch = undefined
					var _dist = point_distance(_nearest.x_end, _nearest.y_end, _pt_test_x, _pt_test_y) // distance branch end point to test point
					var _angdiff = angle_difference(_pt_test_th, _nearest.th_end) // angle diff from node orientation to test point orientation
					if (abs(_angdiff) <= 22.5) {
						_new_branch = new rs_straight_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 25, RS_STRAIGHT)
					} else if (abs(_angdiff) <= 45) {
						_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 45, sign(_angdiff), RS_STRAIGHT, rs_min_r)
					} else if (abs(_angdiff) <= 67.5) {
						_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 67.5, sign(_angdiff), RS_STRAIGHT, rs_min_r)
					} else if (abs(_angdiff) <= 90) {
						_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 90, sign(_angdiff), RS_STRAIGHT, rs_min_r)
					} else if (abs(_angdiff) <= 112.5) {
						_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 112.5, sign(_angdiff), RS_STRAIGHT, rs_min_r)
					} else if (abs(_angdiff) <= 135) {
						_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 135, sign(_angdiff), RS_STRAIGHT, rs_min_r)
					} else if (abs(_angdiff) <= 157.5) {
						_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 157.5, sign(_angdiff), RS_STRAIGHT, rs_min_r)
					} else if (abs(_angdiff) <= 180) {
						_new_branch = new rs_arc_element(_nearest.x_end, _nearest.y_end, _nearest.th_end, 180, sign(_angdiff), RS_STRAIGHT, rs_min_r)
					}
					
					// add new branch to nearest branch end point
					if (_new_branch != undefined) {
						ds_list_add(_nearest.links, _new_branch) // add new branch to branch links
						ds_list_add(rrt_branches, _new_branch) // add to total list of branches
					}
				}
			}
		}
		
		// Check if holonomic path is completed
		var _path_end_x = path_get_point_x(holpath, path_get_number(holpath)-1)
		var _path_end_y = path_get_point_y(holpath, path_get_number(holpath)-1)
		var _dist = point_distance(body.get_x(), body.get_y(), _path_end_x, _path_end_y)
		var _holpath_completion_tolerance = 15
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
