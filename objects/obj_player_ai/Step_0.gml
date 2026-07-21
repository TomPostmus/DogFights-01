// (Dynamically) Define APF with cost function
// The Artificial Potential Field (APF) is simply a map from a position (x, y) to a cost, or a height (z) value if you consider it as a 2-manifold (3D object)
apf_costf = function(_x, _y) {
	var _cost = 0

	if (state == "explore")
		_cost += apf_explgrid_costf(_x, _y)

	return _cost
} // TODO: in-line function call? If function is called only once per step, having it be a function does not make sense

if (global.ingame() && instance_exists(character) && instance_exists(character.body)) {
	var body = character.body
	var weapon = character.weapon
	
	var _body_x = body.get_x()
	var _body_y = body.get_y()
	var _body_rot = body.get_rotation()
	
	// Update APF layer
	var _body_cell_i = ceil(_body_x / apf_explgrid_cell_size)
	var _body_cell_j = ceil(_body_y / apf_explgrid_cell_size)
	
	if (_body_cell_i >= 0 && _body_cell_i < ds_grid_width(apf_explgrid)
		&& _body_cell_j >= 0 && _body_cell_j < ds_grid_height(apf_explgrid)) {
	
		apf_explgrid[# _body_cell_i, _body_cell_j] = 0 // eat candy, set to zero
	
	}
	
	// Update A* Grid layer
	var _body_cell_i = ceil(_body_x / agrid_cell_size)
	var _body_cell_j = ceil(_body_y / agrid_cell_size)
	
	if (_body_cell_i >= 0 && _body_cell_i < ds_grid_width(agrid_grid)
		&& _body_cell_j >= 0 && _body_cell_j < ds_grid_height(agrid_grid)) {
			
		agrid_curcell ??= new agrid_cell(_body_cell_i, _body_cell_j) // if current cell not initialized, create cell with zero cost
	
		// choose whether to grow or prune
		var _agrid_size = ds_list_size(agrid_list)
		var _agrid_max_size = 50
		//var _prune_chance = max(0, (_agrid_size / _agrid_max_size - 0.5) * 2) // random chance for pruning
		var _prune = _agrid_size >= _agrid_max_size// || irandom(100 * _prune_chance) // whether to prune grid
	
		var _cost_min = infinity
		var _cost_max = -infinity
		for (var i = 0; i < _agrid_size; i ++) { // update costs and determine min and max costs
			var _cell = agrid_list[|i]
		
			var _cost = apf_costf(_cell.i * agrid_cell_size, _cell.j * agrid_cell_size)
			_cell.cost = _cost // update cost
				
			if (_cost < _cost_min) // define min and max S costs
				_cost_min = _cost
			if (_cost > _cost_max)
				_cost_max = _cost
		}
	
		var _chosen = undefined // chosen cell for exploration
		var _nr_open = ds_list_size(agrid_list_open) // number of open cells
	
		if (_nr_open == 1) { // if just one cell
		
			_chosen = agrid_list_open[|0] // choose that one
		
		} else if (_nr_open > 1) { // do power law weighting for choosing cell
	
			var _ws = array_create(_nr_open) // weights
			var _w_sum = 0 // sum of weights
			var _cost_range = _cost_max - _cost_min // range of cost (same for each cell)
			for (var i = 0; i < _nr_open; i ++) {
				var _cell = agrid_list_open[|i]
		
				var _cost_norm = 0.1 + 0.9 * (_cell.cost - _cost_min) / _cost_range // normalise in range of 0, 1
				if (!_prune)		
					_ws[i] = 1 / power(_cost_norm, 3) // power of cost (the higher the power, the stronger lower costs are favoured)
				else
					_ws[i] = power(_cost_norm, 3) // otherwise weight is inverse (the higher costs are favoured for pruning)
				_w_sum += _ws[i]
			}
	
			// choose cell randomly, weighted with cost
			var _rn = random(1) // draw random number within 0, 1
			var _acc = 0 // var that accumulates probabilities
			for (var i = 0; i < _nr_open; i ++) {
				var _p_i = _ws[i] / _w_sum // probability of branch i
				if (_rn >= _acc && _rn < _acc + _p_i) { // if _rn falls between weighted portion
					_chosen = agrid_list_open[|i] // choose this cell
					break
				}
				_acc += _p_i
			}
		
		}
	
		if (_chosen != undefined) { // if cell was chosen
		
			var _i = _chosen.i
			var _j = _chosen.j
	
			if (!_prune) { // if explore
				
				// Explore neighbours
				var _mp_grid = obj_ai_topology.grid
				if (mp_grid_get_cell(_mp_grid, _i+1, _j) != -1) // explore open cells to north, east, south, west of chosen cell
					agrid_grid[# _i+1, _j] ??= new agrid_cell(_i+1, _j)
				if (mp_grid_get_cell(_mp_grid, _i, _j+1) != -1)
					agrid_grid[# _i, _j+1] ??= new agrid_cell(_i, _j+1)
				if (mp_grid_get_cell(_mp_grid, _i-1, _j) != -1)
					agrid_grid[# _i-1, _j] ??= new agrid_cell(_i-1, _j)
				if (mp_grid_get_cell(_mp_grid, _i, _j-1) != -1)
					agrid_grid[# _i, _j-1] ??= new agrid_cell(_i, _j-1)
			
				_chosen.open = false
				var _list_i = ds_list_find_index(agrid_list_open, _chosen)
				ds_list_delete(agrid_list_open, _list_i) // remove from open list			
				
			} else { // if prune
	
				_chosen.destroy() // destroy cell

				// If there are closed neighbours, add them to open list
				if (agrid_grid[# _i+1, _j] != undefined && !agrid_grid[# _i+1, _j].open) {
					ds_list_add(agrid_list_open, agrid_grid[# _i+1, _j])
					agrid_grid[# _i+1, _j].open = true
				}			
				if (agrid_grid[# _i, _j+1] != undefined && !agrid_grid[# _i, _j+1].open) {
					ds_list_add(agrid_list_open, agrid_grid[# _i, _j+1])
					agrid_grid[# _i, _j+1].open = true
				}
				if (agrid_grid[# _i-1, _j] != undefined && !agrid_grid[# _i-1, _j].open) {
					ds_list_add(agrid_list_open, agrid_grid[# _i-1, _j])
					agrid_grid[# _i-1, _j].open = true
				}
				if (agrid_grid[# _i, _j-1] != undefined && !agrid_grid[# _i, _j-1].open) {
					ds_list_add(agrid_list_open, agrid_grid[# _i, _j-1])
					agrid_grid[# _i, _j-1].open = true
				}
			
			}
		}
	}
}