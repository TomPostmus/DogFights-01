#macro AGRID_CELL_SIZE 16

/// @param {AIGridCell} parent
/// @param {int} i The column (x) position of the grid cell
/// @param {int} j The row (x) position of the grid cell
/// @description Create an AIGridCell element.
function AIGridCell(_parent, _i, _j) : AITreeElement(_parent) constructor {

	i = _i
	j = _j
	th = undefined // orientation of cell
	x = i * AGRID_CELL_SIZE
	y = j * AGRID_CELL_SIZE	
	
	p_cost = undefined // path cost of cell if it is part of A* path
	
	g_cost = parent ? (parent.g_cost + AGRID_CELL_SIZE) : 0

}