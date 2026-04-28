// Draw to HUD surface
if (!surface_exists(hud_surf))
	hud_surf = surface_create(hud_width, hud_height) // recreate if doesn't exist

surface_set_target(hud_surf)

	draw_clear_alpha(c_white, 0) // clear surface
	
	// Draw weapon HUDS
	for (var i = 0; i < ds_list_size(obj_lobby.players_active); i ++) { // draw weapon hud windows 
		var _player = obj_lobby.players_active[|i]
		weapon_huds[|i].draw(_player)
	}
	
	// Draw splitscreen line
	if (ds_list_size(obj_lobby.players_active) == 2) {
		draw_set_colour(c_black)
		
		draw_line(hud_width/2, 0, hud_width/2, hud_height)
		//draw_line(hud_width/2+1, 0, hud_width/2+1, hud_height)
	}
	
	// Draw scoreboard HUD
	scrboard_hud.draw(obj_lobby.game)

surface_reset_target()

// Draw HUD surface
draw_surface_ext(hud_surf, 0, 0, hud_scale, hud_scale, 0, c_white, 1) // draw scaled to stretch it to GUI size