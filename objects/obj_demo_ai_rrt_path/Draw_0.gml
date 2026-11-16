// Draw RRT for each player
if (demo_players != undefined) {

	for (var i = 0; i < array_length(demo_players); i ++) {

		if (!instance_exists(demo_players[i].motion_planner))
			continue
			
		demo_players[i].motion_planner.draw()
		
	}

}