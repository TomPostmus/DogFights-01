// Insert RRT paths into motion planning layer of players
if (demo_players != undefined) {
	
	//instance_exists(demo_player.character) && instance_exists(demo_player.character.body) && instance_exists(demo_player.motion_planner)
	for (var i = 0; i < array_length(demo_players); i ++) {
		
		if (path_inserted[i])
			continue
		if (!instance_exists(demo_players[i].motion_planner))
			continue
	
		var _body_x = demo_players[i].character.body.trunk.x
		var _body_y = demo_players[i].character.body.trunk.y
		var _body_th = demo_players[i].character.body.get_rotation()	
		
		demo_players[i].motion_planner.sm_state = "freeze" // freeze layer, such that growing is disabled
		
		switch (i) {
			case 0:
			var _path = rrt_path_straight_u_turn_straight(_body_x, _body_y, _body_th)
			motion_planner_insert_rrt_path(demo_players[i].motion_planner, _path)
			break		
		}
		
		path_inserted[i] = true
		
	}
	
}