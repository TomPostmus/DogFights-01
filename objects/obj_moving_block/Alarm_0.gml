if (moving_h_dir != 0) {
	moving_h_dir = 0
} else {
	moving_h_dir = left ? -1 : 1
	left = !left
}

alarm[0] = 100