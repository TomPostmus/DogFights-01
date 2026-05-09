#macro RRT_STRAIGHT 0 // types of RRT path elements (straight line, arc or stationary turn)
#macro RRT_ARC 1
#macro RRT_TURN 2

// Stationary turn in path (kink in path)
function rrt_turn_element(_parent, _x, _y, _th, _th_end) constructor {
	type = RRT_TURN
	parent = _parent // parent element
	x = _x // starting position of line in world
	y = _y
	th = _th // angle (orientation of line)
	l = 0 // line length in pixels
	steering = sign(angle_difference(_th_end, _th))
	gear = 0 // no gear
	
	x_end = x
	y_end = y
	th_end = _th_end
	
	links = ds_list_create() // branches linked to this node
	thickness = 0 // thickness of branch, i.e. how many branches are hanging from it
	
	// Draw this kink (little circle)
	static draw = function() {
		draw_circle(x, y, 2, false)
		draw_arrow(x, y, x + lengthdir_x(8, th_end), y + lengthdir_y(8, th_end), 2)
		
		// draw cost
		//draw_set_font(ft_path_debug)
		//var _s = (g_cost != undefined && h_cost != undefined) ? g_cost + h_cost : undefined
		//draw_text(x + 10, y, $"G:{g_cost}, H:{h_cost}")
		//draw_text(x + 10, y, $" H:{h_cost}")
		//draw_text(x + 10, y + 10, $"S:{_s}")
	}
	
	del = false // flag to mark for deletion
	
	// Cleanup
	static destroy = function() {
		for (var i = 0; i < ds_list_size(links); i ++)
			links[|i].destroy() // destroy child elements
		ds_list_destroy(links) // destroy ds list
		del = true // mark for deletion (handled in AI step)
	}
	
	// Propagate growth into parent elements
	static grow = function() {
		thickness ++ // increase thickness
		if (parent != undefined)
			parent.grow() // also for parent
	}
	
	cost = undefined
	
	// Determine cost for this element based on A* river vector field
	static compute_cost = function() {
		cost = abs(angle_difference(th_end, th)) // TODO multiply with constant that represents how much time it takes to rotate
		
		return 1 // success
	}
	
	g_cost = undefined
	
	// Compute G cost (in A* terms) for this element based on base G cost from parent
	static compute_g_cost = function(_base_cost) {
		g_cost = _base_cost + abs(angle_difference(th_end, th)) // TODO multiply with constant that represents how much time it takes to rotate
	}
	
	h_cost = undefined
	
	// Check collision using collision slider and given obstruction objects types
	// Return true if there is no collision, false otherwise
	static collision_free = function(_col_slider, _obstr_objects) {
		//var _precision = 25 // precision in degrees
		//var _last_iter = false
		//var _diff = abs(angle_difference(_th_end, _th)) // angle difference between start and end rotation
		//var _d = 0 // distance of angle sliding
		//_col_slider.x = x
		//_col_slider.y = y
		//while (true) {
		//	if (_d > _diff) {
		//		_d = _diff // cap at max difference
		//		_last_iter = true
		//	}
			
		//	_col_slider.image_angle = th + steering * _d // slide angle over turn rotation
		//	with (_col_slider) {
		//		for (var i = 0; i < array_length(_obstr_objects); i ++)
		//			if (place_meeting(x, y, _obstr_objects[i]))
		//				return false
		//	}
			
		//	if (_last_iter)
		//		return true
			
		//	_d += _precision
		//}
		return true // turning in place is considered to be always possible, even if there are obstacles that the player hits, it is still able to turn
		// therefore the collision free function always returns true
	}
	
	// Same as collision_free in sense that we're sliding the collision slider over path checking for collisions
	// But this same shorten the path, to be a shorter path that is collision free
	// Returns 1 if path segment is collision free and original length, returns 2 if path was shortened to be collision free, returns 0 if not collision free and shortening was not possible
	static shorten = function(_col_slider, _obstr_objects) {
		//var _precision = 25 // precision in degrees
		//var _last_iter = false
		//var _found_collision = false
		//var _diff = abs(angle_difference(th_end, th)) // angle difference between start and end rotation
		//var _d = 0 // distance of angle sliding
		//_col_slider.x = x
		//_col_slider.y = y
		//while (true) {
		//	if (_d > _diff) {
		//		_d = _diff // cap at max difference
		//		_last_iter = true
		//	}
			
		//	_col_slider.image_angle = th + steering * _d // slide angle over turn rotation
		//	with (_col_slider) {
		//		for (var i = 0; i < array_length(_obstr_objects); i ++)
		//			if (place_meeting(x, y, _obstr_objects[i]))
		//				_found_collision = true
		//	}
			
		//	if (_found_collision) {
		//		_d -= _precision
		//		if (_d <= 0) return 0 // for negative or zero d, non sensical path element, return 0
		//		th_end = th + steering * _d // new rotation end point
		//		return 2
		//	}
			
		//	if (_last_iter)
		//		return 1
			
		//	_d += _precision
		//}
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
	
	// Draw this line segment
	static draw = function() {
		draw_line_width(x, y, x_end, y_end, 1 + (thickness > 5) + (thickness > 10) + (thickness > 15))
		
		// draw cost
		//draw_set_font(ft_path_debug)
		//var _s = (g_cost != undefined && h_cost != undefined) ? g_cost + h_cost : undefined
		////draw_text((x + x_end) / 2 + 10, (y + y_end) / 2, $"G:{g_cost}, H:{h_cost}")
		//draw_text((x + x_end) / 2 + 10, (y + y_end) / 2, $"H:{h_cost}")
		////draw_text((x + x_end) / 2 + 10, (y + y_end) / 2 + 10, $"S:{_s}")
	}
	
	del = false // flag to mark for deletion
	
	// Cleanup
	static destroy = function() {
		for (var i = 0; i < ds_list_size(links); i ++)
			links[|i].destroy() // destroy child elements
		ds_list_destroy(links) // destroy ds list
		del = true // mark for deletion (handled in AI step)
	}
	
	// Propagate growth into parent elements
	static grow = function() {
		thickness ++ // increase thickness
		if (parent != undefined)
			parent.grow() // also for parent
	}
	
	cost = undefined
	
	// Determine cost for this element based on A* river vector field
	// Returns -1 if element is found to be partially outside of A* river (element is to be deleted)
	static compute_cost = function(_astriver, _cell_size) {
		var _precision = 10
		var _last_iter = false
		var _d = _precision // distance over line
		var _d_prev = 0 // distance from previous iteration
		cost = 0
		while (true) {
			if (_d > l) {
				_d = l // cap at length
				_last_iter = true
			}
			
			var _xp = x + lengthdir_x(gear * _d, th)
			var _yp = y + lengthdir_y(gear * _d, th)
			var _cell_x = floor(_xp / _cell_size)
			var _cell_y = floor(_yp / _cell_size)
			if (ds_map_exists(_astriver, _cell_y) && ds_map_exists(_astriver[?_cell_y], _cell_x)) {
				var _flow_th = _astriver[?_cell_y][?_cell_x]
				cost += abs(angle_difference(_flow_th, th)) / (_d - _d_prev) // return angle diff with flow at this point, and normalize by distance since previous iteration
			} else { // if no A* river element underneath, stop cost calculation, return
				cost = undefined
				return -1
			}
			
			if (_last_iter)
				return true
			
			_d_prev = _d
			_d += _precision
		}
		
		return 1 // success
	}
	
	g_cost = undefined
	
	// Compute G cost (in A* terms) for this element based on base G cost from parent
	static compute_g_cost = function(_base_cost) {
		g_cost = _base_cost + l
	}
	
	h_cost = undefined
	
	// Check collision using collision slider and given obstruction objects types
	// Return true if there is no collision, false otherwise
	static collision_free = function(_col_slider, _obstr_objects) {
		var _precision = 10
		var _last_iter = false
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
function rrt_arc_element(_parent, _x, _y, _th, _l, _steering, _gear, _r) constructor {
	type = RRT_ARC
	parent = _parent
	x = _x // starting position of arc in world
	y = _y
	th = _th // starting angle of arc
	l = _l // arc length in degrees (can be from 0 to 180)
	r = _r // arc radius
	steering = _steering // left or right steering
	gear = _gear // forwards or backward arc
	
	center_x = _x + lengthdir_x(_r, _th + _steering * 90) // center position of arc
	center_y = _y + lengthdir_y(_r, _th + _steering * 90) // either left or right from start pos (depending on left or right steering)
	
	x_end = center_x + lengthdir_x(_r, _th - _steering * 90 + _gear * _steering * _l)
	y_end = center_y + lengthdir_y(_r, _th - _steering * 90 + _gear * _steering * _l)
	th_end = th + gear * steering * l
	
	links = ds_list_create() // branches linked to this node
	thickness = 0 // thickness of branch, i.e. how many branches are hanging from it
	
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
		
			//draw_set_colour(c_blue)
			draw_line_width( // draw line segment
				center_x + lengthdir_x(r, th - steering * 90 + _d_start), // draw from center
				center_y + lengthdir_y(r, th - steering * 90 + _d_start),
				center_x + lengthdir_x(r, th - steering * 90 + _d_end),
				center_y + lengthdir_y(r, th - steering * 90 + _d_end), 1 + (thickness > 5) + (thickness > 10) + (thickness > 15)
			)
			
		
			if (_last_iter)
				break
			
			_d_start += gear * steering * _precision
			_d_end += gear * steering * _precision
		
		}
		//draw_set_colour(c_red)
		//draw_circle(x_end, y_end, 1, false)
		
		// draw cost
		//draw_set_font(ft_path_debug)
		//var _s = (g_cost != undefined && h_cost != undefined) ? g_cost + h_cost : undefined
		//draw_text((x + x_end) / 2 + 10, (y + y_end) / 2, $"G:{g_cost}, H:{h_cost}")
		//draw_text((x + x_end) / 2 + 10, (y + y_end) / 2, $"H:{h_cost}")
		//draw_text((x + x_end) / 2 + 10, (y + y_end) / 2 + 10, $"S:{_s}")
	}
	
	// Determine cost for this element based on A* river vector field
	// Returns -1 if element is found to be partially outside of A* river (element is to be deleted)
	static compute_cost = function(_astriver, _cell_size) {
		var _precision = 25 // precision in degrees of cost computation
		var _last_iter = false
		var _d = _precision // distance over arc
		var _d_prev = 0 // distance from previous iteration
		cost = 0
		while (true) {
			if (_d > l) {
				_d = l // cap at length
				_last_iter = true
			}
			
			var _xp = center_x + lengthdir_x(r, th - steering * 90 + gear * steering * _d)
			var _yp = center_y + lengthdir_y(r, th - steering * 90 + gear * steering * _d)
			var _th = th + gear * steering * _d
			var _cell_x = floor(_xp / _cell_size)
			var _cell_y = floor(_yp / _cell_size)
			if (ds_map_exists(_astriver, _cell_y) && ds_map_exists(_astriver[?_cell_y], _cell_x)) {
				var _flow_th = _astriver[?_cell_y][?_cell_x]
				cost += abs(angle_difference(_flow_th, _th)) / (degtorad(_d - _d_prev) * r) // return angle diff with flow at this point, and normalize by distance since previous iteration
			} else { // if no A* river element underneath, stop cost calculation, return
				cost = undefined
				return -1
			}
			
			if (_last_iter)
				return true
			
			_d_prev = _d
			_d += _precision
		}
		
		return 1 // success
	}
	
	g_cost = undefined
	
	// Compute G cost (in A* terms) for this element based on base G cost from parent
	static compute_g_cost = function(_base_cost) {
		g_cost = _base_cost + degtorad(l) * r
	}
	
	h_cost = undefined
	
	// Check collision using collision slider and given obstruction objects types
	// Return true if there is no collision, false otherwise
	static collision_free = function(_col_slider, _obstr_objects) {
		var _precision = 25 // precision in degrees of collision check
		var _d = 0 // distance of sliding over arc segment
		var _last_iter = false
		while (true) {
			if (_d > l) {
				_d = l // cap at length
				_last_iter = true
			}				
				
			_col_slider.x = center_x + lengthdir_x(r, th - steering * 90 + gear * steering * _d) // slide over arc
			_col_slider.y = center_y + lengthdir_y(r, th - steering * 90 + gear * steering * _d)
			_col_slider.image_angle = th + gear * steering * _d // slide angle over turn rotation
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
		var _precision = 12.5 // precision in degrees of collision check
		var _d = 0 // distance of sliding over arc segment
		var _last_iter = false
		var _found_collision = false
		while (true) {
			if (_d > l) {
				_d = l // cap at length
				_last_iter = true
			}				
				
			_col_slider.x = center_x + lengthdir_x(r, th - steering * 90 + gear * steering * _d) // slide over arc
			_col_slider.y = center_y + lengthdir_y(r, th - steering * 90 + gear * steering * _d)
			_col_slider.image_angle = th + gear * steering * _d // slide angle over turn rotation
			with (_col_slider) {
				for (var i = 0; i < array_length(_obstr_objects); i ++)
					if (place_meeting(x, y, _obstr_objects[i]))
						_found_collision = true
			}
			
			if (_found_collision) {
				_d -= _precision
				if (_d <= 0) return 0 // for negative or zero d, non sensical path element, return 0
				x_end = center_x + lengthdir_x(r, th - steering * 90 + gear * steering * _d) // new arc end point
				y_end = center_y + lengthdir_y(r, th - steering * 90 + gear * steering * _d)
				th_end = th + gear * steering * _d // slide angle over turn rotation
				l = _d // new arc length
				return 2
			}
			
		
			if (_last_iter)
				return 1
			
			_d += _precision
		}
	}
	
	del = false // flag to mark for deletion
	
	// Cleanup
	static destroy = function() {
		for (var i = 0; i < ds_list_size(links); i ++)
			links[|i].destroy() // destroy child elements
		ds_list_destroy(links) // destroy ds list
		del = true // mark for deletion (handled in AI step)
	}
	
	// Propagate growth into parent elements
	static grow = function() {
		thickness ++ // increase thickness
		if (parent != undefined)
			parent.grow() // also for parent
	}
}
