// Insert RRT paths into motion planning layer of players
if (demo_players != undefined) {
	
	//instance_exists(demo_player.character) && instance_exists(demo_player.character.body) && instance_exists(demo_player.motion_planner)
	for (var i = 0; i < array_length(demo_players); i ++) {
		
		if (!instance_exists(demo_players[i].motion_planner))
			continue
		
		if (cyclic_paths[i] == undefined) {
	
			var _body_x = demo_players[i].character.body.trunk.x
			var _body_y = demo_players[i].character.body.trunk.y
			var _body_th = demo_players[i].character.body.get_rotation()	
		
			demo_players[i].motion_planner.sm_state = "freeze" // freeze layer, such that growing is disabled
		
			cyclic_paths[i] = method_call(cyclic_path_generators[i], [_body_x, _body_y, _body_th]) // generate path from x, y, th position
			motion_planner_insert_rrt_path(demo_players[i].motion_planner, cyclic_paths[i])	
		
		} else if (demo_players[i].motion_planner.root) { // if cyclic path was generated and motion planner tree has not been canceled
		
			motion_planner_update_cyclic_path(demo_players[i].motion_planner, cyclic_paths[i]) // update cyclic path
		
		}
		
	}
	
}