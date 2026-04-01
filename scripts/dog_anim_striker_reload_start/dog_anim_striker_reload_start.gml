/// @param dog_obj
/// @param hooks_map
/// @req_sprite spr_striker
/// @req_sprite spr_striker_shell
function dog_anim_striker_reload_start() {

	var dog = argument[0];
	var hooks = argument[1];
	var this_script = dog_anim_striker_reload_start;

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
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 25.20; arm_left.pos_y = 5.40; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 1: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 24.60; arm_left.pos_y = 5.40; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 2: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 24.60; arm_left.pos_y = 5.20; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 3: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 23.80; arm_left.pos_y = 4.60; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 4: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 23.40; arm_left.pos_y = 4; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 5: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 16.60; arm_right.pos_y = 4.60; arm_right.index = 0
				arm_left.pos_x = 23.40; arm_left.pos_y = 3.60; arm_left.index = 0
				weapon.pos_x = 18.40; weapon.pos_y = 4.80; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 6: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 18.92; arm_right.pos_y = 4.96; arm_right.index = 0
				arm_left.pos_x = 22.88; arm_left.pos_y = 3.26; arm_left.index = 0
				weapon.pos_x = 18.58; weapon.pos_y = 5.34; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 7: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 18.92; arm_right.pos_y = 4.96; arm_right.index = 0
				arm_left.pos_x = 22.08; arm_left.pos_y = 2.46; arm_left.index = 0
				weapon.pos_x = 18.58; weapon.pos_y = 5.34; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 8: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 18.92; arm_right.pos_y = 4.96; arm_right.index = 0
				arm_left.pos_x = 21.28; arm_left.pos_y = 2.06; arm_left.index = 0
				weapon.pos_x = 18.58; weapon.pos_y = 5.34; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 9: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 18.92; arm_right.pos_y = 4.96; arm_right.index = 0
				arm_left.pos_x = 21.09; arm_left.pos_y = 1.47; arm_left.index = 0
				weapon.pos_x = 18.58; weapon.pos_y = 5.34; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 10: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 18.92; arm_right.pos_y = 4.96; arm_right.index = 0
				arm_left.pos_x = 20.09; arm_left.pos_y = 0.67; arm_left.index = 0
				weapon.pos_x = 18.58; weapon.pos_y = 5.34; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 11: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 18.55; arm_right.pos_y = 4.54; arm_right.index = 0
				arm_left.pos_x = 17.88; arm_left.pos_y = 0.22; arm_left.index = 0
				weapon.pos_x = 19.05; weapon.pos_y = 5.63; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 12: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 20.35; arm_right.pos_y = 5.14; arm_right.index = 0
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 19.65; weapon.pos_y = 6.23; weapon.rotation = 0; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 13: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 20.60; arm_right.pos_y = 4.95; arm_right.index = 0
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 19.98; weapon.pos_y = 6.08; weapon.rotation = -0.35; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 14: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 20.84; arm_right.pos_y = 4.76; arm_right.index = 0
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 20.31; weapon.pos_y = 5.92; weapon.rotation = -0.71; weapon.sprite = spr_striker; weapon.index = 0; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 15: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 21.09; arm_right.pos_y = 4.57; arm_right.index = 1
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 20.64; weapon.pos_y = 5.77; weapon.rotation = -1.06; weapon.sprite = spr_striker; weapon.index = 1; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 16: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 21.34; arm_right.pos_y = 4.38; arm_right.index = 1
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 20.97; weapon.pos_y = 5.62; weapon.rotation = -1.41; weapon.sprite = spr_striker; weapon.index = 1; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 17: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 21.59; arm_right.pos_y = 4.19; arm_right.index = 1
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 21.30; weapon.pos_y = 5.46; weapon.rotation = -1.77; weapon.sprite = spr_striker; weapon.index = 1; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 18: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 21.83; arm_right.pos_y = 4.01; arm_right.index = 1
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 21.63; weapon.pos_y = 5.31; weapon.rotation = -2.12; weapon.sprite = spr_striker; weapon.index = 1; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 19: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.08; arm_right.pos_y = 3.82; arm_right.index = 2
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 21.96; weapon.pos_y = 5.16; weapon.rotation = -2.48; weapon.sprite = spr_striker; weapon.index = 1; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 20: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.33; arm_right.pos_y = 3.63; arm_right.index = 2
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 22.29; weapon.pos_y = 5.01; weapon.rotation = -2.83; weapon.sprite = spr_striker; weapon.index = 1; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 21: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.57; arm_right.pos_y = 3.44; arm_right.index = 2
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 22.61; weapon.pos_y = 4.85; weapon.rotation = -3.18; weapon.sprite = spr_striker; weapon.index = 2; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 22: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.82; arm_right.pos_y = 3.25; arm_right.index = 2
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 22.94; weapon.pos_y = 4.70; weapon.rotation = -3.54; weapon.sprite = spr_striker; weapon.index = 2; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 23: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.07; arm_right.pos_y = 3.07; arm_right.index = 3
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 23.27; weapon.pos_y = 4.55; weapon.rotation = -3.89; weapon.sprite = spr_striker; weapon.index = 2; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 24: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.31; arm_right.pos_y = 2.88; arm_right.index = 3
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 23.60; weapon.pos_y = 4.39; weapon.rotation = -4.24; weapon.sprite = spr_striker; weapon.index = 2; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 25: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.56; arm_right.pos_y = 2.69; arm_right.index = 3
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 23.93; weapon.pos_y = 4.24; weapon.rotation = -4.60; weapon.sprite = spr_striker; weapon.index = 2; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 26: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.81; arm_right.pos_y = 2.50; arm_right.index = 3
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 24.26; weapon.pos_y = 4.09; weapon.rotation = -4.95; weapon.sprite = spr_striker; weapon.index = 2; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 27: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.06; arm_right.pos_y = 2.31; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 24.59; weapon.pos_y = 3.93; weapon.rotation = -5.31; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 28: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.30; arm_right.pos_y = 2.12; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 24.92; weapon.pos_y = 3.78; weapon.rotation = -5.66; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 29: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 30: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 31: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 32: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 33: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 34: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 35: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 36: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 37: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 38: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 39: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 40: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 41: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.94; arm_right.index = 4
				arm_left.pos_x = 11.68; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 3.63; weapon.rotation = -6.01; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 42: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.89; arm_right.index = 4
				arm_left.pos_x = 12.68; arm_left.pos_y = -0.58; arm_left.index = 0
				weapon.pos_x = 25.35; weapon.pos_y = 3.53; weapon.rotation = -4.83; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 43: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.84; arm_right.index = 4
				arm_left.pos_x = 13.68; arm_left.pos_y = -0.98; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 17.20; anim_extra_components[? "shell"].pos_y = -4.60; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.45; weapon.pos_y = 3.43; weapon.rotation = -3.64; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 44: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.79; arm_right.index = 4
				arm_left.pos_x = 14.68; arm_left.pos_y = -1.38; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 17.20; anim_extra_components[? "shell"].pos_y = -4.60; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.55; weapon.pos_y = 3.33; weapon.rotation = -2.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 45: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.74; arm_right.index = 4
				arm_left.pos_x = 15.68; arm_left.pos_y = -1.78; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 17.20; anim_extra_components[? "shell"].pos_y = -4.60; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.65; weapon.pos_y = 3.23; weapon.rotation = -1.27; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 46: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.45; arm_right.pos_y = 1.64; arm_right.index = 4
				arm_left.pos_x = 16.83; arm_left.pos_y = -1.38; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 18.50; anim_extra_components[? "shell"].pos_y = -3.75; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.55; weapon.pos_y = 3.13; weapon.rotation = -0.30; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 47: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.35; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 17.98; arm_left.pos_y = -0.98; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 19.80; anim_extra_components[? "shell"].pos_y = -2.90; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.45; weapon.pos_y = 3.03; weapon.rotation = 0.67; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 48: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.25; arm_right.pos_y = 1.44; arm_right.index = 4
				arm_left.pos_x = 19.13; arm_left.pos_y = -0.58; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 21.10; anim_extra_components[? "shell"].pos_y = -2.05; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.35; weapon.pos_y = 2.93; weapon.rotation = 1.65; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 49: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.34; arm_right.index = 4
				arm_left.pos_x = 20.28; arm_left.pos_y = -0.18; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 22.40; anim_extra_components[? "shell"].pos_y = -1.20; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 50: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.34; arm_right.index = 4
				arm_left.pos_x = 20.28; arm_left.pos_y = -0.18; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 22.40; anim_extra_components[? "shell"].pos_y = -1.20; anim_extra_components[? "shell"].rotation = -3.98; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 51: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.34; arm_right.index = 4
				arm_left.pos_x = 19.68; arm_left.pos_y = 0.02; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 22.40; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 52: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.34; arm_right.index = 4
				arm_left.pos_x = 20.88; arm_left.pos_y = 0.42; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 24.20; anim_extra_components[? "shell"].pos_y = -0.40; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				hooks[? "shell_insert"] = true
				break
			case 53: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.34; arm_right.index = 4
				arm_left.pos_x = 21.68; arm_left.pos_y = 0.42; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 25; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 54: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.55; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 22.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 26; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 25.85; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 55: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.95; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.25; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 56: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.95; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.25; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 57: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.95; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.25; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 58: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.95; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.25; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 59: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.95; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.25; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 60: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.95; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.25; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 61: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.95; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.25; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 62: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.95; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.25; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 63: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.95; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 23.88; arm_left.pos_y = 0.22; arm_left.index = 0
				anim_extra_components[? "shell"].pos_x = 27.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -2.30; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				weapon.pos_x = 26.25; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 64: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 24.35; arm_right.pos_y = 1.14; arm_right.index = 4
				arm_left.pos_x = 22.88; arm_left.pos_y = 0.22; arm_left.index = 0
				weapon.pos_x = 25.85; weapon.pos_y = 2.23; weapon.rotation = 2.00; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				anim_end = true
				break
		}
	}



}
