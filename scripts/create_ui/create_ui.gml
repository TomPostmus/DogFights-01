/// @param x
/// @param y
/// @param obj
function create_ui() {

	var xp = argument[0];
	var yp = argument[1];
	var obj = argument[2];

	if (!layer_exists("UI")) {
		layer_create(-100, "UI")
	}

	return instance_create_layer(xp, yp, "UI", obj)


}
