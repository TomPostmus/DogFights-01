/// @param x
/// @param y
/// @param obj
function create_physics() {

	var xp = argument[0];
	var yp = argument[1];
	var obj = argument[2];

	if (!layer_exists("Physics")) {
		layer_create(-90, "Physics")
	}

	return instance_create_layer(xp, yp, "Physics", obj)


}
