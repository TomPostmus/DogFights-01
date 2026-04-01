/// @param dog_obj
/// @param hooks_map
/// @req_sprite spr_striker
/// @req_sprite spr_striker_shell
function dog_anim_striker_reload_insert1() {

	var dog = argument[0];
	var hooks = argument[1];
	var this_script = dog_anim_striker_reload_insert1;

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

		if (!ds_map_exists(anim_extra_components, "shell")) {
			var component = create_controllers(obj_animcomp);
			anim_extra_components[? "shell"] = component
		}

		if (anim_end) anim_arms_index = 0
		anim_end = false
		var hook_key = ds_map_find_first(hooks)
		while (hook_key != undefined) {
			hooks[? hook_key] = false
			hook_key = ds_map_find_next(hooks, hook_key)
		}

		switch (anim_arms_index) {
			case 0: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 21.68; arm_left.pos_y = 0.42; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 1: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 20.43; arm_left.pos_y = 0.35; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 2: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 19.18; arm_left.pos_y = 0.27; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 3: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.28; arm_right.pos_y = 2.21; arm_right.index = 4
				arm_left.pos_x = 17.93; arm_left.pos_y = 0.20; arm_left.index = 0
				weapon.pos_x = 25.15; weapon.pos_y = 2.96; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 4: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.22; arm_right.pos_y = 2.27; arm_right.index = 4
				arm_left.pos_x = 16.68; arm_left.pos_y = 0.12; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 3.10; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 5: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.15; arm_right.pos_y = 2.34; arm_right.index = 4
				arm_left.pos_x = 15.43; arm_left.pos_y = 0.05; arm_left.index = 0
				weapon.pos_x = 24.95; weapon.pos_y = 3.23; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 6: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.08; arm_right.pos_y = 2.41; arm_right.index = 4
				arm_left.pos_x = 14.18; arm_left.pos_y = -0.03; arm_left.index = 0
				weapon.pos_x = 24.85; weapon.pos_y = 3.36; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 7: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.02; arm_right.pos_y = 2.47; arm_right.index = 4
				arm_left.pos_x = 12.93; arm_left.pos_y = -0.10; arm_left.index = 0
				weapon.pos_x = 24.75; weapon.pos_y = 3.50; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 8: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 9: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 10: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 11: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 12: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 13: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 14.20; anim_extra_components[? "shell"].pos_y = -1.80; anim_extra_components[? "shell"].rotation = -7.03; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 14: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 14.20; anim_extra_components[? "shell"].pos_y = -1.80; anim_extra_components[? "shell"].rotation = -7.03; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 15: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 14.20; anim_extra_components[? "shell"].pos_y = -1.80; anim_extra_components[? "shell"].rotation = -7.03; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 16: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 14.20; anim_extra_components[? "shell"].pos_y = -1.80; anim_extra_components[? "shell"].rotation = -7.03; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 17: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 2.54; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 14.20; anim_extra_components[? "shell"].pos_y = -1.80; anim_extra_components[? "shell"].rotation = -7.03; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 24.65; weapon.pos_y = 3.63; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 18: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.10; arm_right.pos_y = 2.44; arm_right.index = 4
				arm_left.pos_x = 13.35; arm_left.pos_y = -0.33; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 15.90; anim_extra_components[? "shell"].pos_y = -1.85; anim_extra_components[? "shell"].rotation = -6.26; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 24.85; weapon.pos_y = 3.53; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 19: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.25; arm_right.pos_y = 2.34; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 17.60; anim_extra_components[? "shell"].pos_y = -1.90; anim_extra_components[? "shell"].rotation = -5.50; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 15.03; arm_left.pos_y = -0.48; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 3.43; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 20: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.40; arm_right.pos_y = 2.24; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 19.30; anim_extra_components[? "shell"].pos_y = -1.95; anim_extra_components[? "shell"].rotation = -4.74; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 16.70; arm_left.pos_y = -0.63; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.33; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 21: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.14; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 21; anim_extra_components[? "shell"].pos_y = -2; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 18.38; arm_left.pos_y = -0.78; arm_left.index = 0
				weapon.pos_x = 25.45; weapon.pos_y = 3.23; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 22: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.50; arm_right.pos_y = 1.99; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 21.35; anim_extra_components[? "shell"].pos_y = -1.80; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 18.85; arm_left.pos_y = -0.63; arm_left.index = 0
				weapon.pos_x = 25.40; weapon.pos_y = 3.13; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 23: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.45; arm_right.pos_y = 1.84; arm_right.index = 4
				arm_left.pos_x = 19.33; arm_left.pos_y = -0.48; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 21.70; anim_extra_components[? "shell"].pos_y = -1.60; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.35; weapon.pos_y = 3.03; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 24: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.40; arm_right.pos_y = 1.69; arm_right.index = 4
				arm_left.pos_x = 19.80; arm_left.pos_y = -0.33; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 22.05; anim_extra_components[? "shell"].pos_y = -1.40; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.30; weapon.pos_y = 2.93; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 25: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 20.28; arm_left.pos_y = -0.18; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 22.40; anim_extra_components[? "shell"].pos_y = -1.20; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 26: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 19.68; arm_left.pos_y = 0.02; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 22.40; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 27: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 20.88; arm_left.pos_y = 0.42; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 24.20; anim_extra_components[? "shell"].pos_y = -0.40; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				hooks[? "shell_insert"] = true
				break
			case 28: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 21.68; arm_left.pos_y = 0.42; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 25; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 29: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 26; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 30: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.75; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.38; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 26.60; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.65; weapon.pos_y = 2.83; weapon.rotation = 1.98; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 31: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.05; weapon.pos_y = 2.83; weapon.rotation = 1.35; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 32: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.05; weapon.pos_y = 2.83; weapon.rotation = 1.35; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 33: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.05; weapon.pos_y = 2.83; weapon.rotation = 1.35; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 34: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.05; weapon.pos_y = 2.83; weapon.rotation = 1.35; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 35: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.05; weapon.pos_y = 2.83; weapon.rotation = 1.35; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 36: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.05; weapon.pos_y = 2.83; weapon.rotation = 1.35; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 37: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.05; weapon.pos_y = 2.83; weapon.rotation = 1.35; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 38: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.05; weapon.pos_y = 2.83; weapon.rotation = 1.35; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 39: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.05; weapon.pos_y = 2.83; weapon.rotation = 1.35; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 40: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.95; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 23.33; arm_left.pos_y = 0.27; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.85; weapon.pos_y = 2.83; weapon.rotation = 1.66; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 41: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.75; arm_right.pos_y = 1.74; arm_right.index = 4
				arm_left.pos_x = 22.78; arm_left.pos_y = 0.32; arm_left.index = 0
				weapon.pos_x = 25.65; weapon.pos_y = 2.83; weapon.rotation = 1.98; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 42: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 22.23; arm_left.pos_y = 0.37; arm_left.index = 0
				weapon.pos_x = 25.45; weapon.pos_y = 2.83; weapon.rotation = 2.30; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 43: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 21.68; arm_left.pos_y = 0.42; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				anim_end = true
				break
		}
	}



}
