if (body_x != undefined && body_y != undefined && cost_field != undefined) { // check if received inputs from player

	// Update A* Grid
	var _body_cell_i = floor(body_x / agrid_cell_size)
	var _body_cell_j = floor(body_y / agrid_cell_size)
	
	if (_body_cell_i >= 0 && _body_cell_i < ds_grid_width(agrid_grid)
		&& _body_cell_j >= 0 && _body_cell_j < ds_grid_height(agrid_grid)) {
			
		agrid_curcell ??= new agrid_cell(_body_cell_i, _body_cell_j) // if current cell not initialized, create cell
		
		// If location changed, move curcell to new location
		if (_body_cell_i != agrid_curcell.i || _body_cell_j != agrid_curcell.j) { // if location different than that from current cell
		
			agrid_curcell = agrid_grid[# _body_cell_i, _body_cell_j] // set current cell as grid cell at new location
			agrid_curcell ??= new agrid_cell(_body_cell_i, _body_cell_j) // if there is no grid cell there, create one
		
		}
	
		// Update G costs
		{
			
			var _open_cells = ds_list_create() // list keeping track of open cells used for recursive traversal of A* Grid
			var _closed_cells = ds_list_create() // cells already traversed
			ds_list_add(_open_cells, agrid_curcell) // initialize open list with current cell
		
			for (var i = 0; i < ds_list_size(agrid_list); i ++) // set G costs of all cells to undefined
				agrid_list[|i].g_cost = undefined		
			agrid_curcell.g_cost = 0 // set G cost if current cell to 0
		
			// traverse A* Grid, starting from current cell, and updating G costs
			while (ds_list_size(_open_cells) > 0) {
				var _curcell = _open_cells[|0] // pop current cell from 1st postion of list
				ds_list_delete(_open_cells, 0)
			
				var _i = _curcell.i
				var _j = _curcell.j
			
				var _east = _i < ds_grid_width(agrid_grid) ? agrid_grid[# _i+1, _j] : undefined
				var _south = _j < ds_grid_height(agrid_grid) ? agrid_grid[# _i, _j+1] : undefined
				var _west = _i >= 0 ? agrid_grid[# _i-1, _j] : undefined
				var _north = _j >= 0 ? agrid_grid[# _i, _j-1] : undefined
			
				// explore neighbors
				if (_east != undefined && ds_list_find_index(_open_cells, _east) == -1
					&& ds_list_find_index(_closed_cells, _east) == -1) { // if east exists in A* Grid and is not in open, nor closed set
					_east.g_cost = _curcell.g_cost + agrid_cell_size // increment by 1 cell distance
					ds_list_add(_open_cells, _east)
				}
				if (_south != undefined && ds_list_find_index(_open_cells, _south) == -1
					&& ds_list_find_index(_closed_cells, _south) == -1) {
					_south.g_cost = _curcell.g_cost + agrid_cell_size
					ds_list_add(_open_cells, _south)
				}
				if (_west != undefined && ds_list_find_index(_open_cells, _west) == -1
					&& ds_list_find_index(_closed_cells, _west) == -1) {
					_west.g_cost = _curcell.g_cost + agrid_cell_size
					ds_list_add(_open_cells, _west)
				}
				if (_north != undefined && ds_list_find_index(_open_cells, _north) == -1
					&& ds_list_find_index(_closed_cells, _north) == -1) {
					_north.g_cost = _curcell.g_cost + agrid_cell_size
					ds_list_add(_open_cells, _north)
				}
			
				ds_list_add(_closed_cells, _curcell) // current cell was explored, add to closed set
			}
		
			ds_list_destroy(_open_cells)
			ds_list_destroy(_closed_cells)
		
			// remove parts that were unexplored because they are unconnected
			for (var i = 0; i < ds_list_size(agrid_list); i ++) {
				var _cell = agrid_list[|i]
			
				if (_cell.g_cost == undefined) {
					_cell.destroy()
					i --
				}
			}
		
		}
		
		// Update H cost and S cost
		for (var i = 0; i < ds_list_size(agrid_list); i ++) {
			var _cell = agrid_list[|i]
			
			_cell.h_cost = cost_field(_cell.i * agrid_cell_size, _cell.j * agrid_cell_size) // update heuristic cost from cost field
			_cell.s_cost = _cell.g_cost + _cell.h_cost // update S cost
		}
	
		// Grow or prune grid
		{
			
			// choose whether to grow or prune
			var _agrid_size = ds_list_size(agrid_list)
			var _prune_chance = max(0, (_agrid_size / agrid_max_size - 0.75) * 4) // random chance for pruning
			var _prune = _agrid_size >= agrid_max_size || irandom(1000 * (1 - _prune_chance)) == 0 // whether to prune grid
	
			var _nr_open = ds_list_size(agrid_list_open) // number of open cells
			
			var _cost_min = infinity
			var _cost_max = -infinity
			for (var i = 0; i < _nr_open; i ++) { // update costs and determine min and max costs
				var _cell = agrid_list_open[|i]
		
				var _s_cost = _cell.s_cost
				
				if (_s_cost < _cost_min) // define min and max S costs
					_cost_min = _s_cost
				if (_s_cost > _cost_max)
					_cost_max = _s_cost
			}
	
			var _chosen = undefined // chosen cell for exploration
	
			if (_nr_open == 1) { // if just one cell
		
				_chosen = agrid_list_open[|0] // choose that one
		
			} else if (_nr_open > 1) { // do power law weighting for choosing cell
	
				var _ws = array_create(_nr_open) // weights
				var _w_sum = 0 // sum of weights
				var _cost_range = _cost_max - _cost_min // range of cost (same for each cell)
				for (var i = 0; i < _nr_open; i ++) {
					var _cell = agrid_list_open[|i]
		
					var _cost_norm = 0.1 + 0.9 * (_cell.s_cost - _cost_min) / _cost_range // normalise in range of 0.1, 1
					if (!_prune)		
						_ws[i] = 1 / power(_cost_norm, 2) // power of cost (the higher the power, the stronger lower costs are favoured)
					else
						_ws[i] = power(_cost_norm, 2) // otherwise weight is inverse (the higher costs are favoured for pruning)
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
				
				} else if (_chosen != agrid_curcell) { // if prune and chosen is not the current cell the player is standing at
	
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
		
		// Find minimal cost node, and compute path to that node
		{
		
			// find destination cell
			var _destination = agrid_curcell // destination cell
			var _min_cost = infinity
			for (var i = 0; i < ds_list_size(agrid_list); i ++) {
				var _cell = agrid_list[|i]
				
				if (_cell.h_cost == undefined) // if newly added cell, heuristic cost is not defined yet
					continue // skip
				
				var _s_cost = _cell.h_cost
				
				if (_s_cost < _min_cost) {
					_destination = _cell
					_min_cost = _s_cost
				}
			}
			
			// compute path
			ds_list_clear(agrid_path) // clear path
			var _next_cell = _destination // start backtracking from destination
			ds_list_add(agrid_path, _next_cell) // add destination to path
			while (_next_cell != agrid_curcell) {
				var _i = _next_cell.i
				var _j = _next_cell.j
				
				var _east = _i < ds_grid_width(agrid_grid) ? agrid_grid[# _i+1, _j] : undefined
				var _south = _j < ds_grid_height(agrid_grid) ? agrid_grid[# _i, _j+1] : undefined
				var _west = _i >= 0 ? agrid_grid[# _i-1, _j] : undefined
				var _north = _j >= 0 ? agrid_grid[# _i, _j-1] : undefined
				
				// find neighbour with least G cost
				var _min_cost = infinity
				var _orientation = undefined // orientation (in degrees) of cell in path
				_next_cell = undefined
				if (_east != undefined && _east.g_cost != undefined && _east.g_cost < _min_cost && ds_list_find_index(agrid_path, _east) == -1) {
					_min_cost = _east.g_cost
					_next_cell = _east
					//_orientation = 180 // orientation opposite of east (we're going backwards constructing path)
				}
				if (_south != undefined && _south.g_cost != undefined && _south.g_cost < _min_cost && ds_list_find_index(agrid_path, _south) == -1) {
					_min_cost = _south.g_cost
					_next_cell = _south
				}
				if (_west != undefined && _west.g_cost != undefined && _west.g_cost < _min_cost && ds_list_find_index(agrid_path, _west) == -1) {
					_min_cost = _west.g_cost
					_next_cell = _west
				}
				if (_north != undefined && _north.g_cost != undefined && _north.g_cost < _min_cost && ds_list_find_index(agrid_path, _north) == -1) {
					_min_cost = _north.g_cost
					_next_cell = _north
				}
				
				if (_next_cell == undefined) 
					break
					//show_error("Path from destination cell to current cell could not be found.", true)
					
				ds_list_add(agrid_path, _next_cell) // add least cost neighbour to path and continue looping from there
				//_next_cell.orientation = _orientation // set orientation
				
			}
		
		}
		
		// Define cost field for RRT layer
		cost_field_rrt = undefined // reset
		if (ds_list_size(agrid_path) > 0) {
		
			cost_field_rrt = function(_x, _y, _th) { // compute cost based on 3D position
				
				//var _cost = 0
				
				var _least_distance = infinity
				var _nearest_cell
				for (var i = 0; i < ds_list_size(agrid_path); i ++) {
					var _cell = agrid_path[|i]
					
					var _cell_x = (_cell.i + 0.5) * agrid_cell_size // x, y coordinates of center of cell
					var _cell_y = (_cell.j + 0.5) * agrid_cell_size
					
					var _dist = point_distance(_x, _y, _cell_x, _cell_y)
					if (_dist < _least_distance) {
						_least_distance = _dist
						_nearest_cell = _cell
					}
				}
				
				//_cost += 
				
				// compute cost as distance to nearest path cell plus path cost of that cell, plus angle difference with orientation
				var _p_cost = (ds_list_size(agrid_path) - _nearest_cell.g_cost) * agrid_cell_size // path cost of nearest cell is path length minus G cost
				return _least_distance + _p_cost// + 50 * (1 - dcos(angle_difference(_th, _nearest_cell.orientation)))
			
			}
		
		}
	}
	
}