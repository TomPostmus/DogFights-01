// Inherit the parent event
event_inherited();

state = "explore"

// APF layer (Artificial Potential Field, with Attraction and Repulsion sources)
apf_explgrid_cell_size = 64
apf_explgrid = ds_grid_create(room_width/apf_explgrid_cell_size, room_height/apf_explgrid_cell_size) // exploration grid
apf_costf = undefined // cost function, that maps position (x, y) to cost (manifold height)
apf_explgrid_costf = function(_x, _y) { // cost function for exploration grid, mapping position to exploration cost
	
	var _cell_x = ceil(_x / apf_explgrid_cell_size) // indices of cells in ds grid
	var _cell_y = ceil(_y / apf_explgrid_cell_size)
	
	var _cost = 1 - apf_explgrid[# _cell_x, _cell_y]
	
	return _cost
	
}
apf_enemies = ds_list_create() // list of enemies in sight
apf_social_costf = function(_x, _y) { // cost function for social bonds (teammates or enemies)
	
	var _cost = 0
	var _R = 400 // radius of sources
	for (var i = 0; i < ds_list_size(apf_enemies); i ++) {
		var _enemy = apf_enemies[|i]
		
		var _r = point_distance(_x, _y, _enemy.x, _enemy.y) // radius (distance) to enemy
		
		if (_r <= _R) { // if falls within source radius
			_cost += -_R * sqr(1 - sqr(_r) / sqr(_R)) // height on mountain/valley centered around enemy with radius R
		}
	}
	
	return _cost
	
}

// A* Grid layer
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
	}
}