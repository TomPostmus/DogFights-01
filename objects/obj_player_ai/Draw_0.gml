//if (global.ingame() && instance_exists(character) && instance_exists(character.body)) {
//	var _body = character.body
//	var _weapon = character.weapon
	
//	var _body_x = _body.get_x()
//	var _body_y = _body.get_y()
//	var _body_rot = _body.get_rotation()

//}

for (var _pi = 0; _pi < ds_list_size(obj_lobby.players_active); _pi ++) { // only draw if AI is active player and we are currently drawing to its viewport
if (obj_lobby.players_active[|_pi] == id && view_current == _pi) {
		
	if (debug_draw_mode == 1) {
	
		// Draw RRT Grid layer
		//layer_agrid.draw(true)
		if (instance_exists(layer_rrt))
			layer_rrt.draw()
	
	} else if (debug_draw_mode == 2) {
		
		// Draw A* Grid layer
		if (instance_exists(layer_agrid))
			layer_agrid.draw()
	
	} else if (debug_draw_mode == 3) {
		
		// Draw both
		if (instance_exists(layer_agrid))
			layer_agrid.draw()
		if (instance_exists(layer_rrt))
			layer_rrt.draw()
	
	}
	

	if (debug_draw_mode != 0) {
		
		// Draw Vision debug draw
		if (instance_exists(vision))
			vision.debug_draw()
	
	}
	
}}