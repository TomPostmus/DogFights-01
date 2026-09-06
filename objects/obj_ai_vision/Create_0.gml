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
	if (_type != POI_TYPE.ENEMY && _type != POI_TYPE.TEAMMATE
	 && _type != POI_TYPE.LANDMARK && _type != POI_TYPE.PACKAGE)
		show_error(string("Undefined POI type given in Poi constructor: {}", _type), false)
	
	type = _type // type of POI
	inst = _inst // instance associated with POI
	x = _x // position of POI
	y = _y
	
	seen_ago = 0 // how many steps ago POI has been seen
}

//function draw_sprite_screen_edge()

// Draw vision overlay for debugging
function debug_draw() {
	
	// Draw POIs
	for (var i = 0; i < ds_list_size(pois); i ++) {
		var _pio = pois[|i]
			
		var _alpha = 1 // feature: make marker fade away over time?
		var _spr = spr_ai_exploration_landmark
		draw_sprite_ext(spr_ai_exploration_landmark, 0, _landmark.x, _landmark.y , 1, 1, 0, c_white, _alpha)
	}
	
}