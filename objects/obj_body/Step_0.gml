//Previous variables
/*previous_x = x
previous_y = y
previous_rot = rotation
previous_speed_x = speed_x
previous_speed_y = speed_y*/

// Speed change
speed_change_x = get_speed_x() - previous_speed_x
speed_change_y = get_speed_y() - previous_speed_y
speed_change_rot = get_speed_rot() - previous_speed_rot
previous_speed_x = get_speed_x()
previous_speed_y = get_speed_y()
previous_speed_rot = get_speed_rot()

// TODO limit rotation with too big trunk angle difference