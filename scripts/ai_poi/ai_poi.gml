enum AIPOI_TYPE { // types of Points of Interest (POI)
	ENEMY,
	TEAMMATE,
	LANDMARK,
	PACKAGE
}

function AIPoi(_inst, _x, _y) constructor {
	
	inst = _inst // instance associated with POI
	x = _x // position of POI
	y = _y
	
	seen_ago = 0 // how many steps ago POI has been seen
}

function AIPoiLandmark(_inst, _x, _y) : AIPoi(_inst, _x, _y) constructor {
	
	type = AIPOI_TYPE.LANDMARK
	type_name = "Landmark"
	
	novel_flag = true // whether Landmark is novel for player

}

function AIPoiEnemy(_inst, _x, _y) : AIPoi(_inst, _x, _y) constructor {
	
	type = AIPOI_TYPE.ENEMY
	type_name = "Enemy"

}

function AIPoiTeammate(_inst, _x, _y) : AIPoi(_inst, _x, _y) constructor {
	
	type = AIPOI_TYPE.TEAMMATE
	type_name = "Teammate"

}

function AIPoiPackage(_inst, _x, _y) : AIPoi(_inst, _x, _y) constructor {
	
	type = AIPOI_TYPE.PACKAGE
	type_name = "Package"

}