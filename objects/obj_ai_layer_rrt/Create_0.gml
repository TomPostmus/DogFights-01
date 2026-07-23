#macro RRT_LEFT 1 // RRT element steering and gear macros
#macro RRT_RIGHT -1
#macro RRT_FORWARD 1
#macro RRT_BACKWARD -1

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

// RRT (Rapid Random Tree) layer properties
rrt_curbranch = undefined // current RRT* branch we're walking
rrt_path = ds_list_create() // list of branches representing path to minimal cost branch
rrt_branches = ds_list_create() // all branches of RRT
rrt_branches_open = ds_list_create() // list of branches that are still open, no connections at end point yet
rrt_gearshift_pen = 0 // penalty variables in G cost for gearshift or steershift between RRT node and its parent. The higher the shift penalties, the more it preserves momentum.
rrt_steershift_pen = 0
rrt_branch_completed = false // whether current branch we're walking has been completed
rrt_walk_maxtime = 80 // how many steps maximally to wait for completing element
rrt_walk_timer = rrt_walk_maxtime // timer for keeping completion time of element in check

rrt_straight_len = 20 // lengths of straight and arc elements tree is built with
rrt_arc_len = 20

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
	s_cost = undefined // S cost, summed cost of H cost and G cost
	h_cost = undefined // heuristic (H) cost defined by APF layer, updated in step
	
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
		}
	}
}

function rrt_turn_element(_parent, _x, _y, _th, _th_end) : rrt_branch(_parent, _x, _y, _th) constructor { // constructor for turn element	
	// Set turn element properties
	type = RRT_TURN
	l = abs(angle_difference(_th_end, _th)) // length of turn in degrees
	x_end = x // coordinates of endpoint
	y_end = y
	th_end = _th_end
	gear = 0
	steering = sign(l)
	
	// Compute G cost
	if (parent != undefined) {
		var _time = abs(l) / 360 * RRT_TURN_TIME // est. time (in steps) to complete element
		var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
		g_cost = _parent.g_cost + _analogous_dist * 0.5 + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) // compute G cost (in A* terms) for this element based on base G cost from parent
	} else g_cost = 0
	
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

function rrt_straight_element(_parent, _x, _y, _th, _l, _gear) : rrt_branch(_parent, _x, _y, _th) constructor { // constructor for straight element	
	// Set straight element properties
	type = RRT_STRAIGHT
	l = _l // length of turn in pixels, positive length for left turn, negative for righ turn
	x_end = x + lengthdir_x(_gear * _l, _th) // coordinates of endpoint
	y_end = y + lengthdir_y(_gear * _l, _th)
	th_end = _th
	gear = _gear
	steering = 0
	
	// Compute G cost
	if (parent != undefined) {
		var _time = l / RRT_V // est. time (in steps) to complete element
		var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
		g_cost = _parent.g_cost + _analogous_dist + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) + RRT_REVERSE_PEN * (gear < 0) // compute G cost (in A* terms) for this element based on base G cost from parent
	} else g_cost = 0	
	
	// Draw this line segment
	static draw = function() {			
		draw_line(x, y, x_end, y_end)
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

function rrt_arc_element(_parent, _x, _y, _th, _l, _steering, _gear) : rrt_branch(_parent, _x, _y, _th) constructor { // constructor for arc element	
	// Set arc element properties
	type = RRT_ARC
	l = _l // length of turn in degrees, positive length for left turn, negative for righ turn
	gear = _gear
	steering = _steering

	center_x = _x + lengthdir_x(RRT_R, _th + _steering * 90) // center position of arc
	center_y = _y + lengthdir_y(RRT_R, _th + _steering * 90) // either left or right from start pos (depending on left or right steering)
	
	x_end = center_x + lengthdir_x(RRT_R, _th - _steering * 90 + _gear * _steering * _l)
	y_end = center_y + lengthdir_y(RRT_R, _th - _steering * 90 + _gear * _steering * _l)
	th_end = th + gear * steering * l
	
	// Compute G cost
	if (parent != undefined) {
		var _time = abs(l) / 360 * RRT_TURN_TIME // est. time (in steps) to complete element
		var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
		g_cost = _parent.g_cost + _analogous_dist * 0.5 + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) // compute G cost (in A* terms) for this element based on base G cost from parent
	} else g_cost = 0	
		
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
		
			draw_line( // draw line segment
				center_x + lengthdir_x(RRT_R, th - steering * 90 + _d_start), // draw from center
				center_y + lengthdir_y(RRT_R, th - steering * 90 + _d_start),
				center_x + lengthdir_x(RRT_R, th - steering * 90 + _d_end),
				center_y + lengthdir_y(RRT_R, th - steering * 90 + _d_end)
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
	for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
		var _branch = rrt_branches[|i]
		
		draw_set_colour(
			ds_list_find_index(rrt_path, _branch) != -1 ? c_lime 
			: (_branch.open ? c_red : c_blue))
		
		_branch.draw()	
	}
	
}