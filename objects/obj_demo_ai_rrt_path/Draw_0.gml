// Draw RRT for each player
if (instance_exists(demo_player) && instance_exists(demo_player.character) && instance_exists(demo_player.character.body) 
 && instance_exists(demo_player.motion_planner)) {
 
	demo_player.motion_planner.draw()
 
 }