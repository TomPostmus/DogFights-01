if (body_x != undefined && body_y != undefined && cost_field != undefined) { // check if received inputs from player

	// Update A* Grid
	var _body_cell_i = floor(body_x / agrid_cell_size)
	var _body_cell_j = floor(body_y / agrid_cell_size)
	
	if (_body_cell_i >= 0 && _body_cell_i < ds_grid_width(agrid_grid)
		&& _body_cell_j >= 0 && _body_cell_j < ds_grid_height(agrid_grid)) {
			
		agrid_curcell ??= new agrid_cell(self, undefined, _body_cell_i, _body_cell_j) // if current cell not initialized, create cell
		
		// If location changed, move curcell to new location
		if (_body_cell_i != agrid_curcell.i || _body_cell_j != agrid_curcell.j) { // if location different than that from current cell
		
			var _new_cell = agrid_grid[# _body_cell_i, _body_cell_j] // the new cell we are at
			_new_cell ??= new agrid_cell(self, undefined, _body_cell_i, _body_cell_j) // if there is no grid cell in new location, create new root there
			
			// new cell becomes root, so decouple it from parent
			if (_new_cell.parent != undefined) { // if has parent
				var _list_i = ds_list_find_index(_new_cell.parent.children, _new_cell)
				ds_list_delete(_new_cell.parent.children, _list_i) // decouple next cell from parent to avoid deleting the new branch along with deleting old cell
				_new_cell.parent = undefined // new root, so no parent
				if (!_new_cell.open) { // if not open, make open
					_new_cell.open = true
					ds_list_add(agrid_list_open, _new_cell)
				}
			}
			
			// if neighbours with old cell, old cell becomes new cell's child
			var _is_neighbour = (abs(_new_cell.i - agrid_curcell.i) + abs(_new_cell.j - agrid_curcell.j)) == 1
			if (_is_neighbour) {
				agrid_curcell.parent = _new_cell // new cell becomes parent of old cell
				ds_list_add(_new_cell.children, agrid_curcell) // old cell becomes new cell's child
			} else { // if not neighbours, just destroy old cell
				agrid_curcell.destroy()
			}
			
			agrid_curcell = _new_cell
		
		}
		
		// Grow or prune A* grid
		repeat(3) {
			
			// choose whether to grow or prune
			var _agrid_size = ds_list_size(agrid_list)
			var _prune_chance = max(0, (_agrid_size / agrid_max_size - 0.75) * 4) // random chance for pruning
			var _prune = _agrid_size >= agrid_max_size || irandom(1000 * (1 - _prune_chance)) == 0 // whether to prune grid
	
			var _nr_open = ds_list_size(agrid_list_open) // number of open cells
			
			var _cost_min = infinity
			var _cost_max = -infinity
			for (var i = 0; i < _nr_open; i ++) { // update costs and determine min and max costs
				var _cell = agrid_list_open[|i]
		
				var _cost = _cell.h_cost
				
				if (_cost < _cost_min) // define min and max S costs
					_cost_min = _cost
				if (_cost > _cost_max)
					_cost_max = _cost
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
		
					var _cost_norm = 0.1 + 0.9 * (_cell.h_cost - _cost_min) / _cost_range // normalise in range of 0.1, 1
					if (!_prune) // if grow
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
				
				//var _i = _chosen.i
				//var _j = _chosen.j
	
				if (!_prune) { // if explore
					
					_chosen.explore()		
				
				} else if (ds_list_find_index(agrid_path, _chosen) == -1) { // if prune and chosen is not in the path that the player is supposed to walk
	
					_chosen.destroy() // destroy cell
			
				}
			}
			
		}
		
		// Update A* path
		if (agrid_path_update) {
			
			agrid_path_update = false // lower flag
	
			//// Update G costs
			//{
			
			//	var _open_cells = ds_list_create() // list keeping track of open cells used for recursive traversal of A* Grid
			//	var _closed_cells = ds_list_create() // cells already traversed
			//	ds_list_add(_open_cells, agrid_curcell) // initialize open list with current cell
		
			//	for (var i = 0; i < ds_list_size(agrid_list); i ++) // set G costs of all cells to undefined
			//		agrid_list[|i].g_cost = undefined		
			//	agrid_curcell.g_cost = 0 // set G cost if current cell to 0
		
			//	// traverse A* Grid, starting from current cell, and updating G costs
			//	while (ds_list_size(_open_cells) > 0) {
			//		var _curcell = _open_cells[|0] // pop current cell from 1st postion of list
			//		ds_list_delete(_open_cells, 0)
			
			//		var _i = _curcell.i
			//		var _j = _curcell.j
			
			//		var _east = _i < ds_grid_width(agrid_grid) ? agrid_grid[# _i+1, _j] : undefined
			//		var _south = _j < ds_grid_height(agrid_grid) ? agrid_grid[# _i, _j+1] : undefined
			//		var _west = _i >= 0 ? agrid_grid[# _i-1, _j] : undefined
			//		var _north = _j >= 0 ? agrid_grid[# _i, _j-1] : undefined
			
			//		// explore neighbors
			//		if (_east != undefined && ds_list_find_index(_open_cells, _east) == -1
			//			&& ds_list_find_index(_closed_cells, _east) == -1) { // if east exists in A* Grid and is not in open, nor closed set
			//			_east.g_cost = _curcell.g_cost + agrid_cell_size // increment by 1 cell distance
			//			ds_list_add(_open_cells, _east)
			//		}
			//		if (_south != undefined && ds_list_find_index(_open_cells, _south) == -1
			//			&& ds_list_find_index(_closed_cells, _south) == -1) {
			//			_south.g_cost = _curcell.g_cost + agrid_cell_size
			//			ds_list_add(_open_cells, _south)
			//		}
			//		if (_west != undefined && ds_list_find_index(_open_cells, _west) == -1
			//			&& ds_list_find_index(_closed_cells, _west) == -1) {
			//			_west.g_cost = _curcell.g_cost + agrid_cell_size
			//			ds_list_add(_open_cells, _west)
			//		}
			//		if (_north != undefined && ds_list_find_index(_open_cells, _north) == -1
			//			&& ds_list_find_index(_closed_cells, _north) == -1) {
			//			_north.g_cost = _curcell.g_cost + agrid_cell_size
			//			ds_list_add(_open_cells, _north)
			//		}
			
			//		ds_list_add(_closed_cells, _curcell) // current cell was explored, add to closed set
			//	}
		
			//	ds_list_destroy(_open_cells)
			//	ds_list_destroy(_closed_cells)
		
			//	// remove parts that were unexplored because they are unconnected
			//	for (var i = 0; i < ds_list_size(agrid_list); i ++) {
			//		var _cell = agrid_list[|i]
			
			//		if (_cell.g_cost == undefined) {
			//			_cell.destroy()
			//			i --
			//		}
			//	}
		
			//}
		
			// Update H cost and S cost
			for (var i = 0; i < ds_list_size(agrid_list); i ++) {
				var _cell = agrid_list[|i]
			
				_cell.h_cost = cost_field(_cell.i * agrid_cell_size, _cell.j * agrid_cell_size) // update heuristic cost from cost field
				//_cell.s_cost = _cell.g_cost + _cell.h_cost // update S cost
			}
		
			// Find minimal cost node, and compute path to that node
			{
		
				// find destination cell
				var _destination = undefined // destination cell
				var _min_cost = agrid_curcell.h_cost // take cost of current cell as initial minimal cost
				for (var i = 0; i < ds_list_size(agrid_list); i ++) {
					var _cell = agrid_list[|i]
				
					//if (_cell.h_cost == undefined) // if newly added cell, heuristic cost is not defined yet
					//	continue // skip
				
					var _cost = _cell.h_cost
				
					if (_cost < _min_cost) {
						_destination = _cell
						_min_cost = _cost
					}
				}
			
				// compute path
				if (_destination != undefined) {
					
					var _path = path_add() // create GM path instance
					var _src_x = (agrid_curcell.i + 0.5) * agrid_cell_size // absolute position of current cell
					var _src_y = (agrid_curcell.j + 0.5) * agrid_cell_size
					var _dest_x = (_destination.i + 0.5) * agrid_cell_size // absolute position of destination cell
					var _dest_y = (_destination.j + 0.5) * agrid_cell_size
					var _succesful = mp_grid_path(agrid_mp_grid, _path, _src_x, _src_y, _dest_x, _dest_y, false)
					if (_succesful) { // if found path
						
						ds_list_clear(agrid_path) // clear old path
						var _path_acc_length = 0 // accumulated path length as we are looping through
						var _path_length = path_get_length(_path) // accumulated path length as we are looping through
						var _prev_orientation = undefined // orientation from previous cell to current cell
						var _cur_cell_x = path_get_point_x(_path, 0) // x, y of first point
						var _cur_cell_y = path_get_point_y(_path, 0)
						for (var _i = 0; _i < path_get_number(_path); _i ++) {
							var _cur_cell_i = floor(_cur_cell_x / agrid_cell_size)
							var _cur_cell_j = floor(_cur_cell_y / agrid_cell_size)
							var _cur_cell = agrid_grid[# _cur_cell_i, _cur_cell_j] // get current cell
						
							_cur_cell.p_cost = _path_length - _path_acc_length
							ds_list_add(agrid_path, _cur_cell) // add to path list
							
							if (_i == path_get_number(_path)-1) { // if last pt
								_cur_cell.orientation = _prev_orientation ?? 0
							} else {
								var _next_cell_x = path_get_point_x(_path, _i+1) // x,y of next point
								var _next_cell_y = path_get_point_y(_path, _i+1)
								var _next_orientation = point_direction(_cur_cell_x, _cur_cell_y, _next_cell_x, _next_cell_y) // orientation for current cell to next
								
								_cur_cell.orientation = _next_orientation + angle_difference(_prev_orientation ?? _next_orientation, _next_orientation) / 2 // cell's orientation is angle between next and previous orientation
								
								_cur_cell_x = _next_cell_x // move to next cell
								_cur_cell_y = _next_cell_y
								_prev_orientation = _next_orientation
								_path_acc_length += agrid_cell_size
							}
						}
						
					}
				
					path_delete(_path) // finally delete GM path
				
				}
			}
			
		}
		
	}
	
}