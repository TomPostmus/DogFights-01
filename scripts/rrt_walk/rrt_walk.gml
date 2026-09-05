// Walk RRT branch element and when completed choose new one
function rrt_walk(_body_x, _body_y, _body_rot){
	
	var _abort = false // abort flag, e.g. in case player has drifted too far from tree
	var _abortion_tolerance = 35 // deviation distance from path, from which to abort path
	if (!rrt_branch_completed) {
		
		// check timer for completing element
		rrt_walk_timer --
		if (rrt_walk_timer <= 0)
			_abort = true // maximal time for completing element elapsed, abort RRT tree
			
		
		if (rrt_branch.type == RRT_ROOT) {
			rrt_branch_completed = true
		} else if (rrt_branch.type == RRT_TURN) { // execute turn					
			move_input = 0
			turn_input = input_dir(rrt_branch.th_end)
					
			// RRT path abortion
			if (point_distance(_body_x, _body_y, rrt_branch.x, rrt_branch.y) > _abortion_tolerance)
				_abort = true // raise flag
					
			// check completion
			var _completion_tolerance = 3 // completion tolerance (in degrees) on when turn is considered to be completed
			if (abs(angle_difference(rrt_branch.th_end, _body_rot)) < _completion_tolerance) {
				rrt_branch_completed = true
			}
		} else if (rrt_branch.type == RRT_STRAIGHT) {
			move_input = rrt_branch.gear // move according to gear
			turn_input = 0
				
			var _to_player_dir = point_direction(rrt_branch.x, rrt_branch.y, _body_x, _body_y) // direction and distance from line base to player
			var _to_player_dist = point_distance(rrt_branch.x, rrt_branch.y, _body_x, _body_y)
			var _center_offset = lengthdir_y(_to_player_dist, angle_difference(_to_player_dir, rrt_branch.th)) // offset of player from line (treat this lengthdir_y as a sin())
			var _progression = rrt_branch.gear * lengthdir_x(_to_player_dist,  angle_difference(_to_player_dir, rrt_branch.th)) // progression on line (treat this lengthdir_x as cosine)
					
			// steering correction
			//var _correction_tolerance = 3 // tolerance outside which to start correcting
			//if (_center_offset > _correction_tolerance) { // deviated too much on left side
			//	turn_input = rrt_branch.gear // steer to right (or left if in reverse gear)
			//} else if (_center_offset < -_correction_tolerance) { // deviated too much on right side
			//	turn_input = -rrt_branch.gear // steer to left (or right if in reverse gear)
			//} else {
			//	turn_input = input_dir(rrt_branch.th)
			//}
					
			// RRT path abortion
			if (abs(_center_offset) > _abortion_tolerance)
				_abort = true // raise flag
			if (_progression < -_abortion_tolerance || _progression > rrt_branch.l + _abortion_tolerance)
				_abort = true
				
			// check completion
			var _completion_tolerance = 2 // tolerance (in pixels) on when line is considered to be completed
			if (_progression >=  max(0, rrt_branch.l - _completion_tolerance)) { // if progression exceeds is on line segment length
				rrt_branch_completed = true
			}
		} else if (rrt_branch.type == RRT_ARC) {
			move_input = rrt_branch.gear // move according to gear and steering
			turn_input = rrt_branch.gear * rrt_branch.steering
				
			var _to_player_dist = point_distance(rrt_branch.center_x, rrt_branch.center_y, _body_x, _body_y) // distance and direction from arc center to player
			//var _to_player_dir = point_direction(rrt_branch.center_x, rrt_branch.center_y, _body_x, _body_y)
			//var _arc_angle = _to_player_dir + 90 * rrt_branch.steering // what the angle of the arc is from player progression
			//var _progression = rrt_branch.steering * rrt_branch.gear * angle_difference(_arc_angle, rrt_branch.th) // difference from arc starting angle to where player is on arc
			
			var _progression = angle_difference(_body_rot, rrt_branch.th) * rrt_branch.steering * rrt_branch.gear // progression is measure as difference with start angle of arc, normalized to 0, arc_length
			
			// RRT path abortion
			var _abrt_angle_tolerance = 10 //radtodeg(_abortion_tolerance / RRT_R) // tolerance in degrees for arc angle progression
			if (_to_player_dist > RRT_R + _abortion_tolerance || _to_player_dist < RRT_R - _abortion_tolerance) // if distance from arc too large
				_abort = true // raise flag
			if ( _progression < -_abrt_angle_tolerance)
				_abort = true
				
			// check completion
			var _completion_tolerance = 1 // tolerance on when path element is considered to be completed
			if (_progression >= rrt_branch.l - _completion_tolerance) {
				rrt_branch_completed = true
			}
		}			
				
	// If completed walking the current branch wait until next branch is chosen
	} else {
		// do check if we are not drifting in the mean time
		var _dist = point_distance(_body_x, _body_y, rrt_branch.x_end, rrt_branch.y_end) // deviation to end point
		if (_dist >= _abortion_tolerance)
			_abort = true
		
	}
		
	// Check if abort flag was raised
	if (_abort) {
		rrt_mark_del(rrt_branch)
	}
}