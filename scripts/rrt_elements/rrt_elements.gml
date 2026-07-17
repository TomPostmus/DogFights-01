#macro RRT_STRAIGHT 0 // types of RRT path elements (straight line, arc or stationary turn)
#macro RRT_ARC 1
#macro RRT_TURN 2
#macro RRT_ROOT 3

#macro RRT_R 50 // turning radius for arcs (in pixels)
#macro RRT_V 2 // assumed speed of player (pixels/step)
#macro RRT_TURN_TIME 141 // assumed number of frames for making full turn

#macro RRT_GEARSHIFT_PEN 0 // constants for how much to penalise gear shifts and steering shifts in G cost
#macro RRT_STEERSHIFT_PEN 0
#macro RRT_REVERSE_PEN 0 // how much to penalise reverse gear elements

// Mark branch for deletion
// Return the number of child branches that have been marked for deletion
function rrt_mark_del(_branch) {
	_branch.del = true
	
	for (var i = 0; i < ds_list_size(_branch.links); i ++)
		rrt_mark_del(_branch.links[|i]) // recursively call on child elements
}

// Propagate growth into parent elements
function rrt_grow(_branch, _amount) {
	_branch.thickness += _amount // increase thickness
	
	if (_branch.parent != undefined)
		rrt_grow(_branch.parent, _amount) // recursively do for parent elements
}

// Root element that is start of tree
function rrt_root_element(_x, _y, _th) constructor {
	type = RRT_ROOT
	parent = undefined
	
	x = _x // starting position
	y = _y
	th = _th // angle (orientation of line)
	x_end = x
	y_end = y
	th_end = _th
	
	steering = 0
	gear = 0
	
	links = ds_list_create() // branches linked to this node
	thickness = 0 // thickness of branch, i.e. how many branches are hanging from it
	del = false // flag whether branch is to be deleted (necessary for safely removing branch in rrt_branches list)
	
	g_cost = 0
	h_cost = undefined // defined outside
	s_cost = undefined
	lowest_cost_dir = undefined
	mani_z = undefined // height on manifold
	mani_slope = undefined // slope on manifold
	mani_tang_x = undefined // x and y component of tangent plane normal
	mani_tang_y = undefined
	
	// Draw root element
	static draw = function() {
		draw_circle(x, y, 2, false)
	}
	
	// Check collision
	static collision_free = function(_col_slider, _obstr_objects) {
		return true
	}
	
	// Shorten
	static shorten = function(_col_slider, _obstr_objects) {
		return 1
	}
}

// Stationary turn in path (kink in path)
function rrt_turn_element(_parent, _x, _y, _th, _th_end) constructor {
	type = RRT_TURN
	parent = _parent // parent element
	x = _x // starting position
	y = _y
	th = _th // angle (orientation of line)
	l = angle_difference(_th_end, _th) // length of turn in degrees
	steering = sign(l)
	gear = 0 // no gear
	
	x_end = x
	y_end = y
	th_end = _th_end
	
	links = ds_list_create() // branches linked to this node
	thickness = 0 // thickness of branch, i.e. how many branches are hanging from it
	del = false // flag whether branch is to be deleted (necessary for safely removing branch in rrt_branches list)
	
	var _time = abs(l) / 360 * RRT_TURN_TIME // est. time (in steps) to complete element
	var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
	g_cost = _parent.g_cost + _analogous_dist * 0.5 + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) // compute G cost (in A* terms) for this element based on base G cost from parent
	
	h_cost = undefined // defined outside
	s_cost = undefined
	lowest_cost_dir = undefined
	mani_z = undefined // height on manifold
	mani_slope = undefined // slope on manifold
	mani_tang_x = undefined // x and y component of tangent plane normal
	mani_tang_y = undefined
	
	// Draw this turn element (little circle)
	static draw = function() {
		if (argument_count > 0)
			draw_set_colour(argument[0])
		else
			draw_set_colour(c_blue)
		draw_circle(x, y, 2, false)
		
		draw_set_colour(c_red)
		draw_arrow(x, y, x + lengthdir_x(8, th_end), y + lengthdir_y(8, th_end), 2)
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
	
	// Same as collision_free in sense that we're sliding the collision slider over path checking for collisions
	// But this same shorten the path, to be a shorter path that is collision free
	// Returns 1 if path segment is collision free and original length, returns 2 if path was shortened to be collision free, returns 0 if not collision free and shortening was not possible
	static shorten = function(_col_slider, _obstr_objects) {
		return 1 // turning in place is considered to be always possible, even if there are obstacles that the player hits, it is still able to turn
		// therefore the shorten function for does nothing, simply returns success (1)
	}
}

// Straight line path element constructor in world frame
function rrt_straight_element(_parent, _x, _y, _th, _l, _gear) constructor {
	type = RRT_STRAIGHT
	parent = _parent
	x = _x // starting position of line in world
	y = _y
	th = _th // angle (orientation of line)
	l = _l // line length in pixels
	steering = 0 // no steering
	gear = _gear // forwards or backward arc
	
	x_end = x + lengthdir_x(gear * l, th) // end position of line
	y_end = y + lengthdir_y(gear * l, th)
	th_end = th
	
	links = ds_list_create() // branches linked to this node
	thickness = 0 // thickness of branch, i.e. how many branches are hanging from it
	del = false // flag to mark for deletion
	
	var _time = l / RRT_V // est. time (in steps) to complete element
	var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
	g_cost = _parent.g_cost + _analogous_dist + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) + RRT_REVERSE_PEN * (gear < 0) // compute G cost (in A* terms) for this element based on base G cost from parent
	
	h_cost = undefined // defined outside
	s_cost = undefined
	lowest_cost_dir = undefined
	mani_z = undefined // height on manifold
	mani_slope = undefined // slope on manifold
	mani_tang_x = undefined // x and y component of tangent plane normal
	mani_tang_y = undefined
	
	// Draw this line segment
	static draw = function() {
		if (argument_count > 0)
			draw_set_colour(argument[0])
		else
			draw_set_colour(c_blue)
			
		draw_line_width(x, y, x_end, y_end, 1 + (thickness > 5) + (thickness > 10) + (thickness > 15))
	}
	
	// Check collision using collision slider and given obstruction objects types
	// Return true if there is no collision, false otherwise
	static collision_free = function(_col_slider, _obstr_objects, _player_x, _player_y) {
		if (point_distance(x_end, y_end, _player_x, _player_y) < 3)
			return true
			
		_col_slider.x = x_end // put collision slider on end point
		_col_slider.y = y_end
		_col_slider.image_angle = th
		with (_col_slider) {
			for (var i = 0; i < array_length(_obstr_objects); i ++)
				if (place_meeting(x, y, _obstr_objects[i]))
					return false
		}
		
		return true
		
		// Iterative (for longer segments)
		//var _precision = 10
		//var _last_iter = false
		//var _d = 0 // distance over line of colslider
		//_col_slider.image_angle = th
		//while (true) {
		//	if (_d > l) {
		//		_d = l // cap at length
		//		_last_iter = true
		//	}
			
		//	_col_slider.x = x + lengthdir_x(gear * _d, th) // slide over line
		//	_col_slider.y = y + lengthdir_y(gear * _d, th)
		//	with (_col_slider) {
		//		for (var i = 0; i < array_length(_obstr_objects); i ++)
		//			if (place_meeting(x, y, _obstr_objects[i]))
		//				return false
		//	}
			
		//	if (_last_iter)
		//		return true
			
		//	_d += _precision
		//}
	}
	
	// Same as collision_free in sense that we're sliding the collision slider over path checking for collisions
	// But this same shorten the path, to be a shorter path that is collision free
	// Returns 1 if path segment is collision free and original length, returns 2 if path was shortened to be collision free, returns 0 if not collision free and shortening was not possible
	static shorten = function(_col_slider, _obstr_objects) {
		var _precision = 5
		var _last_iter = false
		var _found_collision = false
		var _d = 0 // distance over line of colslider
		_col_slider.image_angle = th
		while (true) {
			if (_d > l) {
				_d = l // cap at length
				_last_iter = true
			}
			
			_col_slider.x = x + lengthdir_x(gear * _d, th) // slide over line
			_col_slider.y = y + lengthdir_y(gear * _d, th)
			with (_col_slider) {
				for (var i = 0; i < array_length(_obstr_objects); i ++)
					if (place_meeting(x, y, _obstr_objects[i]))
						_found_collision = true
			}
			
			if (_found_collision) {
				_d -= _precision
				if (_d <= 0) return 0 // for negative or zero d, non sensical path element, return 0
				x_end = x + lengthdir_x(gear * _d, th) // new line end point
				y_end = y + lengthdir_y(gear * _d, th)
				l = _d // new line length
				return 2
			}
			
			if (_last_iter)
				return 1
			
			_d += _precision
		}
	}
}

// Arc path element constructor in world frame
function rrt_arc_element(_parent, _x, _y, _th, _l, _steering, _gear) constructor {
	type = RRT_ARC
	parent = _parent
	x = _x // starting position of arc in world
	y = _y
	th = _th // starting angle of arc
	l = _l // arc length in degrees (can be from 0 to 180)
	steering = _steering // left or right steering
	gear = _gear // forwards or backward arc
	
	center_x = _x + lengthdir_x(RRT_R, _th + _steering * 90) // center position of arc
	center_y = _y + lengthdir_y(RRT_R, _th + _steering * 90) // either left or right from start pos (depending on left or right steering)
	
	x_end = center_x + lengthdir_x(RRT_R, _th - _steering * 90 + _gear * _steering * _l)
	y_end = center_y + lengthdir_y(RRT_R, _th - _steering * 90 + _gear * _steering * _l)
	th_end = th + gear * steering * l
	
	links = ds_list_create() // branches linked to this node
	thickness = 0 // thickness of branch, i.e. how many branches are hanging from it
	del = false
	
	var _time = degtorad(l) * RRT_R / RRT_V // est. time (in steps) to complete element
	var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
	g_cost = _parent.g_cost + _analogous_dist + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) + RRT_REVERSE_PEN * (gear < 0) // compute G cost (in A* terms) for this element based on base G cost from parent
	
	h_cost = undefined // defined outside
	s_cost = undefined
	lowest_cost_dir = undefined
	mani_z = undefined // height on manifold
	mani_slope = undefined // slope on manifold
	mani_tang_x = undefined // x and y component of tangent plane normal
	mani_tang_y = undefined
	
	// Draw this arc
	static draw = function() {
		var _precision = 10 // precision in degrees of arc drawing
		var _d_start = 0 // start of line segment
		var _d_end = gear * steering * _precision // end of line segment
		var _last_iter = false
		
		if (argument_count > 0)
			draw_set_colour(argument[0])
		else
			draw_set_colour(c_blue)
			
		while (true) {
			if (abs(_d_end) > l) {
				_d_end = gear * steering * l // cap at length
				_last_iter = true
			}
		
			//draw_set_colour(c_blue)
			draw_line_width( // draw line segment
				center_x + lengthdir_x(RRT_R, th - steering * 90 + _d_start), // draw from center
				center_y + lengthdir_y(RRT_R, th - steering * 90 + _d_start),
				center_x + lengthdir_x(RRT_R, th - steering * 90 + _d_end),
				center_y + lengthdir_y(RRT_R, th - steering * 90 + _d_end), 1 + (thickness > 5) + (thickness > 10) + (thickness > 15)
			)
			
		
			if (_last_iter)
				break
			
			_d_start += gear * steering * _precision
			_d_end += gear * steering * _precision
		
		}
	}
	
	// Check collision using collision slider and given obstruction objects types
	// Return true if there is no collision, false otherwise
	static collision_free = function(_col_slider, _obstr_objects, _player_x, _player_y) {
		if (point_distance(x_end, y_end, _player_x, _player_y) < 3)
			return true
		
		_col_slider.x = x_end // put collision slider on end point
		_col_slider.y = y_end
		_col_slider.image_angle = th_end
		with (_col_slider) {
			for (var i = 0; i < array_length(_obstr_objects); i ++)
				if (place_meeting(x, y, _obstr_objects[i]))
					return false
		}
		
		return true
		
		// Iterative (for longer segments)
		//var _precision = 25 // precision in degrees of collision check
		//var _d = 0 // distance of sliding over arc segment
		//var _last_iter = false
		//while (true) {
		//	if (_d > l) {
		//		_d = l // cap at length
		//		_last_iter = true
		//	}				
				
		//	_col_slider.x = center_x + lengthdir_x(RRT_R, th - steering * 90 + gear * steering * _d) // slide over arc
		//	_col_slider.y = center_y + lengthdir_y(RRT_R, th - steering * 90 + gear * steering * _d)
		//	_col_slider.image_angle = th + gear * steering * _d // slide angle over turn rotation
		//	with (_col_slider) {
		//		for (var i = 0; i < array_length(_obstr_objects); i ++)
		//			if (place_meeting(x, y, _obstr_objects[i]))
		//				return false
		//	}
		
		//	if (_last_iter)
		//		return true
			
		//	_d += _precision
		//}
	}
	
	// Same as collision_free in sense that we're sliding the collision slider over path checking for collisions
	// But this same shorten the path, to be a shorter path that is collision free
	// Returns 1 if path segment is collision free and original length, returns 2 if path was shortened to be collision free, returns 0 if not collision free and shortening was not possible
	static shorten = function(_col_slider, _obstr_objects) {
		var _precision = 12.5 // precision in degrees of collision check
		var _d = 0 // distance of sliding over arc segment
		var _last_iter = false
		var _found_collision = false
		while (true) {
			if (_d > l) {
				_d = l // cap at length
				_last_iter = true
			}				
				
			_col_slider.x = center_x + lengthdir_x(RRT_R, th - steering * 90 + gear * steering * _d) // slide over arc
			_col_slider.y = center_y + lengthdir_y(RRT_R, th - steering * 90 + gear * steering * _d)
			_col_slider.image_angle = th + gear * steering * _d // slide angle over turn rotation
			with (_col_slider) {
				for (var i = 0; i < array_length(_obstr_objects); i ++)
					if (place_meeting(x, y, _obstr_objects[i]))
						_found_collision = true
			}
			
			if (_found_collision) {
				_d -= _precision
				if (_d <= 0) return 0 // for negative or zero d, non sensical path element, return 0
				x_end = center_x + lengthdir_x(RRT_R, th - steering * 90 + gear * steering * _d) // new arc end point
				y_end = center_y + lengthdir_y(RRT_R, th - steering * 90 + gear * steering * _d)
				th_end = th + gear * steering * _d // slide angle over turn rotation
				l = _d // new arc length
				return 2
			}
			
		
			if (_last_iter)
				return 1
			
			_d += _precision
		}
	}
}
