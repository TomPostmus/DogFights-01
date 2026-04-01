// Draw each death particle surface (one per viewport)
for (var i = 0; i < ds_list_size(global.active_viewports); i ++) {
	var _vp = global.active_viewports[|i]
	var _camera = global.viewport_to_camera[?_vp] // camera corresponding to viewport
	if (_camera != undefined && instance_exists(_camera)) {
		var _cx = _camera.x - _camera.get_width()/2 // camera top-left position
		var _cy = _camera.y - _camera.get_height()/2
			
		// Create surface if does not exist
		if (!surface_exists(global.death_particles_surface[i])) {
			var _surf_w = view_get_wport(_vp) // get viewport dimensions
			var _surf_h = view_get_hport(_vp)
			global.death_particles_surface[i] = surface_create(_surf_w, _surf_w) // surface for drawing death particles to
		}
		
		surface_set_target(global.death_particles_surface[i])
		gpu_set_blendmode(bm_add)
		
		draw_clear_alpha(c_white, 0) // flush surface
	
		// Draw death particles
		with (obj_death_particles) {
			for (var j = 0; j < ds_list_size(parts); j ++) {
				var _part = parts[|j]
				
				//draw_circle(_part.xp - _cx, _part.yp - _cy, part_radius, false);
				draw_set_alpha(_part.alpha)
				draw_sprite(spr_death_particle_metaball, 0, _part.xp - _cx, _part.yp - _cy) // draw particle
				// offset with camera position since we're drawing to surface that's located at camera			
				draw_set_alpha(1)	
			}
		}
	
		surface_reset_target()
		gpu_set_blendmode(bm_normal)
		
		// Draw surface
		if (_vp == view_current && surface_exists(global.death_particles_surface[i])) { // check if current viewport that is being rendered matches _vp
			gpu_set_alphatestenable(true)
			gpu_set_alphatestref(100) // reject pixels below this alpha value (not drawn, range: 0 to 255)
			draw_surface(global.death_particles_surface[i], _cx, _cy) // draw surface to viewport (on camera location)
			gpu_set_alphatestenable(false)
		}
	}
}


// Draw death particles
//with (obj_death_particles) {
//	for (var i = 0; i < parts_num; i ++) {
//		var _part = parts[i]
//		draw_sprite(spr_death_particle, 0, _part.xp, _part.yp) // draw particle
//		// offset with camera position since we're drawing to surface that's located at camera
//	}
//}