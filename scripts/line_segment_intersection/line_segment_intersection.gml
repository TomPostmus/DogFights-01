/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param x4
/// @param y4
function line_segment_intersection() {

	var x1 = argument[0];
	var y1 = argument[1];
	var x2 = argument[2];
	var y2 = argument[3];
	var x3 = argument[4];
	var y3 = argument[5];
	var x4 = argument[6];
	var y4 = argument[7];

	var val = (y2-y1)*(x3-x2) - (x2-x1)*(y3-y2);
	var dir1 = val == 0 ? 0 : (val < 0 ? 2 : 1);
	val = (y2-y1)*(x4-x2) - (x2-x1)*(y4-y2);
	var dir2 = val == 0 ? 0 : (val < 0 ? 2 : 1);
	val = (y4-y3)*(x1-x4) - (x4-x3)*(y1-y4);
	var dir3 = val == 0 ? 0 : (val < 0 ? 2 : 1);
	val = (y4-y3)*(x2-x4) - (x4-x3)*(y2-y4);
	var dir4 = val == 0 ? 0 : (val < 0 ? 2 : 1);

	var seg1 = (x3 <= max(x1, x2)) && (x3 >= min(x1, x2)) && (y3 <= max(y1, y2)) && (y3 >= min(y1, y2))
	var seg2 = (x4 <= max(x1, x2)) && (x4 >= min(x1, x2)) && (y4 <= max(y1, y2)) && (y4 >= min(y1, y2))
	var seg3 = (x1 <= max(x3, x4)) && (x1 >= min(x3, x4)) && (y1 <= max(y3, y4)) && (y1 >= min(y3, y4))
	var seg4 = (x2 <= max(x3, x4)) && (x2 >= min(x3, x4)) && (y2 <= max(y3, y4)) && (y2 >= min(y3, y4))

	if (dir1 != dir2) && (dir3 != dir4)
		return true;
	if (dir1 == 0) && seg1
		return true;
	if (dir2 == 0) && seg2
		return true;
	if (dir3 == 0) && seg3
		return true;
	if (dir4 == 0) && seg4
		return true;
	return false;


}
