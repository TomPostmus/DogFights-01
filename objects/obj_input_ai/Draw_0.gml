if (!global.debug)
	exit

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
	//draw_text(xp, yp + 40, $"move_input: {move_input}")

	// Draw A* river around player (not everything to reduce drawing computational load)
	//if (astriver != undefined) {
	//	var c = holpath_cell_size
	//	var r = 10 // how many cells around player to draw
	//	var _plr_cell_x = floor(xp / holpath_cell_size) // the player cell x,y indices
	//	var _plr_cell_y = floor(yp / holpath_cell_size)
	//	draw_set_colour(c_blue)
	//	for (var _cell_x = _plr_cell_x - r; _cell_x <= _plr_cell_x + r; _cell_x ++) { // loop through kernel around source point
	//		for (var _cell_y = _plr_cell_y - r; _cell_y <= _plr_cell_y + r; _cell_y ++) {
	//			if (ds_map_exists(astriver, _cell_y) && ds_map_exists(astriver[?_cell_y], _cell_x)) {
	//				var _th = astriver[?_cell_y][?_cell_x]
	//				var _cell_pt_x = (_cell_x + 0.5) * c
	//				var _cell_pt_y = (_cell_y + 0.5) * c
	//				//var xp = player.body.get_x()
	//				//var yp = player.body.get_y()
	//				//draw_rectangle(_row * c, _col * c, (_row + 1) * c, (_col + 1) * c, false)
	//				draw_arrow(_cell_pt_x, _cell_pt_y, _cell_pt_x + lengthdir_x(5, _th), _cell_pt_y + lengthdir_y(5, _th), 2)
	//			}
	//		}
	//	}
	//}
	
	// Draw RRT* tree
	draw_set_colour(c_blue)
	for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
		var _branch = rrt_branches[|i]
		_branch.draw()
	}
	
	if (rrt_test_pt != undefined) {
		draw_set_colour(c_lime)
		draw_circle(rrt_test_pt[0], rrt_test_pt[1], 1, false)
	}

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

// Draw collision slider
with (colslider) draw_self()