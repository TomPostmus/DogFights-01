if (instance_exists(demo_player) && instance_exists(demo_player.character) && instance_exists(demo_player.character.body) 
 && instance_exists(demo_player.motion_planner)) {
	
	if (!path_inserted) {
	
		//var _body_x = demo_player.character.body.trunk.x
		//var _body_y = demo_player.character.body.trunk.y
		
		demo_player.motion_planner.sm_state = "freeze" // freeze layer, such that growing is disabled
		path_inserted = true
	}
	
}