// Draw each death particle surface (one per viewport)
for (var i = 0; i < ds_list_size(obj_lobby.players_active); i ++) {
	var _player = obj_lobby.players_active[|i] // corresponding active player
	var _camera = _player.camera
	
	if (instance_exists(_camera)) {
		var _cx = _camera.x - _camera.get_width()/2 // camera top-left position
		var _cy = _camera.y - _camera.get_height()/2
			
		// Create surface if does not exist
		if (!surface_exists(global.death_particles_surface[i])) {
			var _surf_w = view_get_wport(i) // get viewport dimensions
			var _surf_h = view_get_hport(i)
			global.death_particles_surface[i] = surface_create(_surf_w, _surf_w) // surface for drawing death particles to
		}
		
		surface_set_target(global.death_particles_surface[i])
		gpu_set_blendmode(bm_normal)
		
		draw_clear_alpha(c_white, 0) // flush surface
	
		// Draw death particles
		with (obj_death_particles) {
			for (var j = 0; j < ds_list_size(parts); j ++) {
				var _part = parts[|j]
				
				draw_sprite_ext(
					spr_death_particle_metaball, 0, 
					_part.xp - _cx, _part.yp - _cy, 
					1, 1, 0, _part.color, _part.alpha
				) // draw particle
				// offset with camera position since we're drawing to surface that's located at camera
			}
		}
	
		surface_reset_target()
		gpu_set_blendmode(bm_normal)
		
		// Draw surface
		if (i == view_current && surface_exists(global.death_particles_surface[i])) { // check if current viewport that is being rendered matches viewport
			gpu_set_alphatestenable(true)
			gpu_set_alphatestref(100) // reject pixels below this alpha value (not drawn, range: 0 to 255)
			draw_surface(global.death_particles_surface[i], _cx, _cy) // draw surface to viewport (on camera location)
			gpu_set_alphatestenable(false)
		}
	}
}