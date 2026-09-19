player = noone // reference to player object that Vision belongs to
inst_to_poi = ds_map_create() // map of instances that have been seen, to stored Poi object
pois = ds_list_create() // list of POIs that have been seen
enemies = ds_list_create() // list of enemy, teammate, package and landmark POIs that it has seen
teammates = ds_list_create()
packages = ds_list_create()
landmarks = ds_list_create()


enum POI_TYPE { // types of Points of Interest (POI)
	ENEMY,
	TEAMMATE,
	LANDMARK,
	PACKAGE
}

function Poi(_type, _inst, _x, _y) constructor {
	
	switch (_type) { // check type and set type_name string
		case POI_TYPE.ENEMY: type_name = "Enemy"; break
		case POI_TYPE.TEAMMATE: type_name = "Teammate"; break
		case POI_TYPE.LANDMARK: type_name = "Landmark"; break
		case POI_TYPE.PACKAGE: type_name = "Package"; break
		default: 
			show_error(string("Undefined POI type given in Poi constructor: {0}", _type), true)
	}
	
	type = _type // type of POI
	inst = _inst // instance associated with POI
	x = _x // position of POI
	y = _y
	
	seen_ago = 0 // how many steps ago POI has been seen
}

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