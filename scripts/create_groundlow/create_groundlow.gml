/// @param x
/// @param y
/// @param obj
function create_groundlow() {

	var xp = argument[0];
	var yp = argument[1];
	var obj = argument[2];
	var _vars = argument[3];

	if (!layer_exists("Ground_Low")) {
		layer_create(-1, "Ground_Low")
	}

	if (_vars != undefined)
		return instance_create_layer(xp, yp, "Ground_Low", obj, _vars)
	else
		return instance_create_layer(xp, yp, "Ground_Low", obj)

}
