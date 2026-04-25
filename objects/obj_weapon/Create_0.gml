// obj_weapon (interface): Defines a weapon. Contains weapon constants, weapon logic,
// animation and draw logic for weapon (with arms).

// Player reference
player = noone

// Weapon stats
stats_default = {}	// default stats of bare weapon
stats = {}			// current (modified) stats
mods = {}			// struct mapping mod slot to its current mod (as string) (maps to undefined if no mod)

// Weapon state
aiming = false		// whether aiming weapon (aiming down sight)

// Animation state
anim_frame = 0			// frame id, in case of scripted animation
anim_frame_prev = -1	// previous frame id for detecting draw order change, must be initialized and reset to -1
anim_end = false		// boolean that turns true at end of scripted animation

// Animation components, to initialize call anim_init()
anim_component_weapon = noone		// animation component of weapon
anim_component_weapon2 = noone		// animation component of secondary weapon
anim_component_arm_left = noone		// animation component of left arm
anim_component_arm_right = noone	// animation component of right arm
anim_components = ds_map_create()	// map of active animation components
anim_draw_order = ds_list_create()	// list of animation components to be drawn, in order

// Initialize animation components
function anim_init() {
	// Initialize arm animation components
	anim_component_arm_left = create_groundhigh(0, 0, obj_animcomp_arm_left)
	anim_component_arm_left.player = player
	anim_component_arm_right = create_groundhigh(0, 0, obj_animcomp_arm_right)
	anim_component_arm_right.player = player
}

// Draw weapon at _body
function draw(_body) {
	for (var i = 0; i < ds_list_size(anim_draw_order); i ++) {
		var anim_component = anim_draw_order[|i]
		
		anim_component.draw(_body)
	}
}

// Draw weapon state at hud (hud object given as argument)
function draw_hud(_hud) {
	// implemented in children
}

// Builds new animation components list with given component names,
// possibly recycling components from old list, if names match
function new_anim_draw_order(_component_name1, _component_name2, etc) {
	var new_draw_order = ds_list_create()					// new list
	for (var i = 0; i < argument_count; i ++) {				// loop through given names
		var name = argument[i]
		
		// Recycle components, i.e. components that also exist in old list
		var found = false
		for (var j = 0; j < ds_list_size(anim_draw_order); j ++) {// try finding name in old list
			var component = anim_draw_order[|j]
			if (name == component.name) {
				found = true
				ds_list_add(new_draw_order, component)			// recycle component to new list
				ds_list_delete(anim_draw_order, j)				// remove from old list, for cleaning later
				break
			}
		}
		
		// New components, i.e. components that don't yet exist in old list
		if (!found) {
			if (name == "weapon") {
				var component = anim_component_weapon
			} else if (name == "weapon2") {
				var component = anim_component_weapon2
			} else if (name == "arm_left") {
				var component = anim_component_arm_left
			} else if (name == "arm_right") {
				var component = anim_component_arm_right
			} else {
				var component = create_groundhigh(0, 0, obj_animcomp) // create new component with name
				component.name = name
				component.player = player
			}
			ds_list_add(new_draw_order, component)	// add to new draw_order
			anim_components[? name] = component		// set in active components map
			component.is_visible = true				// set visible to true, useful for weapon that was hidden in animation
		}
	}
	
	// Destroy remaining components in old list
	for (var i = 0; i < ds_list_size(anim_draw_order); i ++) {
		var component = anim_draw_order[|i]
		if (component.name == "weapon" || component.name == "weapon2" ||
			component.name == "arm_left" && component.name == "arm_right") { // special components are just made invisible
			component.is_visible = false
		} else {												// other components are destroyed
			ds_map_delete(anim_components, component.name)
			instance_destroy(component)
		}
	}
	
	// Set new list
	ds_list_destroy(anim_draw_order)
	anim_draw_order = new_draw_order
}

// Reset animation frame counter
function anim_reset() {
	anim_frame = 0
	anim_frame_prev = -1
}

// Check whether animation frame counter has passed a given frame number (_frame)
function anim_check_frame(_frame) {
	return anim_frame >= _frame && anim_frame_prev < _frame
}

// Modify stats with active mods (implemented in children)
function mod_stats() {}

// Set mod slot to value (undefined for disabling mod)
function set_mod(_mod_slot, _mod) {
	var old_mod = variable_struct_get(mods, _mod_slot)
	variable_struct_set(mods, _mod_slot, _mod)
	mod_stats() // call mod_stats to update stats
	
	// Set wcomponent for first weapon
	if (instance_exists(anim_component_weapon)) {
		if (old_mod != undefined)
			anim_component_weapon.set_wcomponent(old_mod, false)	// disable mod that was previously in slot
		if (_mod != undefined)
			anim_component_weapon.set_wcomponent(_mod, true)		// if given, enable new mod
	}
	
	// Set wcomponent for second weapon
	if (instance_exists(anim_component_weapon2)) {
		if (old_mod != undefined)
			anim_component_weapon2.set_wcomponent(old_mod, false)	// disable mod that was previously in slot
		if (_mod != undefined)
			anim_component_weapon2.set_wcomponent(_mod, true)		// if given, enable new mod
	}
}

// Useful getters
function get_weapon_x(_body) {
	if (instance_exists(anim_component_weapon)) {
		return anim_component_weapon.get_x(_body)
	}
}

function get_weapon_y(_body) {
	if (instance_exists(anim_component_weapon)) {
		return anim_component_weapon.get_y(_body)
	}
}

function get_weapon_rotation(_body) {
	if (instance_exists(anim_component_weapon)) {
		return anim_component_weapon.get_rotation(_body)
	}
}