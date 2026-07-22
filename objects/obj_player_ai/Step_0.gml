// (Dynamically) Define APF with cost function
// The Artificial Potential Field (APF) is simply a map from a position (x, y) to a cost, or a height (z) value if you consider it as a 2-manifold (3D object)
apf_costf = function(_x, _y) {
	var _cost = 0

	_cost += apf_social_costf(_x, _y)
	
	if (state == "explore")
		_cost += apf_explgrid_costf(_x, _y)

	return _cost
} // TODO: in-line function call? If function is called only once per step, having it be a function does not make sense

if (global.ingame() && instance_exists(character) && instance_exists(character.body)) {
	var _body = character.body
	var _weapon = character.weapon
	
	var _body_x = _body.get_x()
	var _body_y = _body.get_y()
	var _body_rot = _body.get_rotation()
	
	// Update APF layer
	{
		
		// update social layer with enemies
		var _camera_x = camera.x
		var _camera_y = camera.y
		var _camera_w = camera.get_width()
		var _camera_h = camera.get_height()
		ds_list_clear(apf_enemies) // reset/clear list
		with (obj_character) {
			if (self != other.character && instance_exists(body) && instance_exists(body.trunk)
				&& (other.character.team_id == undefined || other.character.team_id != team_id)
				&& !hp_protection) {						
				if (point_in_rectangle(body.trunk.x, body.trunk.y, 
					_camera_x - _camera_w/2, _camera_y - _camera_h/2,
					_camera_x + _camera_w/2, _camera_y + _camera_h/2)) {
					ds_list_add(other.apf_enemies, body.trunk) // add trunk (being the target object) to enemy list
				}
			}
		}
		
		// update exploration layer
		var _body_cell_i = ceil(_body_x / apf_explgrid_cell_size)
		var _body_cell_j = ceil(_body_y / apf_explgrid_cell_size)
	
		if (_body_cell_i >= 0 && _body_cell_i < ds_grid_width(apf_explgrid)
			&& _body_cell_j >= 0 && _body_cell_j < ds_grid_height(apf_explgrid)) {
	
			apf_explgrid[# _body_cell_i, _body_cell_j] = 0 // eat candy, set to zero
	
		}
		
	}
	
	// Update A* Grid layer
	var _body_cell_i = ceil(_body_x / agrid_cell_size)
	var _body_cell_j = ceil(_body_y / agrid_cell_size)
	
	if (_body_cell_i >= 0 && _body_cell_i < ds_grid_width(agrid_grid)
		&& _body_cell_j >= 0 && _body_cell_j < ds_grid_height(agrid_grid)) {
			
		agrid_curcell ??= new agrid_cell(_body_cell_i, _body_cell_j) // if current cell not initialized, create cell with zero cost
	
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
					_east.g_cost = _curcell.g_cost + 1
					ds_list_add(_open_cells, _east)
				}
				if (_south != undefined && ds_list_find_index(_open_cells, _south) == -1
					&& ds_list_find_index(_closed_cells, _south) == -1) {
					_south.g_cost = _curcell.g_cost + 1
					ds_list_add(_open_cells, _south)
				}
				if (_west != undefined && ds_list_find_index(_open_cells, _west) == -1
					&& ds_list_find_index(_closed_cells, _west) == -1) {
					_west.g_cost = _curcell.g_cost + 1
					ds_list_add(_open_cells, _west)
				}
				if (_north != undefined && ds_list_find_index(_open_cells, _north) == -1
					&& ds_list_find_index(_closed_cells, _north) == -1) {
					_north.g_cost = _curcell.g_cost + 1
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
			
			_cell.h_cost = apf_costf(_cell.i * agrid_cell_size, _cell.j * agrid_cell_size) // update heuristic cost
			_cell.s_cost = _cell.g_cost + _cell.h_cost // update S cost
		}
	
		// Grow or prune grid
		{
			
			// choose whether to grow or prune
			var _agrid_size = ds_list_size(agrid_list)
			var _agrid_max_size = 50
			//var _prune_chance = max(0, (_agrid_size / _agrid_max_size - 0.5) * 2) // random chance for pruning
			var _prune = _agrid_size >= _agrid_max_size// || irandom(100 * _prune_chance) // whether to prune grid
	
			var _cost_min = infinity
			var _cost_max = -infinity
			for (var i = 0; i < _agrid_size; i ++) { // update costs and determine min and max costs
				var _cell = agrid_list[|i]
		
				var _s_cost = _cell.s_cost
				
				if (_s_cost < _cost_min) // define min and max S costs
					_cost_min = _s_cost
				if (_s_cost > _cost_max)
					_cost_max = _s_cost
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
		
					var _cost_norm = 0.1 + 0.9 * (_cell.s_cost - _cost_min) / _cost_range // normalise in range of 0, 1
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
			var _destination = undefined // destination cell
			var _min_cost = infinity
			for (var i = 0; i < ds_list_size(agrid_list); i ++) {
				var _cell = agrid_list[|i]
				
				if (_cell.h_cost == undefined) // if newly added cell, heuristic cost is not defined yet
					continue // skip
				
				var _s_cost = _cell.g_cost + _cell.h_cost
				
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
				_next_cell = undefined
				if (_east != undefined && _east.g_cost != undefined && _east.g_cost < _min_cost) {
					_min_cost = _east.g_cost
					_next_cell = _east
				}
				if (_south != undefined && _south.g_cost != undefined && _south.g_cost < _min_cost) {
					_min_cost = _south.g_cost
					_next_cell = _south
				}
				if (_west != undefined && _west.g_cost != undefined && _west.g_cost < _min_cost) {
					_min_cost = _west.g_cost
					_next_cell = _west
				}
				if (_north != undefined && _north.g_cost != undefined && _north.g_cost < _min_cost) {
					_min_cost = _north.g_cost
					_next_cell = _north
				}
				
				if (_next_cell == undefined)
					show_error("Path from destination cell to current cell could not be found.", true)
					
			ds_list_add(agrid_path, _next_cell) // add least cost neighbour to path and continue looping from there
				
			}
		
		}
	}
}