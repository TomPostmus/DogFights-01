if (instance_exists(dog)) {
	if (sync_speed) {
		joint_set_speed(dog.joint, sync_speed_x, sync_speed_y)
		sync_speed = false
	}
	if (point_distance(sync_pos_x, sync_pos_y, dog.x, dog.y) > 2) {
		joint_set_position(dog.joint, sync_pos_x, sync_pos_y)
	}
}