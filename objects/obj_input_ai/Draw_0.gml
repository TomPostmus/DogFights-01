// Draw target and state
if (instance_exists(player) && instance_exists(player.body)) {
	var xp = player.body.get_x()
	var yp = player.body.get_y()

//	if (instance_exists(target)) {
//		draw_set_colour(c_red)
//		draw_line(xp, yp, target.get_x(), target.get_y())
//	}
	
//	draw_text(xp, yp + 20, "Conflict: " + string(conflict))
//	draw_text(xp, yp + 40, "FoF: " + fight_or_flight)
	draw_text(xp, yp + 40, $"Holpath_pt: {holpath_point}")
}


// Draw holonomic path
if (holpath != undefined && path_exists(holpath)) {
	draw_set_colour(c_green)
	draw_path(holpath, 0, 0, true)
	//draw_set_colour(c_green)
	//draw_line(xp, yp, path_get_point_x(path, path_point), path_get_point_y(path, path_point))
}

// Draw RS path
if (rs_path != undefined) {	
	for (var i = 0; i < ds_list_size(rs_path); i ++) {
		var _p_elem = rs_path[|i] // loop through path elements
		
		if (i == rs_path_elem_i) draw_set_colour(c_lime) // highlight active path element with lime green
		else draw_set_colour(c_blue)	
		
		_p_elem.draw()
	}
	
	draw_set_colour(c_purple)
	draw_circle(rs_start[0], rs_start[1], 4, true) // draw start and end poses
	draw_line(rs_start[0], rs_start[1], 
			  rs_start[0] + lengthdir_x(4, rs_start[2]), rs_start[1] + lengthdir_y(4, rs_start[2]))
	draw_circle(rs_target[0], rs_target[1], 4, true)
	draw_line(rs_target[0], rs_target[1], 
			  rs_target[0] + lengthdir_x(4, rs_target[2]), rs_target[1] + lengthdir_y(4, rs_target[2]))
}