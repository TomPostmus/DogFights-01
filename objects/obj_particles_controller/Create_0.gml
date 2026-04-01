/// @description Insert description here
// You can write your code in this editor

global.hit_particles = part_system_create_layer("TexturesLow", false) // particle system for bullet hit effects
global.pt_hit = part_type_create()
part_type_sprite(global.pt_hit, spr_hit_particle, false, false, false)
//part_type_shape(global.pt_hit, pt_shape_pixel)
part_type_life(global.pt_hit, 8, 13) // lifetime range of parts
part_type_speed(global.pt_hit, 2, 3, 0, 0) // set speed
part_type_blend(global.pt_hit, true);

global.death_particles_surface = array_create(ds_list_size(global.active_viewports), -1) // array of surfaces corresponding to number of active viewports