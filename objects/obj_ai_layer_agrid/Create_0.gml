enum AI_PATH_MODE {
	FLOW, // path flow mode, path is computed based on largest child count
	FIND // path find mode, path is computed based on lowest H cost
}

// Inputs from player
body_x = undefined // the current x,y position of the player
body_y = undefined
cost_field = undefined // the cost field in which A* Grid should grow
path_mode = AI_PATH_MODE.FLOW // set to path flow mode

// Output to player
cost_field_rrt = undefined // cost field, meant for the RRT layer, that is based on the current A* path

// A* Grid properties
agrid_cell_size = 16
agrid_max_size = 200 // size that the A* Grid can maximally grow to
agrid_curcell = undefined // the cell we are currently at

agrid_mp_grid = mp_grid_create(0, 0, room_width/agrid_cell_size, room_height/agrid_cell_size, agrid_cell_size, agrid_cell_size) // motion planning grid to perform GM engine A* in
mp_grid_add_rectangle(agrid_mp_grid, 0, 0, room_width, room_height) // mark all cells as forbidden by default

agrid_grid = ds_grid_create(room_width/agrid_cell_size, room_height/agrid_cell_size) // grid of A* cells
for (var i = 0; i < ds_grid_width(agrid_grid); i ++)
	for (var j = 0; j < ds_grid_height(agrid_grid); j ++)
		agrid_grid[# i, j] = undefined // use undefined as default value (cleaner in code with nullish operator)
		
agrid_list = ds_list_create() // list of occupied cells
agrid_list_open = ds_list_create() // list of open cells
agrid_path_update = false // whether to do a path update, this is set to true be the central AI scheduler object
agrid_path = ds_list_create() // list of cells representing path to minimal cost node

 // Constructor for A* cell object
agrid_cell = function(_lyer, _parent, _i, _j) constructor {
	lyer = _lyer // A* grid layer object that cell belongs to
	parent = _parent // parent cell struct
	i = _i
	j = _j
	
	h_cost = lyer.cost_field(i * lyer.agrid_cell_size, j * lyer.agrid_cell_size) // heuristic (H) cost defined by APF layer, updated in step
	g_cost = parent == undefined ? 0 : (parent.g_cost + lyer.agrid_cell_size) // G cost, based on parent G cost plus one cell dimension
	s_cost = h_cost + g_cost // S cost, sum of G and H costs
	
	children = ds_list_create() // list of children cells
	child_count = 0 // how many n-grand-children it has
	orientation = undefined // orientation of cell if it is part of A* path
	p_cost = undefined // path cost of cell if it is part of A* path
	
	// Store in data structures
	if (lyer.agrid_grid[# i, j] != undefined)
		show_error("Not allowing A* Grid cells to be overwritten. Call destroy() first on this cell.", true)
	lyer.agrid_grid[# i, j] = self // put self in grid and list
	ds_list_add(lyer.agrid_list, self)
	mp_grid_clear_cell(lyer.agrid_mp_grid, i, j) // remove forbidden cell at location in MP grid
	
	open = true // whether is open for exploration
	ds_list_add(lyer.agrid_list_open, self) // add to open list
	
	// Explore neighbours of A* cell
	static explore = function() {
		
		// explore open cells to north, east, south, west of chosen cell
		var _obst_grid = obj_ai_topology.grid // MP grid of obstacles from topology manager
		var _agrid_grid = lyer.agrid_grid
		var _agrid_cell = lyer.agrid_cell // constructor method for creating cell
		var _n_children_before = ds_list_size(children) // amount of children before
		if (i+1 < ds_grid_width(_agrid_grid) && mp_grid_get_cell(_obst_grid, i+1, j) != -1 && _agrid_grid[# i+1, j] == undefined) // if east is in grid range, not occupied by obstacle, and not part of the A* grid graph yet
			ds_list_add(children, new _agrid_cell(lyer, self, i+1, j)) // add to children
		if (j+1 < ds_grid_height(_agrid_grid) && mp_grid_get_cell(_obst_grid, i, j+1) != -1 && _agrid_grid[# i, j+1] == undefined)
			ds_list_add(children, new _agrid_cell(lyer, self, i, j+1))
		if (i-1 >= 0 && mp_grid_get_cell(_obst_grid, i-1, j) != -1 && _agrid_grid[# i-1, j] == undefined)
			ds_list_add(children, new _agrid_cell(lyer, self, i-1, j))
		if (j-1 >= 0 && mp_grid_get_cell(_obst_grid, i, j-1) != -1 && _agrid_grid[# i, j-1] == undefined)
			ds_list_add(children, new _agrid_cell(lyer, self, i, j-1))
					
		open = false // no longer open
		var _list_i = ds_list_find_index(lyer.agrid_list_open, self)
		ds_list_delete(lyer.agrid_list_open, _list_i) // remove from open list	
		
		var _n_added = ds_list_size(children) - _n_children_before // how many children were added
		var _cell = self
		while(_cell != undefined) {
			_cell.child_count += _n_added // add number of added children to child count of _cell
			_cell = _cell.parent // propagate upwards through parents
		}
	}
	
	// Destroy A* Grid cell
	static destroy = function(_decouple=true) {
		lyer.agrid_grid[# i, j] = undefined // remove self from grid and list
		var _list_i = ds_list_find_index(lyer.agrid_list, self)
		ds_list_delete(lyer.agrid_list, _list_i)
		mp_grid_add_cell(lyer.agrid_mp_grid, i, j) // mark cell as free again in MP grid
		
		if (open) { // remove from open list, if it is in there
			_list_i = ds_list_find_index(lyer.agrid_list_open, self)
			ds_list_delete(lyer.agrid_list_open, _list_i)
		}
		
		_list_i = ds_list_find_index(lyer.agrid_path, self) // remove self from path if in there
		if (_list_i != -1)
			ds_list_delete(lyer.agrid_path, _list_i)
		
		if (lyer.agrid_curcell = self) // reset current cell variable if equals to self
			lyer.agrid_curcell = undefined
		
		for (var _i = 0; _i < ds_list_size(children); _i ++)
			children[|_i].destroy(false) // destroy children withouth decoupling them from their parents (parents are also destroyed)
		ds_list_destroy(children) // finally destroy children list
			
		if (_decouple && parent != undefined) { // if decouple flag is set and has parent
			_list_i = ds_list_find_index(parent.children, self) // find self in parent links list
			ds_list_delete(parent.children, _list_i) // remove self from list
			if (!parent.open) { // add parent again to open list 
				parent.open = true
				ds_list_add(lyer.agrid_list_open, parent)
			}
			
			var _n_destroyed = child_count + 1 // how many n-grand-children are being removed
			var _cell = parent
			while(_cell != undefined) {
				_cell.child_count -= _n_destroyed // subtract number of destroyed n-grand-children from n-grand-parent
				_cell = _cell.parent // propagate upwards through parents
			}
		}
	}
}

// Cost field for RRT layer
cost_field_rrt = function(_x, _y, _th) { // compute cost based on 3D position
	
	if (ds_list_size(agrid_path) == 0) // if no path, return zero cost
		return 0
				
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
				
	// compute cost as distance to nearest path cell plus path cost of that cell, plus angle difference with orientation
	var _orientation_cost = 50 * (1 - dcos(angle_difference(_th, _nearest_cell.orientation)))
	return 0.3 *_least_distance + 1.0 * _nearest_cell.p_cost + _orientation_cost
			
}
		

// Draw A* Grid layer
draw = function(_path_ghost=false) {
	
	var _list = _path_ghost ? agrid_path : agrid_list // if path ghost is set, draw only path, otherwise full grid
	
	for (var i = 0; i < ds_list_size(_list); i ++) {
		var _cell = _list[|i]
	
		var _cell_x = _cell.i * agrid_cell_size
		var _cell_y = _cell.j * agrid_cell_size
		var _cell_cx = _cell_x + agrid_cell_size / 2
		var _cell_cy = _cell_y + agrid_cell_size / 2
	
		draw_set_colour(
			_cell == agrid_curcell ? c_yellow :
			((_path_ghost || ds_list_find_index(agrid_path, _cell) != -1) ? c_lime 
			: (_cell.open ? c_red : c_blue)))
	
		draw_set_alpha(0.2)
		draw_rectangle(_cell_x, _cell_y, _cell_x + agrid_cell_size, _cell_y + agrid_cell_size, false)
		draw_set_alpha(1)
		
		draw_set_halign(fa_center)
		if (_cell.child_count != undefined)
			draw_text(_cell_cx, _cell_cy, _cell.child_count)
		
		for (var j = 0; j < ds_list_size(_cell.children); j ++) { // loop through children
			var _child = _cell.children[|j]
			
			var _thickness = 0.5 + 0.5 * ceil(_child.child_count / 6.25) // visualising thickness of edge based on childcount of node
			draw_line_width(_cell_cx, _cell_cy, (_child.i + 0.5) * agrid_cell_size, (_child.j + 0.5) * agrid_cell_size, _thickness) // draw line from cell to child
		}
		
		//var _r = 5
		//if (_cell.orientation != undefined)
		//	draw_arrow(_cell_x + agrid_cell_size/2, _cell_y + agrid_cell_size/2,
		//		_cell_x + agrid_cell_size/2 + lengthdir_x(_r, _cell.orientation), 
		//		_cell_y + agrid_cell_size/2 + lengthdir_y(_r, _cell.orientation), 2)
	
	}

}