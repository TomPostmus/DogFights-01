/// @param {AIGridCell} parent
/// @param {int} i The column (x) position of the grid cell
/// @param {int} j The row (x) position of the grid cell
/// @description Create an AIGridCell element.
function AIGridCell(_parent, _i, _j) : AITreeElement(_parent) constructor {

	i = _i
	j = _j
	
	orientation = undefined // orientation of cell if it is part of A* path
	p_cost = undefined // path cost of cell if it is part of A* path

}