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
