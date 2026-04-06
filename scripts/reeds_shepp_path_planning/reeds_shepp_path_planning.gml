#macro RS_STRAIGHT 0
#macro RS_LEFT 1
#macro RS_RIGHT -1
#macro RS_FORWARD 1
#macro RS_BACKWARD -1

// These are the Reeds Shepp path planning functions based on github code by nathanIct
// https://github.com/nathanlct/reeds-shepp-curves/blob/master/reeds_shepp.py
// I made some adaptations to make it work for GameMaker

// Struct object that encodes path element
// l is the length of the element in normalized reference frame (divided by _min_r, to get arcs of radius 1)
// steering the steering, 0 for straight, -1 for left, 1 for right
// gear is 1 for forwards gear or -1 for backward
function rs_path_element(_l, _steering, _gear) constructor {
	l = _l
	steering = _steering
	gear = _gear
	if (l < 0) { // in case of negative length, make positive and switch gear
		l *= -1
		gear *= -1 // reverse gear
	}
}

// The M function (keep summed angles within range of -pi, +pi) can be replaced with GMS function angle_difference, like so:
// M(th) = angle_difference(th, 0)

// The R function (computing polar coordinates) can be replaced with
// R(x, y) = r, th, where
	// r = point_distance(0, 0, x, y)
	// th = point_direction(0, 0, x, y)

// Given p1 = (x1, y1, theta1) and p2 = (x2, y2, theta2) represented in a
    //coordinate system with origin (0, 0) and rotation 0 (in degrees), return
    //the position and rotation of p2 in the coordinate system which origin
    //(x1, y1) and rotation theta1.
function rs_change_of_basis(_p1, _p2, _min_r) {
	var _diag_s = point_distance(_p1[0], _p1[1], _p2[0], _p2[1]) // diagonal distance from p1 to p2
	var _diag_ang = point_direction(_p1[0], _p1[1], _p2[0], _p2[1]) // angle of diagonal (line from p1 to p2) in world frame
	var _new_diag_ang = angle_difference(_diag_ang, _p1[2]) // diagonal angle in new (x1, y1, theta1) frame
	var _new_x = _diag_s * dcos(_new_diag_ang) / _min_r // x coordinate of p2 in (x1, y1, theta1) frame
	var _new_y = _diag_s * -dsin(_new_diag_ang) / _min_r // y coordinate of p2 (x1, y1, theta1) frame (mind that sin is inverted because game maker y-axis points down, whereas in math unit circle it points up)
	var _new_theta = _p2[2] - _p1[2] // th angle of p2 in (x1, y1, theta1) frame
	
	return [_new_x, _new_y, _new_theta]
}

// Reflect path, i.e. reverse steering for each element
function rs_reflect(_path) {
	var _refl_path = ds_list_create()
	for (var i = 0; i < ds_list_size(_path); i ++) {
		var _refl_elem = struct_copy(_path[|i])
		_refl_elem.steering *= -1
		ds_list_add(_refl_path, _refl_elem)
	}
	
	return _refl_path
}

// Reverse path, i.e. reverse gear for each element
function rs_reverse(_path) {
	var _rev_path = ds_list_create()
	for (var i = 0; i < ds_list_size(_path); i ++) {
		var _rev_elem = struct_copy(_path[|i])
		_rev_elem.gear *= -1
		ds_list_add(_rev_path, _rev_elem)
	}
	
	return _rev_path
}

// First path type: CSC
function rs_path_1(_x, _y, _th) {
	var _path = ds_list_create()
	
	var _u = point_distance(0, 0, _x + dsin(_th), _y - 1 + dcos(_th)) // length of straight
	var _t = point_direction(0, 0, _x + dsin(_th), _y - 1 + dcos(_th)) // turn angle first curve
	//_t = 360 - _t // convert to clockwise since we're using RIGHT turns as default
	_t = angle_difference(360 - _t, 0) // to clockwise and -180, 180 range
	
	//var _v = (360 - _th - _t) mod 360 // turn angle second curve
	//if (_v < 0) _v = 360 + _v // in gamemaker mod operation can still return negative number
	
	var _v = angle_difference(360 - _th, _t)
	
	_t = degtorad(_t) // convert angles to rad for knowing arc length
	_v = degtorad(_v)
	
	ds_list_add(_path, new rs_path_element(_t, RS_RIGHT, RS_FORWARD))
	ds_list_add(_path, new rs_path_element(_u, RS_STRAIGHT, RS_FORWARD))
	ds_list_add(_path, new rs_path_element(_v, RS_RIGHT, RS_FORWARD))
	
	return _path
}

// Second path type: CSC (opposite turns)
function rs_path_2(_x, _y, _th) {
	var _path = ds_list_create()

	var _rho = point_distance(0, 0, _x + dsin(_th), _y - 1 - dcos(_th))
	var _t1 = point_direction(0, 0, _x + dsin(_th), _y - 1 - dcos(_th))
	_t1 = angle_difference(360 - _t1, 0) // to clockwise and -180, 180 range
	
	if (sqr(_rho) >= 4) {
		var _u = sqrt(sqr(_rho) - 4)
		var _t = angle_difference(_t1 + arctan2(2, _u), 0)
		var _v = angle_difference(_t, 360 - _th)
	
		ds_list_add(_path, new rs_path_element(_t, RS_RIGHT, RS_FORWARD))
		ds_list_add(_path, new rs_path_element(_u, RS_STRAIGHT, RS_FORWARD))
		ds_list_add(_path, new rs_path_element(_v, RS_LEFT, RS_FORWARD))
	}
	
	return _path
}


// Straight line path element constructor in world frame
function rs_straight_element(_x, _y, _th, _l, _gear) constructor {
	x = _x // starting position of line in world
	y = _y
	th = _th // angle (orientation of line)
	l = _l // line length in pixels
	steering = 0 // no steering
	gear = _gear // forwards or backward arc
	
	x_end = x + lengthdir_x(gear * l, th) // end position of line
	y_end = y + lengthdir_y(gear * l, th)
	
	// Draw this line segment
	static draw = function() {
		draw_line(x, y, x_end, y_end)
	}
}

// Arc path element constructor in world frame
function rs_arc_element(_x, _y, _th, _l, _steering, _gear, _r) constructor {
	x = _x // starting position of arc in world
	y = _y
	th = _th // starting angle of arc
	l = _l // arc length in degrees (can be from 0 to 360)
	r = _r // arc radius
	steering = _steering // left or right steering
	gear = _gear // forwards or backward arc
	
	center_x = _x + lengthdir_x(_r, _th + _steering * 90) // center position of arc
	center_y = _y + lengthdir_y(_r, _th + _steering * 90) // either left or right from start pos (depending on left or right steering)
	
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
				center_x + lengthdir_x(r, th - steering * 90 + _d_start), // draw from center
				center_y + lengthdir_y(r, th - steering * 90 + _d_start),
				center_x + lengthdir_x(r, th - steering * 90 + _d_end),
				center_y + lengthdir_y(r, th - steering * 90 + _d_end)
			)
		
			if (_last_iter)
				break
			
			_d_start += gear * steering * _precision
			_d_end += gear * steering * _precision
		
		}
	
	}
}

// Compute Reeds Shepp path between 2 poses
// @param _start_p: the start pose (x, y, rot)
// @param _end_p: the start pose
// @param _min_r: minumum turning radius of Reeds Shepp car
function rs_optimal_path(_start_p, _end_p, _min_r){
	var _paths = ds_list_create() // list of possible paths
	//var _path_fns = [rs_path_1, rs_path_2, rs_path_3, rs_path_4,
	//				 rs_path_5, rs_path_6, rs_path_7, rs_path_8,
	//				 rs_path_9, rs_path_10, rs_path_11, rs_path_12] // array of 12 path type functions 
	var _path_fns = [rs_path_1]
	
	// Conversion to starting pose frame (normalized frame in starting pose)
	var _new_end_p = rs_change_of_basis(_start_p, _end_p, _min_r) // change basis of end, such that (0, 0, 0) is start
	var _x = _new_end_p[0]
	var _y = _new_end_p[1]
	var _th = _new_end_p[2]
	
	// Get four path variants for each path type
	ds_list_add(_paths,  _path_fns[0](_x, _y, _th))
	ds_list_add(_paths, rs_reflect(_path_fns[0](_x, -_y, -_th)))
	ds_list_add(_paths, rs_reverse(_path_fns[0](-_x, _y, -_th)))
	ds_list_add(_paths, rs_reflect(rs_reverse(_path_fns[0](-_x, -_y, _th))))
	
	// Remove empty paths
	for (var i = 0; i < ds_list_size(_paths); i ++) {
		if (ds_list_empty(_paths[|i])) {
			ds_list_delete(_paths, i)
			i --
		}
	}
	
	if (ds_list_empty(_paths)) // if no path found
		return undefined
	
	// Find optimal path
	var _optimal_path;
	var _d = infinity
	for (var i = 0; i < ds_list_size(_paths); i ++) {
		var _path = _paths[|i]
		var _path_d = 0
		for (var j = 0; j < ds_list_size(_path); j ++) // compute path length
			_path_d += _path[|j].l * _min_r // get path element length (unnormalized)
		
		if (_path_d < _d) {
			_d = _path_d
			_optimal_path = _path
		}
	}
	//_optimal_path = _paths[|irandom(ds_list_size(_paths)-1)] // choose random (test)
	
	// Clean up
	var _optimal_path_copy = ds_list_create()
	ds_list_copy(_optimal_path_copy, _optimal_path)
	for (var i = 0; i < ds_list_size(_paths); i ++) {
		ds_list_destroy(_paths[|i]) // destroy path lists
	}
	
	// Conversion to world frame
	_x = _start_p[0] // start at start pose
	_y = _start_p[1]
	_th = _start_p[2]
	var _world_path = ds_list_create()
	for (var i = 0; i < ds_list_size(_optimal_path_copy); i ++) {
		var _p_elem = _optimal_path_copy[|i]
		if (_p_elem.steering == RS_STRAIGHT) {
			var _l = _p_elem.l * _min_r // length of line element
			var _p_world_elem = new rs_straight_element(_x, _y, _th, _l, _p_elem.gear) // create world element
			_x += lengthdir_x(_p_elem.gear * _l, _th)
			_y += lengthdir_y(_p_elem.gear * _l, _th)
			ds_list_add(_world_path, _p_world_elem)
		} else {
			var _l = radtodeg(_p_elem.l)
			var _p_world_elem = new rs_arc_element(_x, _y, _th, _l, _p_elem.steering, _p_elem.gear, _min_r)
			_x = _p_world_elem.center_x + lengthdir_x(_min_r, _th - _p_elem.steering * 90 + _p_elem.gear * _p_elem.steering * _p_world_elem.l) // end position of arc
			_y = _p_world_elem.center_y + lengthdir_y(_min_r, _th - _p_elem.steering * 90 + _p_elem.gear * _p_elem.steering * _p_world_elem.l)
			_th += _p_elem.gear * _p_elem.steering * _p_world_elem.l // end angle of arc
			ds_list_add(_world_path, _p_world_elem)
		}
	}
	ds_list_destroy(_optimal_path_copy)
	
	return _world_path
}