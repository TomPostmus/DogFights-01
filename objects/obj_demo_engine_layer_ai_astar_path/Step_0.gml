if (instance_exists(demo_player) && instance_exists(demo_player.character) && instance_exists(demo_player.character.body) 
 && instance_exists(demo_player.grid_planner)
 && instance_exists(goal)) {
	
	if (!path_inserted) {
	
		var _body_x = demo_player.character.body.trunk.x
		var _body_y = demo_player.character.body.trunk.y
	
		// Compute path to path point marker
		var _path = path_add()
		if (mp_grid_path(obj_ai_topology.grid, _path, _body_x, _body_y, goal.x, goal.y, true)) {
			//show_error("Could not start demo obj_demo_engine_layer_ai_astar_path; Path compation to goal failed.", true)
	
			demo_player.grid_planner.insert_path(_path)
			demo_player.grid_planner.cost_field = cost_field // set cost field as distance to goal
			path_inserted = true
		
		}
	
	}
	
}