if (global.ingame()) {
	camera = create_camera(0, 0) // create camera (non-persistent object)
	camera.player = id
}