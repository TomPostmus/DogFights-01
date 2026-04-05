if (instance_exists(player) && instance_exists(player.body)) {
	if (rs_path != undefined)
		ds_list_destroy(rs_path) // destroy old list
	
	rs_start = [player.body.get_x(), player.body.get_y(), player.body.get_rotation()]
	rs_target = [mouse_x, mouse_y, 0]
	rs_path = rs_optimal_path(rs_start, rs_target, rs_min_r)
}