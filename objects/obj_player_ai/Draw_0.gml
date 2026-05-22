if (!global.debug)
	exit

// Draw target and state
if (instance_exists(character) && instance_exists(character.body)) {
	var xp = character.body.get_x()
	var yp = character.body.get_y()

//	if (instance_exists(target)) {
//		draw_set_colour(c_red)
//		draw_line(xp, yp, target.get_x(), target.get_y())
//	}
	
//	draw_text(xp, yp + 20, "Conflict: " + string(conflict))
	//draw_text(xp, yp + 40, "FoF: " + fight_or_flight)
	//draw_text(xp, yp + 40, $"move_input: {move_input}")
	
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
	
	draw_set_colour(c_red)
	for (var i = 0; i < ds_list_size(rrt_open_branches); i ++) {
		var _branch = rrt_open_branches[|i]
		draw_circle(_branch.x_end, _branch.y_end, 1, false) // draw red circles at end points of open branches
	}

}

// Draw A* path
if (astpath != undefined && path_exists(astpath)) {
	draw_set_colour(c_purple)
	draw_path(astpath, 0, 0, true)
	draw_set_colour(c_red)
	var _path_pt_x = path_get_point_x(astpath, astpath_point)
	var _path_pt_y = path_get_point_y(astpath, astpath_point)
	draw_circle(_path_pt_x, _path_pt_y, 1, false)
	draw_set_colour(c_green)
	var _path_pt_x = path_get_point_x(astpath, astpath_furthvis_point)
	var _path_pt_y = path_get_point_y(astpath, astpath_furthvis_point)
	draw_circle(_path_pt_x, _path_pt_y, 1, false)
	
	//for (var i = 0; i < path_get_number(astpath); i ++) {
	//	var _path_pt_x = path_get_point_x(astpath, i)
	//	var _path_pt_y = path_get_point_y(astpath, i)
		
	//	draw_text(_path_pt_x, _path_pt_y, astpath_costs[|i])
	//}
	
	//draw_set_colour(c_green)
	//draw_line(xp, yp, path_get_point_x(path, path_point), path_get_point_y(path, path_point))
}

// Draw collision slider
with (colslider) draw_self()