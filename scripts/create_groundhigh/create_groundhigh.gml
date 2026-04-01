/// @param x
/// @param y
/// @param obj
/// @param vars
function create_groundhigh() {

	var xp = argument[0];
	var yp = argument[1];
	var obj = argument[2];
	var vars = argument[3]; // optional var struct

	if (!layer_exists("Ground_High")) {
		layer_create(-17, "Ground_High")
	}

	if (vars != undefined)
		return instance_create_layer(xp, yp, "Ground_High", obj, vars)
	else
		return instance_create_layer(xp, yp, "Ground_High", obj)


}
