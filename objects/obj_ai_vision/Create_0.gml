player = noone // reference to player object that Vision belongs to
inst_to_poi = ds_map_create() // map of instances that have been seen, to stored Poi object
pois = ds_list_create() // list of POIs that have been seen
//pois_in_sight = ds_list_create() // list of POIs currently in sight


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