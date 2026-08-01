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
		layer_rrt.draw()
	
	} else if (debug_draw_mode == 2) {
		
		// Draw A* Grid layer
		layer_agrid.draw()
	
	} else if (debug_draw_mode == 3) {
		
		// Draw both
		layer_agrid.draw()
		layer_rrt.draw()
	
	}
	

	if (debug_draw_mode != 0) {
		
		// Draw exploration layer
		{
		
			// Draw landmarks in sight
			for (var i = 0; i < ds_list_size(expl_landmarks_insight); i ++) {
				var _landmark = expl_landmarks_insight[|i]
			
				draw_sprite_ext(spr_ai_exploration_landmark, 0, _landmark.x, _landmark.y , 1, 1, 0, c_white, expl_landmarks_novelty[? _landmark])
				//draw_set_alpha(expl_landmarks_novelty[? _landmark])
				//with (_landmark) draw_self()
				//draw_set_alpha(1)
			
			}
		
		}
		
		// Draw APF exploration grid
		//for (var i = 0; i < ds_grid_width(apf_explgrid); i ++) {
		//	for (var j = 0; j < ds_grid_height(apf_explgrid); j ++) {
		//		var _candy = apf_explgrid[# i, j]
		
		//		if (_candy > 0) {
		//			var _cell_x = (i + 0.5) * apf_explgrid_cell_size
		//			var _cell_y = (j + 0.5) * apf_explgrid_cell_size
			
		//			draw_set_alpha(_candy)
		//			draw_set_colour(c_fuchsia)
		//			draw_circle(_cell_x, _cell_y, 3, false)
	
		//			draw_set_alpha(1)
		//		}
		//	}
		//}
	
	}
	
}}