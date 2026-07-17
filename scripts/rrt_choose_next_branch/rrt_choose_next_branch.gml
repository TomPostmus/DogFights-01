// Choose next branch to walk
function rrt_choose_next_branch(){
	
	// Pick destination branch as branch with lowest cost value, and lower cost value than current RRT branch
	rrt_dest = undefined
	var _cost = rrt_branch.s_cost // cost of current RRT branch
	var _thresh = 0.0 // threshold below which lower cost is interesting
	for (var i = 0; i < ds_list_size(rrt_branches); i ++) { // loop through all branches
		var _branch = rrt_branches[|i]
			
		if (_branch.s_cost < _cost - _thresh) { // find branch with lowest z
			_cost = _branch.s_cost
			rrt_dest = _branch
		}
	}
		
	if (rrt_dest != undefined) { // if found destination branch
		
		var _next_branch = rrt_dest
		while (_next_branch.parent != rrt_branch) { // backtrack from destination until found current rrt branch
			_next_branch = _next_branch.parent
		}
						
		var _next_branch_i = ds_list_find_index(rrt_branch.links, _next_branch)
		ds_list_delete(rrt_branch.links, _next_branch_i) // decouple chosen branch from old branch, to avoid deleting the chosen branch along with deleting old branch
		rrt_mark_del(rrt_branch) // delete old branch
		rrt_branch = _next_branch
		rrt_branch.parent = undefined // new branch is root, so has no parent
		rrt_branch_completed = false
		rrt_walk_timer = rrt_walk_maxtime // reset timer
			
		var _g_cost_before = rrt_branch.g_cost // remember G cost before reset
		for (var i = 0; i < ds_list_size(rrt_branches); i ++) {				
			rrt_branches[|i].g_cost -= _g_cost_before // subtract G cost for every branch	
		}
			
	}
}