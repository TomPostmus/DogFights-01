/// @param point_x
/// @param point_y
/// @param x1
/// @param y1
/// @param x2
/// @param y2
function point_on_line() {

	var point_x = argument[0];
	var point_y = argument[1];
	var x1 = argument[2];
	var y1 = argument[3];
	var x2 = argument[4];
	var y2 = argument[5];

	return (x1 == point_x && y1 == point_y) || (x2 == point_x && y2 == point_y)
		|| (angle_difference(point_direction(x1, y1, x2, y2), point_direction(x1, y1, point_x, point_y)) == 0
			&& angle_difference(point_direction(x2, y2, x1, y1), point_direction(x2, y2, point_x, point_y)) == 0)
		


}
