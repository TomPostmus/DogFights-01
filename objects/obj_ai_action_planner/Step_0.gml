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
	
	if (_update) {
		
		// Update current Progress state of player
		pstate.hp = player.hp // the current 'progress state' of the player
		pstate.defpower = compute_defpower()
		pstate.sochealth = compute_social_health(_body_x, _body_y)		

		// Initialize Action tree
		atree_curaction ??= new Action_root(id, _body_x, _body_y)
	
	}
	
	// Grow or prune Action tree
	if (_update) {
		
		var _grow = true // TODO: implement pruning selection
		var _chosen = powerlaw_weighting(atree_list, _grow, 1) // choose Action based on powerlaw weighting of S costs
		
		if (_chosen) {
			
			// explore action node (add new nodes)
			if (!_chosen.inside_mission_area) {
				new Action_enter_mission_area(id, _chosen, )
			} else {
			
				for (var i = 0; i < ds_list_size(_vision.landmarks); i ++) {
					var _poi = _vision.landmarks[|i]
					
					new Action_inspect_landmark(id, _chosen, _poi.x, _poi.y)
				}
			
			}
			
		}
	
	}

}