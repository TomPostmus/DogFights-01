// Run update timer
atree_update_counter --
var _update = false // whether to do Action tree update
if (atree_update_counter <= 0) {
	_update = true
	atree_update_counter = atree_update_time // reset update timer
}

if (instance_exists(player) && instance_exists(player.body)) {

	var _body_x = player.body.trunk.x
	var _body_y = player.body.trunk.y
	var _vision = player.vision

	// Initialize Action tree
	atree_curaction ??= new Action_root(id, _body_x, _body_y)
	
	// Grow or prune Action tree
	if (_update) {
		
		var _grow = true // TODO: implement pruning selection
		var _chosen = powerlaw_weighting(atree_list, _grow, 1) // choose Action based on powerlaw weighting of S costs
		
		if (_chosen) {
			
			// explore action node (add new nodes)
			if (!_chosen.inside_mission_area)
				new Action_enter_mission_area(id, _chosen, )
			
		}
	
	}

}