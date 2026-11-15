if (instance_exists(demo_player) && instance_exists(demo_player.character) && instance_exists(demo_player.character.body) 
 && instance_exists(demo_player.motion_planner)) {
	
	if (!path_inserted) {
	
		var _body_x = demo_player.character.body.trunk.x
		var _body_y = demo_player.character.body.trunk.y
		var _body_th = demo_player.character.body.get_rotation()	
		
		demo_player.motion_planner.sm_state = "freeze" // freeze layer, such that growing is disabled
		
		var _path = rrt_path_straight_u_turn_straight(_body_x, _body_y, _body_th)
		motion_planner_insert_rrt_path(demo_player.motion_planner, _path)
		path_inserted = true
	}
	
}