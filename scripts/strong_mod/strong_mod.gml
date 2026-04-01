/// @param value
/// @param parameter
function strong_mod() {

	var value = argument[0];
	var parameter = argument[1];

	if value >= 0 return value mod parameter;
	else return (parameter + (value mod parameter)) mod parameter


}
