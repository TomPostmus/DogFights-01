/// @param dog_obj
/// @param hooks_map
/// @req_sprite spr_striker
function dog_anim_striker_reload_end() {

	var dog = argument[0];
	var hooks = argument[1];
	var this_script = dog_anim_striker_reload_end;

	with (dog) {
		if (anim_arms != this_script) {
			anim_arms_index = 0
			var inst_key = ds_map_find_first(anim_extra_components)
			while (inst_key != undefined) {
				if (instance_exists(anim_extra_components[? inst_key])) instance_destroy(anim_extra_components[? inst_key])
				inst_key = ds_map_find_next(anim_extra_components, inst_key)
			}
			ds_map_clear(anim_extra_components)
		}
		anim_arms = this_script

		if (anim_draw_order != undefined && ds_exists(anim_draw_order, ds_type_list)) ds_list_destroy(anim_draw_order)
		anim_draw_order = ds_list_create();

		if (anim_end) anim_arms_index = 0
		anim_end = false
		var hook_key = ds_map_find_first(hooks)
		while (hook_key != undefined) {
			hooks[? hook_key] = false
			hook_key = ds_map_find_next(hooks, hook_key)
		}

		switch (anim_arms_index) {
			case 0: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.75; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 21.68; arm_left.pos_y = 0.42; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 1: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.75; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 21.68; arm_left.pos_y = -0.38; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 2: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.75; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 21.48; arm_left.pos_y = -1.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 3: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.75; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 21.48; arm_left.pos_y = -1.78; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 4: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 20.68; arm_left.pos_y = -1.98; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = 1.89; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 5: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 20.08; arm_left.pos_y = -2.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 6: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 19.56; arm_left.pos_y = -2.35; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 7: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 19.22; arm_left.pos_y = -2.52; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 8: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 18.18; arm_left.pos_y = -2.52; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 9: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 17.49; arm_left.pos_y = -2.52; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 10: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 16.80; arm_left.pos_y = -2.52; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 11: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 16.11; arm_left.pos_y = -2.52; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 12: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 15.42; arm_left.pos_y = -2.52; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 13: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 14.04; arm_left.pos_y = -2.52; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 14: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 13.35; arm_left.pos_y = -2.52; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 15: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.71; arm_right.index = 4
				arm_left.pos_x = 10.60; arm_left.pos_y = -0.63; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.97; weapon.rotation = -0.39; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 16: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.01; arm_right.pos_y = 2.80; arm_right.index = 4
				arm_left.pos_x = 10.52; arm_left.pos_y = -0.56; arm_left.index = 0
				weapon.pos_x = 24.91; weapon.pos_y = 4.01; weapon.rotation = -0.37; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 17: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.68; arm_right.pos_y = 2.90; arm_right.index = 4
				arm_left.pos_x = 10.45; arm_left.pos_y = -0.49; arm_left.index = 0
				weapon.pos_x = 24.57; weapon.pos_y = 4.06; weapon.rotation = -0.36; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 18: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.34; arm_right.pos_y = 2.99; arm_right.index = 3
				arm_left.pos_x = 10.38; arm_left.pos_y = -0.42; arm_left.index = 0
				weapon.pos_x = 24.22; weapon.pos_y = 4.10; weapon.rotation = -0.34; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 19: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22; arm_right.pos_y = 3.09; arm_right.index = 3
				arm_left.pos_x = 10.31; arm_left.pos_y = -0.35; arm_left.index = 0
				weapon.pos_x = 23.88; weapon.pos_y = 4.14; weapon.rotation = -0.32; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 20: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 21.66; arm_right.pos_y = 3.18; arm_right.index = 3
				arm_left.pos_x = 10.24; arm_left.pos_y = -0.28; arm_left.index = 0
				weapon.pos_x = 23.54; weapon.pos_y = 4.18; weapon.rotation = -0.30; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 21: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 21.32; arm_right.pos_y = 3.28; arm_right.index = 3
				arm_left.pos_x = 10.17; arm_left.pos_y = -0.22; arm_left.index = 0
				weapon.pos_x = 23.20; weapon.pos_y = 4.22; weapon.rotation = -0.28; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 22: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 20.99; arm_right.pos_y = 3.37; arm_right.index = 3
				arm_left.pos_x = 10.10; arm_left.pos_y = -0.15; arm_left.index = 0
				weapon.pos_x = 22.85; weapon.pos_y = 4.26; weapon.rotation = -0.26; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 23: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 20.65; arm_right.pos_y = 3.46; arm_right.index = 2
				arm_left.pos_x = 10.02; arm_left.pos_y = -0.08; arm_left.index = 0
				weapon.pos_x = 22.51; weapon.pos_y = 4.30; weapon.rotation = -0.24; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 24: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 20.31; arm_right.pos_y = 3.56; arm_right.index = 2
				arm_left.pos_x = 9.95; arm_left.pos_y = -0.01; arm_left.index = 0
				weapon.pos_x = 22.17; weapon.pos_y = 4.35; weapon.rotation = -0.22; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 25: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 19.98; arm_right.pos_y = 3.65; arm_right.index = 2
				arm_left.pos_x = 9.88; arm_left.pos_y = 0.06; arm_left.index = 0
				weapon.pos_x = 21.82; weapon.pos_y = 4.39; weapon.rotation = -0.20; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 26: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 19.64; arm_right.pos_y = 3.75; arm_right.index = 2
				arm_left.pos_x = 9.81; arm_left.pos_y = 0.13; arm_left.index = 0
				weapon.pos_x = 21.48; weapon.pos_y = 4.43; weapon.rotation = -0.18; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 27: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 19.30; arm_right.pos_y = 3.84; arm_right.index = 2
				arm_left.pos_x = 9.74; arm_left.pos_y = 0.20; arm_left.index = 0
				weapon.pos_x = 21.14; weapon.pos_y = 4.47; weapon.rotation = -0.16; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 28: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 18.96; arm_right.pos_y = 3.94; arm_right.index = 1
				arm_left.pos_x = 9.67; arm_left.pos_y = 0.26; arm_left.index = 0
				weapon.pos_x = 20.80; weapon.pos_y = 4.51; weapon.rotation = -0.14; weapon.sprite = spr_striker; weapon.index = 2; weapon.is_visible = true
				break
			case 29: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 18.63; arm_right.pos_y = 4.03; arm_right.index = 1
				arm_left.pos_x = 9.59; arm_left.pos_y = 0.33; arm_left.index = 0
				weapon.pos_x = 20.45; weapon.pos_y = 4.55; weapon.rotation = -0.12; weapon.sprite = spr_striker; weapon.index = 2; weapon.is_visible = true
				break
			case 30: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 18.29; arm_right.pos_y = 4.13; arm_right.index = 1
				arm_left.pos_x = 9.52; arm_left.pos_y = 0.40; arm_left.index = 0
				weapon.pos_x = 20.11; weapon.pos_y = 4.59; weapon.rotation = -0.10; weapon.sprite = spr_striker; weapon.index = 1; weapon.is_visible = true
				break
			case 31: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 17.95; arm_right.pos_y = 4.22; arm_right.index = 1
				arm_left.pos_x = 9.45; arm_left.pos_y = 0.47; arm_left.index = 0
				weapon.pos_x = 19.77; weapon.pos_y = 4.63; weapon.rotation = -0.08; weapon.sprite = spr_striker; weapon.index = 1; weapon.is_visible = true
				break
			case 32: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 17.61; arm_right.pos_y = 4.32; arm_right.index = 1
				arm_left.pos_x = 9.38; arm_left.pos_y = 0.54; arm_left.index = 0
				weapon.pos_x = 19.43; weapon.pos_y = 4.68; weapon.rotation = -0.06; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 33: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 17.27; arm_right.pos_y = 4.41; arm_right.index = 0
				arm_left.pos_x = 14.48; arm_left.pos_y = -1.12; arm_left.index = 0
				weapon.pos_x = 19.09; weapon.pos_y = 4.72; weapon.rotation = -0.04; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 34: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.94; arm_right.pos_y = 4.51; arm_right.index = 0
				arm_left.pos_x = 16.13; arm_left.pos_y = -0.70; arm_left.index = 0
				weapon.pos_x = 18.74; weapon.pos_y = 4.76; weapon.rotation = -0.02; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 35: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 17.44; arm_left.pos_y = -0.46; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 36: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 18.48; arm_left.pos_y = -0.12; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 37: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 18.99; arm_left.pos_y = 0.40; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 38: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 19.68; arm_left.pos_y = 1.09; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 39: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 20.89; arm_left.pos_y = 1.78; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 40: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 22.27; arm_left.pos_y = 2.47; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 41: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 23.13; arm_left.pos_y = 3.16; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 42: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 23.82; arm_left.pos_y = 3.85; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 43: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 25.03; arm_left.pos_y = 4.37; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 44: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 25.03; arm_left.pos_y = 4.88; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				break
			case 45: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 25.20; arm_left.pos_y = 5.40; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_end = true
				break
		}
	}



}
