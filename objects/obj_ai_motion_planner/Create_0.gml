/// @description
event_inherited()

colslider = create_groundhigh(x, y, obj_ai_collision_slider) // create collision slider for checking collisions on planned RRT paths (it 'slides' over the RRT paths)
obstr_objects = tag_get_asset_ids("AIObstruction", asset_object) // array of objects that are considered obstructions for AI motion planning

// Inputs from player
body_x = undefined // the current x,y,th position of the player
body_y = undefined
body_th = undefined // orientation of player
cost_field = undefined // the cost field in which RRT should grow

// Outputs to player
move_input = 0 // the move (forwards, backwards) and turn input the motion planner sends to player
turn_input = 0

// Path mode
path_mode = AI_PATH_MODE.DESTINATION_BASED

// Timer
// TODO Issue-011: connect with central scheduler obj_ai_scheduler
tree_update_frames = 1 // set timer lengths
path_update_frames = -1 // disable timer; handled in step upon completing RRT branch

// State machine
sm_h_cost_threshold = 10

// RRT (Rapid Random Tree) layer properties
//rrt_curbranch = undefined // current RRT* branch we're walking
//rrt_path = ds_list_create() // list of branches representing path to minimal cost branch
//rrt_branches = ds_list_create() // all branches of RRT
//rrt_branches_open = ds_list_create() // list of branches that are still open, no connections at end point yet
//rrt_gearshift_pen = 0 // penalty variables in G cost for gearshift or steershift between RRT node and its parent. The higher the shift penalties, the more it preserves momentum.
//rrt_steershift_pen = 0
rrt_branch_completed = false // whether current branch we're walking has been completed
	// TODO: make rrt_branch_completed local in Step?
rrt_max_size = 200 // maximum size tree can grow to
rrt_walk_maxtime = 80 // how many steps maximally to wait for completing element
rrt_walk_timer = rrt_walk_maxtime // timer for keeping completion time of element in check

//rrt_straight_len = 20 // lengths of straight and arc elements tree is built with
//rrt_arc_len = 20

/// @description Explore motion possibilities from a branch and add as new branches
explore_branch = function(_branch) {
	// TODO: array with fixed positions for children to check if already has children for those positions
	
	var _nr_added = 0 // how many branches are added to branch
				
	if !(_branch.type == RRT_TYPE.STRAIGHT && _branch.gear == RRT_GEAR_BACKWARD) { // check element type of how it came here
		var _straight_f = new AIRRTBranchStraight(_branch, RRT_GEAR_FORWARD) // make forward straight element
		if (_straight_f.collision_free(colslider)) { // check has no collision
			add_element(_straight_f)
			_nr_added ++
		}
	}
				
	if !(_branch.type == RRT_TYPE.STRAIGHT && _branch.gear == RRT_GEAR_FORWARD) {
		var _straight_b = new AIRRTBranchStraight(_branch, RRT_GEAR_BACKWARD)
		if (_straight_b.collision_free(colslider)) {
			add_element(_straight_b)
			_nr_added ++
		} 
	}
				
	if !(_branch.steering == RRT_STEERING_LEFT && _branch.gear == RRT_GEAR_BACKWARD) {
		var _arc_left_f = new AIRRTBranchArc(_branch, RRT_GEAR_FORWARD, RRT_STEERING_LEFT) // make forward left arc
		if (_arc_left_f.collision_free(colslider)) {
			add_element(_arc_left_f)
			_nr_added ++
		}
	}
				
	if !(_branch.steering == RRT_STEERING_LEFT && _branch.gear == RRT_GEAR_FORWARD) {
		var _arc_left_b = new AIRRTBranchArc(_branch, RRT_GEAR_BACKWARD, RRT_STEERING_LEFT) // make backward left arc
		if (_arc_left_b.collision_free(colslider)) {
			add_element(_arc_left_b)
			_nr_added ++
		}
	}
				
	if !(_branch.steering == RRT_STEERING_RIGHT && _branch.gear == RRT_GEAR_BACKWARD) {
		var _arc_right_f = new AIRRTBranchArc(_branch, RRT_GEAR_FORWARD, RRT_STEERING_RIGHT) // make forward right arc
		if (_arc_right_f.collision_free(colslider)) {
			add_element(_arc_right_f)
			_nr_added ++
		}
	}
				
	if !(_branch.steering == RRT_STEERING_RIGHT && _branch.gear == RRT_GEAR_FORWARD) {
		var _arc_right_b = new AIRRTBranchArc(_branch, RRT_GEAR_BACKWARD, RRT_STEERING_RIGHT) // make backward right arc
		if (_arc_right_b.collision_free(colslider)) {
			add_element(_arc_right_b)
			_nr_added ++
		}
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
			
	// if only 1 open branch and 0 branches could be added
	if (ds_list_size(elements) == 1 && _nr_added == 0) {
		delete_element(root) // destroy root, player is likely stuck or drifted away from tree root position
	}
}

/// @description Override computation of H cost function for RRT branch
/// @param {AIRRTBranch} branch The branch to compute H cost for
/// @context obj_ai_motion_planner
compute_h_cost = function(_branch) {
	
	if (cost_field) 
		_branch.h_cost = cost_field(_branch.x, _branch.y, _branch.th)
	
}

/// @description Recenter RRT on body 3D position
/// @context obj_ai_motion_planner
//recenter_rrt_on_body = function(_body_x, _body_y, _body_th) {
	
//	var _x_delta = _body_x - root.x_begin // difference between root coordinates and body coordinates
//	var _y_delta = _body_y - root.y_begin
//	var _th_delta = angle_difference(_body_th, root.th_begin)

//	for (var i = 0; i < ds_list_size(elements); i ++)
//		elements[|i].move(_x_delta, _y_delta, _th_delta)
//}

function rrt_branch(_parent, _x, _y, _th) constructor { // parent constructor for branch object
	parent = _parent
	x = _x
	y = _y
	th = _th
	
	ds_list_add(other.rrt_branches, self) // put self in rrt branch lists
	ds_list_add(other.rrt_branches_open, self)
	open = true // whether is open node (not explored yet)
	
	if (_parent != undefined)
		ds_list_add(_parent.links, self) // put self in parent links
	
	links = ds_list_create()
	
	// Destroy RRT branch
	static destroy = function(_decouple=true) {
		var _list_i = ds_list_find_index(other.rrt_branches, self) // remove self from rrt branch lists
		ds_list_delete(other.rrt_branches, _list_i)
		
		if (open) { // remove from open list, if it is in there
			_list_i = ds_list_find_index(other.rrt_branches_open, self)
			ds_list_delete(other.rrt_branches_open, _list_i)
		}
		
		_list_i = ds_list_find_index(other.rrt_path, self) // remove self from rrt path if in there
		if (_list_i != -1)
			ds_list_delete(other.rrt_path, _list_i)
			
		if (other.rrt_curbranch = self) // reset current branch variable if equals to self
			other.rrt_curbranch = undefined
		
		for (var i = 0; i < ds_list_size(links); i ++)
			links[|i].destroy(false) // call destroy on child elements without decoupling (parent is being destroyed anyway)
		ds_list_destroy(links) // finally destroy links list
		
		if (_decouple && parent != undefined) { // if decouple flag is set and has parent
			_list_i = ds_list_find_index(parent.links, self) // find self in parent links list
			ds_list_delete(parent.links, _list_i) // remove self from list
			if (!parent.open) { // add parent again to open list 
				parent.open = true
				ds_list_add(other.rrt_branches_open, parent)
			}
		}
	}
}

function rrt_turn_element(_parent, _x, _y, _th, _th_end) : rrt_branch(_parent, _x, _y, _th) constructor { // constructor for turn element (inherits from parent)
	// Set turn element properties
	type = RRT_TURN
	l = abs(angle_difference(_th_end, _th)) // length of turn in degrees
	x_end = x // coordinates of endpoint
	y_end = y
	th_end = _th_end
	gear = 0
	steering = sign(l)
	
	// Compute costs
	if (parent != undefined) {
		var _time = abs(l) / 360 * RRT_TURN_TIME // est. time (in steps) to complete element
		var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
		g_cost = _parent.g_cost + _analogous_dist * 0.5 + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) // compute G cost (in A* terms) for this element based on base G cost from parent
	} else g_cost = 0
	
	h_cost = other.cost_field(x_end, y_end, th_end) // heuristic (H) cost defined by upper layer
	s_cost = 2 * g_cost + h_cost // update S cost // S cost, summed cost of H cost and G cost
	
	// Draw turn element (circle with arrow)
	static draw = function() {
		draw_circle(x, y, 2, false)
		draw_arrow(x, y, x + lengthdir_x(8, th_end), y + lengthdir_y(8, th_end), 3)
	}
	
	// Check collision using collision slider and given obstruction objects types
	// Return true if there is no collision, false otherwise
	static collision_free = function(_col_slider, _obstr_objects) {
		var _precision = 25
		var _last_iter = false
		var _d = _precision // distance over turn
		_col_slider.x = x
		_col_slider.y = y
		
		while (true) {
			if (_d > l) {
				_d = l // cap at end angle
				_last_iter = true
			}
			
			_col_slider.image_angle = th + _d // slide over angles
			with (_col_slider) {
				for (var i = 0; i < array_length(_obstr_objects); i ++)
					if (place_meeting(x, y, _obstr_objects[i]))
						return false
			}
			
			if (_last_iter)
				return true
			
			_d += _precision
		}
	}
}

function rrt_straight_element(_parent, _x, _y, _th, _l, _gear) : rrt_branch(_parent, _x, _y, _th) constructor { // constructor for straight element	 (inherits from parent)
	// Set straight element properties
	type = RRT_STRAIGHT
	l = _l // length of turn in pixels, positive length for left turn, negative for righ turn
	x_end = x + lengthdir_x(_gear * _l, _th) // coordinates of endpoint
	y_end = y + lengthdir_y(_gear * _l, _th)
	th_end = _th
	gear = _gear
	steering = 0
	
	// Compute costs
	if (parent != undefined) {
		var _time = l / RRT_V // est. time (in steps) to complete element
		var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
		g_cost = _parent.g_cost + _analogous_dist + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) + RRT_REVERSE_PEN * (gear < 0) // compute G cost (in A* terms) for this element based on base G cost from parent
	} else g_cost = 0
	
	h_cost = other.cost_field(x_end, y_end, th_end) // heuristic (H) cost defined by upper layer
	s_cost = 2 * g_cost + h_cost // update S cost // S cost, summed cost of H cost and G cost
	
	// Draw this line segment
	static draw = function() {			
		draw_line_width(x, y, x_end, y_end, 1)
	}
	
	// Check collision using collision slider and given obstruction objects types
	// Return true if there is no collision, false otherwise
	static collision_free = function(_col_slider, _obstr_objects) {
		//if (point_distance(x_end, y_end, _player_x, _player_y) < 3)
		//	return true
			
		_col_slider.x = x_end // put collision slider on end point
		_col_slider.y = y_end
		_col_slider.image_angle = th
		with (_col_slider) {
			for (var i = 0; i < array_length(_obstr_objects); i ++)
				if (place_meeting(x, y, _obstr_objects[i]))
					return false
		}
		
		return true
	}
}

function rrt_arc_element(_parent, _x, _y, _th, _l, _steering, _gear) : rrt_branch(_parent, _x, _y, _th) constructor { // constructor for arc element (inherits from parent)	
	// Set arc element properties
	type = RRT_ARC
	l = _l // length of arc in degrees
	gear = _gear
	steering = _steering

	center_x = _x + lengthdir_x(RRT_R, _th + _steering * 90) // center position of arc
	center_y = _y + lengthdir_y(RRT_R, _th + _steering * 90) // either left or right from start pos (depending on left or right steering)
	
	x_end = center_x + lengthdir_x(RRT_R, _th - _steering * 90 + _gear * _steering * _l)
	y_end = center_y + lengthdir_y(RRT_R, _th - _steering * 90 + _gear * _steering * _l)
	th_end = th + gear * steering * l
	
	// Compute costs
	if (parent != undefined) {
		var _time = abs(l) / 360 * RRT_TURN_TIME // est. time (in steps) to complete element
		var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
		g_cost = _parent.g_cost + _analogous_dist * 0.5 + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) // compute G cost (in A* terms) for this element based on base G cost from parent
	} else g_cost = 0
	
	h_cost = other.cost_field(x_end, y_end, th_end) // heuristic (H) cost defined by upper layer
	s_cost = 2 * g_cost + h_cost // update S cost // S cost, summed cost of H cost and G cost
		
	// Draw this arc
	static draw = function() {
		var _precision = 10 // precision in degrees of arc drawing
		var _d_start = 0 // start of line segment
		var _d_end = gear * steering * _precision // end of line segment
		var _last_iter = false
			
		while (true) {
			if (abs(_d_end) > l) {
				_d_end = gear * steering * l // cap at length
				_last_iter = true
			}
		
			draw_line_width( // draw line segment
				center_x + lengthdir_x(RRT_R, th - steering * 90 + _d_start), // draw from center
				center_y + lengthdir_y(RRT_R, th - steering * 90 + _d_start),
				center_x + lengthdir_x(RRT_R, th - steering * 90 + _d_end),
				center_y + lengthdir_y(RRT_R, th - steering * 90 + _d_end), 1
			)
					
			if (_last_iter)
				break
			
			_d_start += gear * steering * _precision
			_d_end += gear * steering * _precision		
		}
	}
	
	// Check collision using collision slider and given obstruction objects types
	// Return true if there is no collision, false otherwise
	static collision_free = function(_col_slider, _obstr_objects) {
		//if (point_distance(x_end, y_end, _player_x, _player_y) < 3)
		//	return true
		
		_col_slider.x = x_end // put collision slider on end point
		_col_slider.y = y_end
		_col_slider.image_angle = th_end
		with (_col_slider) {
			for (var i = 0; i < array_length(_obstr_objects); i ++)
				if (place_meeting(x, y, _obstr_objects[i]))
					return false
		}
		
		return true
	}
}

// Draw RRT layer
draw = function() {

	// Draw RRT* tree
	for (var i = 0; i < ds_list_size(elements); i ++) {
		var _branch = elements[|i]
		
		draw_set_colour(c_blue)
		_branch.draw()
		
		//if (_branch.open) { // draw open endpoint in red
		//	draw_set_colour(c_red)
		//	draw_circle(_branch.x_end, _branch.y_end, 1, false)
		//}
	}
	
	for (var i = 0; i < ds_list_size(path); i ++) {
		var _branch = path[|i]
		
		draw_set_colour(_branch == root ? c_yellow : c_lime)
		_branch.draw()
	}
	
	// Draw cost every N iterations
	//draw_set_colour(c_lime)
	//draw_set_font(ft_small)
	//for (var i = 0; i < ds_list_size(elements); i += 20) {
	//	var _branch = elements[|i]
	//	draw_text(_branch.x, _branch.y, _branch.g_cost)
	//}
	
}