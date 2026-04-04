//if (instance_exists(player) && instance_exists(player.body)) {
//	var xp = player.body.get_x()
//	var yp = player.body.get_y()
		
//	if (path != undefined && path_exists(path)) {
//		draw_set_colour(c_blue)
//		draw_path(path, 0, 0, true)
//		draw_set_colour(c_green)
//		draw_line(xp, yp, path_get_point_x(path, path_point), path_get_point_y(path, path_point))
//	}

//	if (instance_exists(target)) {
//		draw_set_colour(c_red)
//		draw_line(xp, yp, target.get_x(), target.get_y())
//	}
	
//	draw_text(xp, yp + 20, "Conflict: " + string(conflict))
//	draw_text(xp, yp + 40, "FoF: " + fight_or_flight)
//}

// Draw RS path
if (rs_path != undefined) {
	var _x = rs_start[0]
	var _y = rs_start[1]
	var _th = rs_start[2]
	
	draw_set_colour(c_blue)	
	for (var i = 0; i < ds_list_size(rs_path); i ++) {
		var _p_elem = rs_path[|i] // loop through path elements
		if (_p_elem.steering == RS_STRAIGHT) { // draw straight line
			var _l = _p_elem.l * rs_min_r
			var _x_end = _x + lengthdir_x(_l, _th) // end position of line
			var _y_end = _y + lengthdir_y(_l, _th)
			draw_line(_x, _y, _x_end, _y_end)
			_x = _x_end // move to end of line
			_y = _y_end
		} else { // draw arc with steering
			var _th_end = _th +  radtodeg(_p_elem.l)
			var _end_pos = draw_arc(_x, _y, _th, _th_end, rs_min_r, _p_elem.steering)
			_x = _end_pos[0]
			_y = _end_pos[1]
			_th = _th_end
		}
	}
	
	draw_set_colour(c_purple)
	draw_circle(rs_start[0], rs_start[1], 4, true) // draw start and end poses
	draw_line(rs_start[0], rs_start[1], 
			  rs_start[0] + lengthdir_x(4, rs_start[2]), rs_start[1] + lengthdir_y(4, rs_start[2]))
	draw_circle(rs_target[0], rs_target[1], 4, true)
	draw_line(rs_target[0], rs_target[1], 
			  rs_target[0] + lengthdir_x(4, rs_target[2]), rs_target[1] + lengthdir_y(4, rs_target[2]))
}