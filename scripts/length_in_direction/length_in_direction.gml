/// @param vector_x
/// @param vector_y
/// @param direction
function length_in_direction() {

	var vec_x = argument[0];
	var vec_y = argument[1];
	var dir = argument[2];

	var angle = angle_difference(point_direction(0, 0, vec_x, vec_y), dir);

	return dcos(angle)*point_distance(0, 0, vec_x, vec_y)


}
