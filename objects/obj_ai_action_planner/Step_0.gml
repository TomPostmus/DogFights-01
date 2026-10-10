event_inherited()

// Run update timer
// TODO: use built-in GM timer?
update_counter --
var _update = false // whether to do Action tree update
if (update_counter <= 0) {
	_update = true
	update_counter = update_frames // reset
}

if (instance_exists(player) && instance_exists(player.character) && instance_exists(player.character.body)) {

	var _vision = player.vision
	var _character = player.character
	var _weapon = _character.weapon
	var _body_x = _character.body.trunk.x
	var _body_y = _character.body.trunk.y
	
	
	// Initialize Action tree
	if (!root) {
		
		var _wstate_init = new WholeState()
		_wstate_init.hp = _character.hp
		ds_list_copy(_wstate_init.pois, _vision.pois)
		// TODO: make function for computing WholeState based on current player state?
		
		initialize(new AIActionRoot(_body_x, _body_y, _wstate_init)) // initialise with root based on initial whole state
		
	}
		
	
	if (_update) {
		
		// TODO Issue-001: regulary update root WholeState
		
			// compute defense power based on current weapon state
			//if (instance_exists(_weapon))  // if has weapon
			//	wstate.defense_power = compute_defense_power(_weapon, _character.hp_max) // compute defense power using weapon and own character's hp_max
			//else
			//	wstate.defense_power = 0
	
			// compute social health based on player's current position
			//wstate.social_health = compute_social_energy(_body_x, _body_y, _vision.teammates, _vision.enemies)
	
		
		// Grow or prune Action tree
		var _grow = true // TODO: implement pruning selection
		var _chosen = ai_powerlaw_weighting(elements, _grow, 1) // choose Action based on powerlaw weighting of S costs
		
		if (_chosen) {
			
			// explore action node (add new nodes)
			for (var i = 0; i < ds_list_size(_chosen.pois); i ++) {
				var _poi = _chosen.pois[|i]
				
				if (_poi.type == AIPOI_TYPE.LANDMARK) {
					var _action = new AIActionInspectLandmark(id, _chosen, _poi.x, _poi.y)
				}
					
				
			}
			
		}
	
	}

}