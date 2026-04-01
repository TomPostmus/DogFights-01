/// @param player_obj
/// @param damage
/// @param source_player*
function player_damage() {

	var player = argument[0];
	var damage = argument[1];
	var source_player = undefined;
	if (argument_count > 2) source_player = argument[2];

	if (source_player == undefined) {
		player.hp -= damage
	} else {
		//TODO implement teams and friendly fire
		player.hp -= damage
	}


}
