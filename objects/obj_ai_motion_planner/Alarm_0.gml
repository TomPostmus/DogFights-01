/// @description RRT update
event_inherited();

if (sm_state != "explore" && sm_state != "optimize")
	exit // only grow tree in explore and optimize states

if (body_x == undefined || body_y == undefined || body_th == undefined || cost_field == undefined)
	exit
	
if (!root)
	initialize(new AIRRTBranchRoot(body_x, body_y, body_th))
	
// Grow or prune
repeat(3) {
	
	// choose whether to grow or prune
	var _agrid_size = ds_list_size(elements)
	var _prune_chance = max(0, (_agrid_size / rrt_max_size - 0.75) * 4) // random chance for pruning
	var _grow = _agrid_size < rrt_max_size || !irandom(100 * (1 - _prune_chance)) == 0 // whether to prune grid
	
	// chose element to grow from, or prune, by powerlaw weighting
	var _chosen = ai_powerlaw_weighting(elements, _grow, 2)
	
	// grow or prune
	if (_chosen != undefined) {
	
		if (_grow) { // if grow
			
			explore_branch(_chosen)
			
		} else { // if prune
			
			delete_element(_chosen)
			
		}
	
	}
}