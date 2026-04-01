part_t ++ // update t

// Find near influencing objects
ds_list_clear(collisions)
instance_place_list(x, y, obj_parent_physics, collisions, true) // get collisions of physics objects with collision mask

// Update particles
var _sum_x = 0 // average position for computing collision mask position
var _sum_y = 0
for (var i = 0; i < ds_list_size(parts); i ++) {
	var _part = parts[|i]
	_part.xv += _part.sin_amp * sin(_part.sin_scale * part_t + _part.sin_xshift) // random gassy movement
	_part.yv += _part.sin_amp * sin(_part.sin_scale * part_t + _part.sin_yshift)
	
	// Add influence of objects (player walking through, or walls)
	for (var j = 0; j < min(5, ds_list_size(collisions)); j ++)  { // consider max 5 near objects for influence
		var _col_inst = collisions[|j]
		var _d = point_distance(_part.xp, _part.yp, _col_inst.x, _col_inst.y)
		if (_d < _part.radius) {
			var _force = (_part.radius - _d) * 0.001 // repulsion force
			var _dir = point_direction(_col_inst.x, _col_inst.y, _part.xp, _part.yp) // repulsion direction
			_part.xv += lengthdir_x(_force, _dir)
			_part.yv += lengthdir_y(_force, _dir)
		}
	}
	
	// Add respulsion and attraction from other particles
	for (var j = 0; j < ds_list_size(parts); j ++) {
		if (j != i) {
			var _opart = parts[|j] // other particles
			var _d = point_distance(_part.xp, _part.yp, _opart.xp, _opart.yp)
			var _repulsion = max(_part.radius - _d, 0) * 0.0003 // repulsion force
			var _attraction = max(part_attr_radius - _d, 0) * 0.00005 // attraction force
			var _force = -_attraction + _repulsion //(part_radius - _d) * 0.003
			var _dir = point_direction(_opart.xp, _opart.yp, _part.xp, _part.yp) // repulsion direction
			_part.xv += lengthdir_x(_force, _dir)
			_part.yv += lengthdir_y(_force, _dir)
		}
	}
	
	// Velocity damping
	_part.xv *= 0.96
	_part.yv *= 0.96
	
	// Update movement (taking into account not clipping into solids)
	if (!instance_position(_part.xp + _part.xv, _part.yp, obj_fullsolid_square))
		_part.xp += _part.xv
	if (!instance_position(_part.xp, _part.yp + _part.yv, obj_fullsolid_square))
		_part.yp += _part.yv
	
	_sum_x += _part.xp // update sum
	_sum_y += _part.yp
	
	// Destroy particle if zero alpha
	_part.alpha -= _part.alpha_dimstep
	_part.radius = part_radius * _part.alpha // repulsion radius is dependent on alpha for shrinking effect of the cloud
	if (_part.alpha <= 0) {
		ds_list_delete(parts, i)
		delete _part
		i --
	} 
}

// Update position of collision mask
x = _sum_x / parts_num
y = _sum_y / parts_num

// Destroy self
if (ds_list_empty(parts)) {
	instance_destroy()
}