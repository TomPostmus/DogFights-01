/// @param x
/// @param y
function create_camera() {

	var xp = argument[0];
	var yp = argument[1];

	if (!layer_exists("Cameras")) {
		layer_create(-90, "Cameras")
	}

	var camera = instance_create_layer(xp, yp, "Cameras", obj_camera);

	return camera


}
