/// @description Action tree update
event_inherited();

if !(instance_exists(player) && instance_exists(player.character) && instance_exists(player.character.body))
	exit

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
			
	// Explore Action node (add new nodes)
	for (var i = 0; i < ds_list_size(_chosen.expected_wstate.pois); i ++) {
		var _poi = _chosen.expected_wstate.pois[|i]
				
		// check if Action based on POI hasn't already been added
		var _exists_in_children = false
		for (var j = 0; j < ds_list_size(_chosen.children); j ++)
			if (_chosen.children[|j].inst == _poi.inst)
				_exists_in_children = true
		if (_exists_in_children)
			continue // later, I might merge POIs and Action, such that 
				// only ds_list_find_value(_chosen.children, _action) != -1 needs to be done.
				
		if (_poi.type == AIPOI_TYPE.LANDMARK && _poi.novelty_flag) { // for new landmark
			var _action = new AIActionInspectLandmark(_chosen, _poi.x, _poi.y, _poi.inst)
			add_element(_action) // add to tree
		}
				
	}
			
}