if (instance_exists(player) && instance_exists(player.camera)) {
		
	var _camera_x = player.camera.x // get camera parameters
	var _camera_y = player.camera.y
	var _camera_w = player.camera.get_width()
	var _camera_h = player.camera.get_height()
	
	//ds_list_clear(pois_in_sight) // clear POI list
	
	// Spot Enemies and Teammates
	var _my_team_id = player.team_id
	with (obj_character) {
		
		if (hp_protection) // exclude HP protected characters
			continue
		if (id == other.player.character) // exclude player itself
			continue
			
		var _char_x = body.trunk.x // x, y of character
		var _char_y = body.trunk.y
			
		if (point_in_rectangle(_char_x, _char_y, 
			_camera_x - _camera_w/2, _camera_y - _camera_h/2,
			_camera_x + _camera_w/2, _camera_y + _camera_h/2)) // check if in camera
		{
		
			var _is_enemy = _my_team_id == undefined || _my_team_id != team_id // check if enemy or teammate
				
			if (other.inst_to_poi[?id] == undefined) { // if no POI associated with spotted character
				
				var _poi
				if (_is_enemy) {
					_poi = new AIPoiEnemy(id, _char_x, _char_y)
					ds_list_add(other.enemies, _poi)
				} else {
					_poi = new AIPoiTeammate(id, _char_x, _char_y)
					ds_list_add(other.teammates, _poi)
				}
				
				other.inst_to_poi[?id] = _poi
				ds_list_add(other.pois, _poi)
				
			} else {
				
				other.inst_to_poi[?id].x = _char_x // update position
				other.inst_to_poi[?id].y = _char_y
				other.inst_to_poi[?id].seen_ago = 0
				
			}
							
		}
			
	}
		
	// Spot landmarks
	with (obj_ai_landmark) {
		
		if (point_in_rectangle(x, y, 
			_camera_x - _camera_w/2, _camera_y - _camera_h/2,
			_camera_x + _camera_w/2, _camera_y + _camera_h/2)) // check if in camera
		{
			
			if (!other.inst_to_poi[?id]) { // if not in map
				var _poi = new AIPoiLandmark(id, x, y)
				other.inst_to_poi[?id] = _poi // add
				ds_list_add(other.pois, _poi)
				ds_list_add(other.landmarks, _poi)
			}
				
			other.inst_to_poi[?id].seen_ago = 0
			
		}
		
	}
		
	// TODO: Spot packages/pickups
		
}