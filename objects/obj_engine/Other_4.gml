if (state == "initialized" || state == "running") {
	
	spawns_controller = create_controllers(obj_spawns_controller)
	hud = create_hud(0, 0, obj_hud)
	
	state = "running"
	global.engine_running = true // set global

}