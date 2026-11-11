//if (global.engine_running && instance_exists(character) && instance_exists(character.body)) {
//	var _body = character.body
//	var _weapon = character.weapon
	
//	var _body_x = _body.get_x()
//	var _body_y = _body.get_y()
//	var _body_rot = _body.get_rotation()

//}

if (global.engine_running && instance_exists(obj_viewport_controller)) {

for (var _vp_i = 0; _vp_i < obj_viewport_controller.nr_viewports; _vp_i ++) { // only draw if AI is active player and we are currently drawing to its viewport
if (obj_viewport_controller.viewport_to_player[_vp_i] == id && view_current == _vp_i) {
	
	if (debug_draw_mode == 1) {
		
		// Draw Action planner
		if (instance_exists(action_planner))
			action_planner.draw()
	
	} else if (debug_draw_mode == 2) {
	
		// Draw RRT Grid layer
		if (instance_exists(layer_rrt))
			layer_rrt.draw()
	
	} else if (debug_draw_mode == 3) {
		
		// Draw A* Grid layer
		if (instance_exists(grid_planner))
			grid_planner.draw()
	
	} else if (debug_draw_mode == 4) {
		
		// Draw both
		if (instance_exists(grid_planner))
			grid_planner.draw()
		if (instance_exists(layer_rrt))
			layer_rrt.draw()
	
	}
	

	if (debug_draw_mode != 0) {
		
		// Draw Vision debug draw
		if (instance_exists(vision))
			vision.debug_draw()
	
	}
	
}}

}