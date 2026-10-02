// Run update timer
atree_update_counter --
var _update = false // whether to do Action tree update
if (atree_update_counter <= 0) {
	_update = true
	atree_update_counter = atree_update_time // reset update timer
}

if (instance_exists(player) && instance_exists(player.character) && instance_exists(player.character.body)) {

	var _body_x = player.body.trunk.x
	var _body_y = player.body.trunk.y
	var _vision = player.vision
	var _character = player.character
	var _weapon = player.character.weapon
	
	// Update current Wellness State of player	
	if (_update) {
		
		wstate.hp = _character.hp
	
		// compute defense power based on current weapon state
		if (instance_exists(_weapon))  // if has weapon
			wstate.defense_power = compute_defense_power(_weapon, _character.hp_max) // compute defense power using weapon and own character's hp_max
		else
			wstate.defense_power = 0
	
		// compute social health based on player's current position
		wstate.social_health = compute_social_energy(_body_x, _body_y, _vision.teammates, _vision.enemies)
	
	}
	
	// Initialize Action tree
	atree_curaction ??= new Action_root(id, _body_x, _body_y)
	
	// Grow or prune Action tree
	if (_update) {
		
		var _grow = true // TODO: implement pruning selection
		var _chosen = powerlaw_weighting(atree_list, _grow, 1) // choose Action based on powerlaw weighting of S costs
		
		if (_chosen) {
			
			// explore action node (add new nodes)
			if (!_chosen.inside_mission_area) {
				// TODO: implement
			} else {
			
				for (var i = 0; i < ds_list_size(_vision.landmarks); i ++) {
					var _poi = _vision.landmarks[|i]
					
					new Action_inspect_landmark(id, _chosen, _poi.x, _poi.y)
				}
			
			}
			
		}
	
	}

}