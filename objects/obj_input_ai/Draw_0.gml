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
	draw_set_colour(c_blue)	
	for (var i = 0; i < ds_list_size(rs_path); i ++) {
		var _p_elem = rs_path[|i] // loop through path elements
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