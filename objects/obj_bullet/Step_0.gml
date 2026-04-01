//Outside room
if (!point_in_rectangle(x, y, 0, 0, room_width, room_height)) {
	instance_destroy()
}

//Hit detection
var hit = noone
var initial_x = x
var initial_y = y
var initial_precision = 4
var minimal_precision = 0.5
var precision = initial_precision
var dist = point_distance(0, 0, speed_x, speed_y)
var dir = point_direction(0, 0, speed_x, speed_y)
for (var prog = 0; prog < dist + precision; prog += precision) {
	if (prog > dist) prog = dist
	x = initial_x + lengthdir_x(prog, dir)
	y = initial_y + lengthdir_y(prog, dir)
	
	// Hit instance not yet found
	if (!instance_exists(hit)) { 
		var hit_masks = ds_list_create()
		instance_position_list(x, y, obj_hitmask, hit_masks, false)				//check collision with hitmasks
		for (var i = 0; i < ds_list_size(hit_masks); i ++) {
			if (hit_masks[|i].height == height &&								//check if on same height level
				hit_masks[|i].player != player) {								
				hit = hit_masks[|i]
				break
			}
		}
		ds_list_destroy(hit_masks)
	
		if (!instance_exists(hit)) {
			var phybodies = ds_list_create()
			instance_position_list(x, y, obj_parent_physics, phybodies, false)	//check collision with phybodies
			for (var i = 0; i < ds_list_size(phybodies); i ++) {
				if (phybodies[|i].height == height &&							//check if on same height level
				(!variable_instance_exists(phybodies[|i], "ignore_hit_event") ||//check ignore hit flag
					!phybodies[|i].ignore_hit_event)) {
					hit = phybodies[|i]
					break
				}
			}
			ds_list_destroy(phybodies)
		}
	}
	
	// Hit instance found
	if (instance_exists(hit) && position_meeting(x, y, hit)) { 
		prog -= precision														//move back and decrease precision
		precision /= 2
		
		// Minimal precision reached, hit detection complete
		if (precision < minimal_precision) {		
			x = initial_x + lengthdir_x(prog + precision, dir)					//final x,y pos is in middle
			y = initial_y + lengthdir_y(prog + precision, dir)	
			if (object_is_ancestor(hit.object_index, obj_parent_physics)) {		//phybody hit
				with(hit)														//apply impulse
					physics_apply_impulse(other.x, other.y, 
						other.speed_x*other.weight, other.speed_y*other.weight)
			}
			
			if (variable_instance_exists(hit, "hit_callback")) {				//check if has hit callback function
				var hit_callback = variable_instance_get(hit, "hit_callback")	//get hit callback function
				if (hit_callback != undefined && is_method(hit_callback))		//call hit callback function
					hit_callback(id)												
			}
			
			instance_destroy()													//destroy self
			break
		}
	}
}