// Follow player character
if (instance_exists(player) && instance_exists(player.character)) {
	var _aiming = 0
	if (instance_exists(player.character.weapon))
		_aiming = aiming * stats.aim_dist
	
	if (instance_exists(player.character.body)) {
		var _forward = 10 + _aiming // how much to position camera forward in player looking orientation
		var _cam_x = player.character.body.get_x() + lengthdir_x(_forward, player.character.body.get_rotation())
		var _cam_y = player.character.body.get_y() + lengthdir_y(_forward, player.character.body.get_rotation())
		
		set_target(_cam_x, _cam_y, 3)
	}
}