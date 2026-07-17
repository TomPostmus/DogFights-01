// (Re)compute cost properties for branches
function rrt_update_costs(){

	for (var i = 0; i < ds_list_size(rrt_branches); i ++) {
		var _branch = rrt_branches[|i]
							
		var _field_vars = rrt_field(_branch.x_end, _branch.y_end, _branch.th_end)
		_branch.mani_z = _field_vars[0]
		_branch.mani_tang_x = _field_vars[1]
		_branch.mani_tang_y = _field_vars[2]
		//_branch.mani_slope = _field_vars[3]
		
		// compute average spatial properties of near branches
		var _avg_radius = 50 // distance within which to compute averages
		var _avg_x = 0; var _avg_y = 0; var _avg_th = 0 // average x, y, th of branches within radius
		var _obranch_count = 0 // how many other branches we are computing average for
		for (var j = 0; j < ds_list_size(rrt_branches); j ++) {
			var _obranch = rrt_branches[|j] // other branch
		
			if (_obranch == _branch) // if same branch, skip iteration
				continue						
					
			if (point_distance(_branch.x_end, _branch.y_end, _obranch.x_end, _obranch.y_end) < _avg_radius) {
				_avg_x += _obranch.x_end
				_avg_y += _obranch.y_end
				_avg_th += _obranch.th_end
				_obranch_count ++
			}
		}
		
		var _avg_dist = 0
		var _avg_ang_dist = 0
		if (_obranch_count > 0) {
			_avg_x /= _obranch_count // divide by count to define average
			_avg_y /= _obranch_count
			_avg_th /= _obranch_count
			_avg_dist = point_distance(_branch.x_end, _branch.y_end, _avg_x, _avg_y)
			_avg_ang_dist = abs(angle_difference(_branch.th_end, _avg_th))
		}
				
		// _branch.mani_z * 300 + max(-_branch.g_cost, -10) + max(_branch.g_cost-10, 0) -
		_branch.s_cost = (0.5 + (1 - rrt_exp) * 0.5) * (_branch.mani_z) - (0.2 + rrt_exp * 0.8) * (5 * _avg_dist + 0.5 * _avg_ang_dist) + 1.5 * _branch.g_cost
		
	}
}