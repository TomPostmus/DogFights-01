/// @description Gridcell tree update
event_inherited();

if (body_x == undefined || body_y == undefined || cost_field == undefined)
	exit
	
// Initialize tree
var _body_cell_i = floor(body_x / agrid_cell_size)
var _body_cell_j = floor(body_y / agrid_cell_size)
	
if (!root
	&& _body_cell_i >= 0 && _body_cell_i < ds_grid_width(agrid_grid)
	&& _body_cell_j >= 0 && _body_cell_j < ds_grid_height(agrid_grid)) {

	initialize(new AIGridCell4Neighbours(undefined, _body_cell_i, _body_cell_j)) // initialize tree with root element
	
}

// Grow or prune
repeat(3) {
	
	// choose whether to grow or prune
	var _agrid_size = ds_list_size(elements)
	var _prune_chance = max(0, (_agrid_size / agrid_max_size - 0.75) * 4) // random chance for pruning
	var _grow = _agrid_size < agrid_max_size || !irandom(1000 * (1 - _prune_chance)) == 0 // whether to prune grid
	
	// chose element to grow from, or prune, by powerlaw weighting
	var _chosen = ai_powerlaw_weighting(elements, _grow, 2)
	
	// grow or prune
	if (_chosen != undefined) {
	
		if (_grow) { // if grow
			
			explore_gridcell_8_neighbours(_chosen)
			
		} else { // if prune
			
			delete_element(_chosen)
			
		}
	
	}
}