/// @param x
/// @param y
/// @param obj
function instance_create() {

	var xp = argument[0];
	var yp = argument[1];
	var obj = argument[2];

	return instance_create_layer(xp, yp, "Instances", obj)


}
