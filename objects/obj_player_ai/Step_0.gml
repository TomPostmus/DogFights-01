event_inherited()

turn_input = 0 // reset controls
move_input = 0
input_attack = false

if (global.ingame()) {
		
	// Delete RTT branch if it is marked for deletion
	for (var i = 0; i < ds_list_size(rrt_branches); i ++) { // loop through all branches
		var _branch = rrt_branches[|i]
		
		if (_branch.del) {
			var j = ds_list_find_index(rrt_branches_open, _branch) // also find in open branches list
			if (j != -1)
				ds_list_delete(rrt_branches_open, j) // remove from open branches
		
			ds_list_destroy(_branch.links) // destroy its links data structure
			delete _branch // delete struct
			ds_list_delete(rrt_branches, i) // remove from list
			i --
		}
	}

	// Basic behaviour
	if (instance_exists(character) && instance_exists(character.body)) {
		var body = character.body
		var weapon = character.weapon
	
		var _body_x = body.get_x()
		var _body_y = body.get_y()
		var _body_rot = body.get_rotation()
	
		// Spot enemies
		if (instance_exists(camera)) {
			var _attrdrop = false
			apf_target_attraction_timer ++
			if (apf_target_attraction_timer > apf_target_attraction_every) {
				_attrdrop = true
				apf_target_attraction_timer = 0
			}
			
			ds_list_clear(targets)
			for (var i = 0; i < instance_number(obj_character); i ++) {
				var _character_insight = instance_find(obj_character, i);
				if (_character_insight != character && instance_exists(_character_insight.body) && instance_exists(_character_insight.body.trunk)
					&& (character.team_id == undefined || character.team_id != _character_insight.team_id)
					&& !_character_insight.hp_protection) {
					var _target_x = _character_insight.body.trunk.x
					var _target_y = _character_insight.body.trunk.y
						
					if (point_in_rectangle(_target_x, _target_y, camera.x - camera.get_width()/2, camera.y - camera.get_height()/2, camera.x + camera.get_width()/2, camera.y + camera.get_height()/2)) {
						ds_list_add(targets, _character_insight)
						//var _trunk = _character_insight.body.trunk
						//ds_list_add(apf_sources, [_trunk.x, _trunk.y, 150, 0, 300, 1])
						
						if (_attrdrop) {
							var _attr_source = create_groundhigh(_target_x, _target_y, obj_ai_apf_source)
							_attr_source.rep_type = false // set to attraction sourece
							ds_list_add(apf_sources, _attr_source)
						}
					}
				}
			}
		}
	
		// Pick target
		target = noone
		rrt_field = undefined // by default (e.g. no target), no motion planning field
		var _dist = infinity;
		for (var i = 0; i < ds_list_size(targets); i ++) {
			var _target = targets[|i]
			if (instance_exists(_target.body) && instance_exists(_target.body.trunk)) {
				var _trunk = _target.body.trunk
				var _new_dist = point_distance(_body_x, _body_x, _trunk.x, _trunk.y)
				
				if (_new_dist < _dist) { // check distance
					target = _target // pick target at closest distance
					_dist = _new_dist
				}
			}
		}
		
		if (instance_exists(target) && instance_exists(target.body) && instance_exists(target.body.trunk)) {
			target_x = target.body.trunk.x
			target_y = target.body.trunk.y
			
			var _line_of_sight = line_shootable(target_x, target_y) // check if line shootable to target
			
			rrt_field = rrt_apf_manifold
			//rrt_field = _line_of_sight ? rrt_shoot_target_field : rrt_apf_manifold
			//input_attack = _line_of_sight && rrt_branch != undefined && rrt_branch.h_cost <= rrt_tolerance
		}
		
		// RRT* motion planning
		if (rrt_field != undefined) {
			if (rrt_branch = undefined) { // if there is no current node
			
				rrt_init(_body_x, _body_y, _body_rot) // initialize RRT
				rrt_walk_timer = rrt_walk_maxtime // reset timer
			
			} else {
			
				rrt_update(_body_x, _body_y, _body_rot) // update RRT
				rrt_walk(_body_x, _body_y, _body_rot) // walk current RRT branch
			
			}
		}
		
		// Prune repulsion sources that have maxed out in strength
		for (var i = 0; i < ds_list_size(apf_sources); i ++) {
			var _source = apf_sources[|i]
			if (_source.strength >= 1) {
				instance_destroy(_source)
				ds_list_delete(apf_sources, i)
				i --
			}
		}
	}
	
	// Send inputs
	if (instance_exists(character)) {
	
		// Send to character
		character.interact = input_interact
	
		// Send to weapon
		if (instance_exists(character.weapon)) {
			character.weapon.trigger = input_attack
			character.weapon.aiming = input_attack2
			character.weapon.input_reload = input_reload
			character.weapon.input_firemode = input_firemode
		}

		// Send to movement controller
		character.movement.move_input = move_input
		character.movement.turn_input = turn_input

	}

}
