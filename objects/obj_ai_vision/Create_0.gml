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
	type = _type // type of POI
	inst = _inst // instance associated with POI
	x = _x // position of POI
	y = _y
	
	seen_ago = 0 // how many steps ago POI has been seen
}

// Draw vision overlay for debugging
function debug_draw() {

	// Draw landmarks in sight
	for (var i = 0; i < ds_list_size(expl_landmarks_insight); i ++) {
		var _landmark = expl_landmarks_insight[|i]
			
		draw_sprite_ext(spr_ai_exploration_landmark, 0, _landmark.x, _landmark.y , 1, 1, 0, c_white, expl_landmarks_novelty[? _landmark])
			
	}
	
}