/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param x4
/// @param y4
function line_segment_intersection_point() {

	var x1 = argument[0];
	var y1 = argument[1];
	var x2 = argument[2];
	var y2 = argument[3];
	var x3 = argument[4];
	var y3 = argument[5];
	var x4 = argument[6];
	var y4 = argument[7];

	if (line_segment_intersection(x1, y1, x2, y2, x3, y3, x4, y4)) {
		var alpha = abs(angle_difference(point_direction(x1, y1, x2, y2), point_direction(x1, y1, x4, y4)));
	
		if (alpha == 0) { //edge case if lines (partially) overlap each other
			var coordinate = array_create(2);
			if ((x3 >= x1 && x3 <= x2) || (x3 >= x2 && x3 <= x2)) {
				coordinate[0] = x3
				coordinate[1] = y3
			} else {
				coordinate[0] = x1
				coordinate[1] = y1
			}
			return coordinate
		}
	
		var beta = abs(angle_difference(point_direction(x4, y4, x3, y3), point_direction(x4, y4, x1, y1)));
		var gamma = 180 - alpha - beta;
		var c = point_distance(x1, y1, x4, y4);
		var b = dsin(beta) * (c / dsin(gamma));

		var coordinate = array_create(2);
		coordinate[0] = x1 + lengthdir_x(b, point_direction(x1, y1, x2, y2))
		coordinate[1] = y1 + lengthdir_y(b, point_direction(x1, y1, x2, y2))
		return coordinate
	}

	return undefined


}
