/// @param weapon_obj
/// @param component
/// @param attribute*
function weapon_data() {

	var weapon = argument[0];
	var component = argument[1];
	var attribute = undefined;
	if (argument_count > 2) attribute = argument[2];

	return attribute == undefined ? script_execute(weapon.data, weapon.sprite, weapon.index, component) : script_execute(weapon.data, weapon.sprite, weapon.index, component, attribute)


}
