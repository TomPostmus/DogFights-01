event_inherited()

turn_input = 0 // reset controls
move_input = 0
input_attack = false

if (global.ingame()) {	
	
	// Prune APF sources from list that no longer exist
	for (var i = 0; i < ds_list_size(apf_sources); i ++) {
		if (!instance_exists(apf_sources[|i])) {
			ds_list_delete(apf_sources, i)
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
						
						//if (_attrdrop) {
						//	var _attr_source = create_groundhigh(_target_x, _target_y, obj_ai_apf_source)
						//	_attr_source.rep_type = false // set to attraction source
						//	ds_list_add(apf_sources, _attr_source)
						//}
					}
				}
			}
		}
	
		// Pick target
		target = noone
		//rrt_field = undefined // by default (e.g. no target), no motion planning field
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
			
			rrt_field = rrt_apf_manifold
			
			var _line_of_sight = line_shootable(target_x, target_y) // check if line shootable to target
			if (_line_of_sight) {
				
				//rrt_field = undefined
				//if (rrt_branch != undefined) {
				//	rrt_mark_del(rrt_branch)
				//	rrt_branch = undefined
				//}
				
				//var _target_dir = point_direction(_body_x, _body_y, target_x, target_y)
				//turn_input = input_dir(_target_dir)
				
				//var _shoot_precision = 3
				//input_attack = abs(angle_difference(_body_rot, _target_dir) <= _shoot_precision)
				
				apf_sources[|0].x = target_x // put attraction source onto target
				apf_sources[|0].y = target_y
				rrt_field = rrt_shoot_target_manifold
				input_attack = true
				
			} else {
				
				apf_sources[|0].x = target_x // put attraction source onto target
				apf_sources[|0].y = target_y
				rrt_field = rrt_apf_manifold
				input_attack = false
				
			}
			//rrt_field = _line_of_sight ? rrt_shoot_target_field : rrt_apf_manifold // oneliners
			//input_attack = _line_of_sight && rrt_branch != undefined && rrt_branch.h_cost <= rrt_tolerance
		}
		
		// RRT* motion planning
		if (rrt_field != undefined) {
			if (rrt_branch == undefined) { // if there is no current node
				rrt_branch = new rrt_root_element(_body_x, _body_y, _body_rot) // create root node of tree
				ds_list_add(rrt_branches, rrt_branch)
				ds_list_add(rrt_branches_open, rrt_branch)
				rrt_walk_timer = rrt_walk_maxtime // reset timer
				rrt_update_costs()
			}
			
			// do movement for walking current RRT branch
			rrt_walk(_body_x, _body_y, _body_rot) 
			if (rrt_branch_completed) {// choose next branch if completed current branch
				rrt_choose_next_branch()
				rrt_clean() // delete branches marked for deletion
			}
			
			// update tree
			rrt_grow_or_prune(_body_x, _body_y, _body_rot) // update RRT
			rrt_update_costs() // update cost variables of branches based on current field status
			rrt_clean() // delete branches marked for deletion
		}
		
	}
	
	// Send inputs to character
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
