/// @param x
/// @param y
/// @param obj
/// @param vars
function create_hud() {

	var xp = argument[0];
	var yp = argument[1];
	var obj = argument[2];
	//var vars = argument[3]; // optional var struct

	if (!layer_exists("HUD")) {
		layer_create(-900, "HUD") // just under controllers
	}

	//if (vars != undefined)
	//	return instance_create_layer(xp, yp, "HUD", obj, vars)
	//else
		return instance_create_layer(xp, yp, "HUD", obj)


}
