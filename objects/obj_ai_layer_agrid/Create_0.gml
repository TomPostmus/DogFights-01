// Inputs from player
body_x = undefined // the current x,y position of the player
body_y = undefined
cost_field = undefined // the cost field in which A* Grid should grow

// A* Grid properties
agrid_cell_size = 16
agrid_curcell = undefined // the cell we are currently at
agrid_grid = ds_grid_create(room_width/agrid_cell_size, room_height/agrid_cell_size) // grid of A* cells
for (var i = 0; i < ds_grid_width(agrid_grid); i ++)
	for (var j = 0; j < ds_grid_height(agrid_grid); j ++)
		agrid_grid[# i, j] = undefined // use undefined as default value (cleaner in code with nullish operator)
agrid_list = ds_list_create() // list of occupied cells
agrid_list_open = ds_list_create() // list of open cells
agrid_path = ds_list_create() // list of cells representing path to minimal cost node


agrid_cell = function(_i, _j) constructor { // constructor for cell object
	i = _i
	j = _j
	
	s_cost = undefined // S cost, summed cost of H cost and G cost
	h_cost = undefined // heuristic (H) cost defined by APF layer, updated in step
	g_cost = undefined // G cost
	
	// Store in data structures
	if (other.agrid_grid[# i, j] != undefined)
		show_error("Not allowing A* Grid cells to be overwritten. Call destroy() first on this cell.", true)
	other.agrid_grid[# i, j] = self // put self in grid and list
	ds_list_add(other.agrid_list, self)
	
	open = true // whether is open node (not explored yet)
	ds_list_add(other.agrid_list_open, self) // add to open list
	
	// Destroy A* Grid cell
	static destroy = function() {
		other.agrid_grid[# i, j] = undefined // remove self from grid and list
		var _list_i = ds_list_find_index(other.agrid_list, self)
		ds_list_delete(other.agrid_list, _list_i)
		
		if (open) { // remove from open list, if it is in there
			_list_i = ds_list_find_index(other.agrid_list_open, self)
			ds_list_delete(other.agrid_list_open, _list_i)
		}
		
		_list_i = ds_list_find_index(other.agrid_path, self) // remove self from path if in there
		if (_list_i != -1)
			ds_list_delete(other.agrid_path, _list_i)
		
		if (other.agrid_curcell = self) // reset current cell variable if equals to self
			other.agrid_curcell = undefined
	}
}

// Draw A* Grid layer
draw = function() {
	
	for (var i = 0; i < ds_list_size(agrid_list); i ++) {
		var _cell = agrid_list[|i]
	
		var _cell_x = _cell.i * agrid_cell_size
		var _cell_y = _cell.j * agrid_cell_size
	
		draw_set_colour(
			ds_list_find_index(agrid_path, _cell) != -1 ? c_lime 
			: (_cell.open ? c_red : c_blue))
	
		draw_set_alpha(0.2)
		draw_rectangle(_cell_x, _cell_y, _cell_x + agrid_cell_size, _cell_y + agrid_cell_size, false)
		draw_set_alpha(1)
		
		draw_set_halign(fa_center)
		draw_text(_cell_x + agrid_cell_size/2, _cell_y + agrid_cell_size/2, _cell.g_cost)
	
	}

}