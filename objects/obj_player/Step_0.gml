// When character has spawned
if (instance_exists(character) && instance_exists(character.body)) {
	
	var _body_x = character.body.trunk.x
	var _body_y = character.body.trunk.y
	
	// Initialize camera
	if (!instance_exists(camera)) {
		var _zoom_init = 3
		camera = create_camera(_body_x, _body_y, _zoom_init) // create camera (non-persistent object)
		camera.player = id
	}
	
}