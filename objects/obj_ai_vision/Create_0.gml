player = noone // reference to player object that Vision belongs to
inst_to_poi = ds_map_create() // map of instances that have been seen, to stored AIPoi object
pois = ds_list_create() // list of POIs that have been seen
enemies = ds_list_create() // list of enemy, teammate, package and landmark POIs that it has seen
teammates = ds_list_create()
packages = ds_list_create()
landmarks = ds_list_create()


//enum SCREEN_EDGE {
//	E, NE, N, NW, W, SW, S, SE // 
//}

//function draw_sprite_screen_edge()

// Draw vision overlay for debugging
function debug_draw() {
	
	// Draw POIs
	var _m = 10
	for (var i = 0; i < ds_list_size(pois); i ++) {
		var _pio = pois[|i]
			
		var _alpha = 1 // feature: make marker fade away over time?
		draw_sprite_ext(spr_ai_vision_debug_marker, 0, _pio.x, _pio.y , 1, 1, 0, c_white, _alpha)
		
		draw_set_colour(c_fuchsia)
		draw_set_font(ft_normal)
		draw_text(_pio.x + _m, _pio.y + _m, string("POI: {0}", _pio.type_name))
	}
	
}