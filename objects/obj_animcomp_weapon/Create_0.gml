event_inherited()

wcomponents = ds_map_create() // maps wcomponent name to obj_animcomp representing wcomponent
wcomponents_draw_order = ds_list_create() // list of wcomponents in draw order

update_wcomponents = undefined // function that updates wcomponents position, defined in children

// Enable or disable wcomponent on this weapon animation component
function set_wcomponent(_wcomponent_name, _enable) {
	if (_enable) {
		var wcomponent = create_groundhigh(0, 0, obj_animcomp)
		wcomponents[? _wcomponent_name] = wcomponent
	} else {
		var wcomponent = wcomponents[? _wcomponent_name]
		if (wcomponent != undefined) {
			instance_destroy(wcomponent)
		}
	}
}

set_wcomponent("barrel", true) // enable barrel component by default

// Override draw function
function draw(_body) {
	if (is_visible) {
		for (var i = 0; i < ds_list_size(wcomponents_draw_order); i ++) {
			var wcomponent = wcomponents_draw_order[|i]
			if (wcomponent == id) { // draw self
				draw_sprite_ext(sprite, index, get_x(_body), get_y(_body), 1, 1, get_rotation(_body), c_white, 1)
			} else { // draw attachments
				wcomponent.draw(_body)
			}
		}
	}
}

// Builds wcomponent_draw_order list from given component names
function new_wcomponents_draw_order(_wcomponent_name1, _wcomponent_name2, etc){
	var new_draw_order = ds_list_create()					// new list
	for (var i = 0; i < argument_count; i ++) {				// loop through given names
		var name = argument[i]
		
		if (name == "1") {
			var wcomponent = id
		} else {
			var wcomponent = wcomponents[? name]
		}
		
		if (wcomponent != undefined && instance_exists(wcomponent)) {
			ds_list_add(new_draw_order, wcomponent)
		}
	}
	
	// Set new list
	ds_list_destroy(wcomponents_draw_order)
	wcomponents_draw_order = new_draw_order
}