#macro RS_STRAIGHT 0
#macro RS_LEFT 1
#macro RS_RIGHT -1
#macro RS_FORWARD 1
#macro RS_BACKWARD -1

// Struct object that encodes path element
// l is the length of the element in normalized reference frame (divided by _min_r, to get arcs of radius 1)
// steering the steering, 0 for straight, -1 for left, 1 for right
// gear is 1 for forwards gear or -1 for backward
function rs_path_element(_l, _steering, _gear) constructor {
	l = _l
	steering = _steering
	gear = _gear
	if (l < 0) // in case of negative length, make positive and switch gear
		l *= -1
		gear *= -1 // reverse gear
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

// First path type: CSC
function rs_path_1(_x, _y, _th) {
	var _path = ds_list_create()
	
	var _u = point_distance(0, 0, _x - dsin(_th), _y + 1 - dcos(_th)) // length of straight
	var _t = point_direction(0, 0, _x - dsin(_th), _y + 1 - dcos(_th)) // turn angle first curve
	var _v = angle_difference(_th, _t) // turn angle second curve
	_t = degtorad(_t) // convert angles to rad for knowing arc length
	_v = degtorad(_v)
	
	ds_list_add(_path, new rs_path_element(_t, RS_LEFT, RS_FORWARD))
	ds_list_add(_path, new rs_path_element(_u, RS_STRAIGHT, RS_FORWARD))
	ds_list_add(_path, new rs_path_element(_v, RS_LEFT, RS_FORWARD))
	
	return _path
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
	
	var _new_end_p = rs_change_of_basis(_start_p, _end_p, _min_r) // change basis of end, such that (0, 0, 0) is start
	var _x = _new_end_p[0]
	var _y = _new_end_p[1]
	var _th = _new_end_p[2]
	
	// Get four path variants for each path type
	ds_list_add(_paths, _path_fns[0](_x, _y, _th))
	
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
	
	// Clean up
	var _optimal_path_copy = ds_list_create()
	ds_list_copy(_optimal_path_copy, _optimal_path)
	for (var i = 0; i < ds_list_size(_paths); i ++) {
		ds_list_destroy(_paths[|i]) // destroy path lists
	}
	
	return _optimal_path_copy
}