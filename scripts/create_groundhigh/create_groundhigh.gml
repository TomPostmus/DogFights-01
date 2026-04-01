/// @param x
/// @param y
/// @param obj
function create_groundhigh() {

	var xp = argument[0];
	var yp = argument[1];
	var obj = argument[2];

	if (!layer_exists("Ground_High")) {
		layer_create(-17, "Ground_High")
	}

	return instance_create_layer(xp, yp, "Ground_High", obj)


}
