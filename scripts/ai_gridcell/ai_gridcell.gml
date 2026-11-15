#macro AGRID_CELL_SIZE 16

/// @param {AIGridCell} parent
/// @param {int} i The column (x) position of the grid cell
/// @param {int} j The row (x) position of the grid cell
/// @description Create an AIGridCell element.
function AIGridCell4Neighbours(_parent, _i, _j) : AITreeElement(_parent) constructor {

	i = _i
	j = _j
	th = undefined // orientation of cell
	x = i * AGRID_CELL_SIZE
	y = j * AGRID_CELL_SIZE	
	
	p_cost = undefined // path cost of cell if it is part of A* path
	
	g_cost = parent ? parent.g_cost + AGRID_CELL_SIZE : 0

}

/// @param {AIGridCell} parent
/// @param {int} i The column (x) position of the grid cell
/// @param {int} j The row (x) position of the grid cell
/// @description Create an AIGridCell element.
function AIGridCell8Neighbours(_parent, _i, _j) : AITreeElement(_parent) constructor {

	i = _i
	j = _j
	th = undefined // orientation of cell
	x = i * AGRID_CELL_SIZE
	y = j * AGRID_CELL_SIZE	
	
	p_cost = undefined // path cost of cell if it is part of A* path
	
	if (parent) {
		var _diagonal_bond = _i != parent.i && _j != parent.j // whether bond with parent is diagonal (for 8-neighbors)
		g_cost = parent.g_cost + (_diagonal_bond ? sqrt(sqr(AGRID_CELL_SIZE) + sqr(AGRID_CELL_SIZE)) : AGRID_CELL_SIZE)
	} else 
		g_cost = 0

}