/// @param x
/// @param y
/// @param obj
function create_sound() {

	var xp = argument[0];
	var yp = argument[1];
	var obj = argument[2];

	if (!layer_exists("Sounds")) {
		layer_create(-90, "Sounds")
	}

	return instance_create_layer(xp, yp, "Sounds", obj)


}
