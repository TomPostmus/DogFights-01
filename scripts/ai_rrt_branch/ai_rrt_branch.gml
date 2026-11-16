#macro RRT_STEERING_LEFT 1 // RRT element steering and gear macros
#macro RRT_STEERING_RIGHT -1
#macro RRT_GEAR_FORWARD 1
#macro RRT_GEAR_BACKWARD -1
#macro RRT_R 50 // turning radius for arcs (in pixels)
#macro RRT_V 2 // assumed speed of player (pixels/step)
#macro RRT_TURN_TIME 141 // assumed number of frames for making full turn
#macro RRT_GEARSHIFT_PEN 0 // constants for how much to penalise gear shifts and steering shifts in G cost
#macro RRT_STEERSHIFT_PEN 0
#macro RRT_REVERSE_PEN 0 // how much to penalise reverse gear elements
#macro RRT_STRAIGHT_LEN 20 // lengths of straight branches tree is built with
#macro RRT_ARC_LEN 22.5 // length of arc branches in degrees

enum RRT_TYPE { // RRT element types
	ROOT,
	TURN,
	STRAIGHT,
	ARC
}

/// @param {real} x The x coordinate of the root element
/// @param {real} y The y coordinate of the root element
/// @param {real} th The theta/orientation of the root element
/// @description Create an root element for the RRT
function AIRRTBranchRoot(_x, _y, _th) : AITreeElement(undefined) constructor {

	type = RRT_TYPE.ROOT
	
	gear = 0
	steering = 0
	
	// Begin point
	x_begin = _x
	y_begin = _y
	th_begin = _th
	
	/// @description Compute endpoint based on begin point
	/// @context AIRRTBranchRoot
	compute_endpoint = function() {
	
		x = x_begin
		y = y_begin
		th = th_begin
	
	}
	
	compute_endpoint()
	
	// Compute G cost
	g_cost = 0
	
	/// @description Draw root element as circle with arrow
	/// @context AIRRTBranchRoot
	draw = function() {
		draw_circle(x, y, 2, false)
		draw_arrow(x, y, x + lengthdir_x(8, th), y + lengthdir_y(8, th), 3)
	}
	
	/// @description Check collision. Assumed always true for root position
	/// @param {obj_ai_collision_slider} col_slider The collision slider to use to check collisions
	/// @returns {bool} Returns true
	/// @context AIRRTBranchRoot
	collision_free = function(_col_slider) {
		return true
	}
	
	/// @description Recenter element on 3D coordinate
	/// @param {real} x The new x of the begin point of the element
	/// @param {real} y The new y of the begin point of the element
	/// @param {real} th The new th of the begin point of the element
	/// @context AIRRTBranchRoot
	recenter = function(_x, _y, _th) {
		
		x_begin = _x
		y_begin = _y
		th_begin = _th
		
		compute_endpoint()
		
		for (var i = 0; i < ds_list_size(children); i ++)
			children[|i].recenter(x, y, th)
	
	} // TODO: place this function in generic AIRRTBranch parent?

}

/// @param {AIRRTBranch} parent The parent branch to which element is attached
/// @param {real} th The theta/orientation to turn to
/// @description Create an turn element for the RRT
function AIRRTBranchTurn(_parent, _th) : AITreeElement(_parent) constructor {

	type = RRT_TYPE.TURN
	
	turn_ang_diff = angle_difference(_th, _parent.th) // angle difference from parent th to turn element th
	turn_ang_len = abs(turn_ang_diff) // angular length of the turn

	gear = 0
	steering = sign(turn_ang_diff)
	
	// Begin point
	x_begin = _parent.x 
	y_begin = _parent.y
	th_begin = _parent.th
	
	/// @description Compute endpoint based on begin point
	/// @context AIRRTBranchTurn
	compute_endpoint = function() {
	
		x = x_begin
		y = y_begin	
		th = th_begin + turn_ang_diff
	
	}
	
	compute_endpoint()
	
	// Compute G cost
	var _time = turn_ang_len / 360 * RRT_TURN_TIME // est. time (in steps) to complete element
	var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
	g_cost = _parent.g_cost + _analogous_dist * 0.5 + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) // compute G cost (in A* terms) for this element based on base G cost from parent

	/// @description Draw turn element as circle with arrow
	/// @context AIRRTBranchTurn
	draw = function() {
		draw_circle(x, y, 2, false)
		draw_arrow(x, y, x + lengthdir_x(8, th), y + lengthdir_y(8, th), 3)
	}
	
	/// @description Check collision using collision slider and given obstruction objects types
	/// @param {obj_ai_collision_slider} col_slider The collision slider to use to check collisions
	/// @returns {bool} Returns true if there is no collision, false otherwise
	/// @context AIRRTBranchTurn
	collision_free = function(_col_slider) {
		var _precision = 25
		var _last_iter = false
		var _d = _precision // distance over turn
		_col_slider.x = x
		_col_slider.y = y
		
		while (true) {
			if (_d > turn_ang_len) {
				_d = turn_ang_len // cap at turn angular length
				_last_iter = true
			}
			
			_col_slider.image_angle = th_begin + _d // slide over angles
			with (_col_slider) {
				for (var i = 0; i < array_length(obj_ai_topology.obstr_objects); i ++)
					if (place_meeting(x, y, obj_ai_topology.obstr_objects[i]))
						return false
			}
			
			if (_last_iter)
				return true
			
			_d += _precision
		}
	}
	
	/// @description Recenter element on 3D coordinate
	/// @param {real} x The new x of the begin point of the element
	/// @param {real} y The new y of the begin point of the element
	/// @param {real} th The new th of the begin point of the element
	/// @context AIRRTBranchTurn
	recenter = function(_x, _y, _th) {
		
		x_begin = _x
		y_begin = _y
		th_begin = _th
		
		compute_endpoint()
		
		for (var i = 0; i < ds_list_size(children); i ++)
			children[|i].recenter(x, y, th)
	
	}

}

/// @param {AIRRTBranch} parent The parent branch to which element is attached
/// @param {int} gear Whether to go forwards (1) or backwards (-1)
/// @description Create an straight element for the RRT
function AIRRTBranchStraight(_parent, _gear) : AITreeElement(_parent) constructor {

	type = RRT_TYPE.STRAIGHT
	
	gear = _gear
	steering = 0
	
	// Begin point
	x_begin = _parent.x
	y_begin = _parent.y
	th_begin = _parent.th
		
	/// @description Compute endpoint based on begin point
	/// @context AIRRTBranchTurn
	compute_endpoint = function() {
	
		x = x_begin + lengthdir_x(gear * RRT_STRAIGHT_LEN, th_begin)
		y = y_begin + lengthdir_y(gear * RRT_STRAIGHT_LEN, th_begin)
		th = th_begin	
	
	}
	
	compute_endpoint()	
	
	// Compute G cost
	var _time = RRT_STRAIGHT_LEN / RRT_V // est. time (in steps) to complete element
	var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
	g_cost = _parent.g_cost + _analogous_dist + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) + RRT_REVERSE_PEN * (gear < 0) // compute G cost (in A* terms) for this element based on base G cost from parent
	
	/// @description Draw this line segment
	/// @context AIRRTBranchStraight
	draw = function() {			
		draw_line_width(x_begin, y_begin, x, y, 1)
	}
	
	/// @description Check collision using collision slider and given obstruction objects types
	/// @param {obj_ai_collision_slider} col_slider The collision slider to use to check collisions
	/// @returns {bool} Returns true if there is no collision, false otherwise
	/// @context AIRRTBranchStraight
	collision_free = function(_col_slider) {			
		_col_slider.x = x // put collision slider on end point
		_col_slider.y = y
		_col_slider.image_angle = th
		with (_col_slider) {
			for (var i = 0; i < array_length(obj_ai_topology.obstr_objects); i ++)
				if (place_meeting(x, y, obj_ai_topology.obstr_objects[i]))
					return false
		}
		
		return true
	}
	
	/// @description Recenter element on 3D coordinate
	/// @param {real} x The new x of the begin point of the element
	/// @param {real} y The new y of the begin point of the element
	/// @param {real} th The new th of the begin point of the element
	/// @context AIRRTBranchStraight
	recenter = function(_x, _y, _th) {
		
		// Begin point
		x_begin = _x
		y_begin = _y
		th_begin = _th
	
		compute_endpoint()
		
		for (var i = 0; i < ds_list_size(children); i ++)
			children[|i].recenter(x, y, th)
	
	}
	
}

/// @param {AIRRTBranch} parent The parent branch to which element is attached
/// @param {int} gear Whether to go forwards (1) or backwards (-1)
/// @param {int} steering Whether to go left (1) or right (-1)
/// @description Create an arc element for the RRT
function AIRRTBranchArc(_parent, _gear, _steering) : AITreeElement(_parent) constructor {

	type = RRT_TYPE.ARC
	
	gear = _gear
	steering = _steering
	
	// Begin point
	x_begin = _parent.x
	y_begin = _parent.y
	th_begin = _parent.th
		
	/// @description Compute endpoint based on begin point
	/// @context AIRRTBranchTurn
	compute_endpoint = function() {
	
		center_x = x_begin + lengthdir_x(RRT_R, th_begin + steering * 90) // center position of arc
		center_y = y_begin + lengthdir_y(RRT_R, th_begin + steering * 90) // either left or right from start pos (depending on left or right steering)
		x = center_x + lengthdir_x(RRT_R, th_begin - steering * 90 + gear * steering * RRT_ARC_LEN)
		y = center_y + lengthdir_y(RRT_R, th_begin - steering * 90 + gear * steering * RRT_ARC_LEN)
		th = th_begin + gear * steering * RRT_ARC_LEN
	
	}
	
	compute_endpoint()
	
	// Compute G cost
	var _time = RRT_ARC_LEN / 360 * RRT_TURN_TIME // est. time (in steps) to complete element
	var _analogous_dist = _time * RRT_V // distance analogous to time if player were to walk in a straight line in _time time. This is to keep G cost distance-based and consistent between all element types, and comparable to distance-based H cost
	g_cost = _parent.g_cost + _analogous_dist * 0.5 + RRT_GEARSHIFT_PEN * abs(_parent.gear - gear) + RRT_STEERSHIFT_PEN * abs(_parent.steering - steering) // compute G cost (in A* terms) for this element based on base G cost from parent
	
	/// @description Draw this arc
	/// @context AIRRTBranchArc
	draw = function() {
		var _precision = 10 // precision in degrees of arc drawing
		var _d_start = 0 // start of line segment
		var _d_end = gear * steering * _precision // end of line segment
		var _last_iter = false
			
		while (true) {
			if (abs(_d_end) > RRT_ARC_LEN) {
				_d_end = gear * steering * RRT_ARC_LEN // cap at length
				_last_iter = true
			}
		
			draw_line_width( // draw line segment
				center_x + lengthdir_x(RRT_R, th_begin - steering * 90 + _d_start), // draw from center
				center_y + lengthdir_y(RRT_R, th_begin - steering * 90 + _d_start),
				center_x + lengthdir_x(RRT_R, th_begin - steering * 90 + _d_end),
				center_y + lengthdir_y(RRT_R, th_begin - steering * 90 + _d_end), 1
			)
					
			if (_last_iter)
				break
			
			_d_start += gear * steering * _precision
			_d_end += gear * steering * _precision		
		}
	}
	
	/// @description Check collision using collision slider and given obstruction objects types
	/// @param {obj_ai_collision_slider} col_slider The collision slider to use to check collisions
	/// @returns {bool} Returns true if there is no collision, false otherwise
	/// @context AIRRTBranchArc
	collision_free = function(_col_slider) {
		//if (point_distance(x_end, y_end, _player_x, _player_y) < 3)
		//	return true
		
		_col_slider.x = x // put collision slider on end point
		_col_slider.y = y
		_col_slider.image_angle = th
		with (_col_slider) {
			for (var i = 0; i < array_length(obj_ai_topology.obstr_objects); i ++)
				if (place_meeting(x, y, obj_ai_topology.obstr_objects[i]))
					return false
		}
		
		return true
	}
		
	/// @description Recenter element on 3D coordinate
	/// @param {real} x The new x of the begin point of the element
	/// @param {real} y The new y of the begin point of the element
	/// @param {real} th The new th of the begin point of the element
	/// @context AIRRTBranchArc
	recenter = function(_x, _y, _th) {
		
		// Begin point
		x_begin = _x
		y_begin = _y
		th_begin = _th
	
		// End point
		compute_endpoint()
		
		for (var i = 0; i < ds_list_size(children); i ++)
			children[|i].recenter(x, y, th)
	
	}
	
}