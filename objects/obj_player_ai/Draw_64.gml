if (debug_draw_mode > 1) {

	if (instance_exists(grid_planner))
		draw_text(200, 20, "Grid planner state: " + grid_planner.sm_state)
	if (instance_exists(motion_planner))
		draw_text(200, 40, "Motion planner state: " + motion_planner.sm_state)

}