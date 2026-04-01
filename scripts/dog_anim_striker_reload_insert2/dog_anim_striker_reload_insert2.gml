/// @param dog_obj
/// @param hooks_map
/// @req_sprite spr_striker
/// @req_sprite spr_striker_shell
function dog_anim_striker_reload_insert2() {

	var dog = argument[0];
	var hooks = argument[1];
	var this_script = dog_anim_striker_reload_insert2;

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
				arm_right.pos_x = 23.75; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 21.68; arm_left.pos_y = 0.42; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 1: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.71; arm_right.pos_y = 2.30; arm_right.index = 4
				arm_left.pos_x = 20.92; arm_left.pos_y = 0.10; arm_left.index = 0
				weapon.pos_x = 25.21; weapon.pos_y = 3.07; weapon.rotation = 2.19; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 2: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.67; arm_right.pos_y = 2.46; arm_right.index = 4
				arm_left.pos_x = 20.16; arm_left.pos_y = -0.22; arm_left.index = 0
				weapon.pos_x = 25.17; weapon.pos_y = 3.31; weapon.rotation = 1.76; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 3: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.63; arm_right.pos_y = 2.62; arm_right.index = 4
				arm_left.pos_x = 19.40; arm_left.pos_y = -0.54; arm_left.index = 0
				weapon.pos_x = 25.13; weapon.pos_y = 3.55; weapon.rotation = 1.34; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 4: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.59; arm_right.pos_y = 2.78; arm_right.index = 4
				arm_left.pos_x = 18.64; arm_left.pos_y = -0.86; arm_left.index = 0
				weapon.pos_x = 25.09; weapon.pos_y = 3.79; weapon.rotation = 0.91; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 5: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				arm_left.pos_x = 17.88; arm_left.pos_y = -1.18; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 6: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				arm_left.pos_x = 16.13; arm_left.pos_y = -0.73; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 7: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				arm_left.pos_x = 14.38; arm_left.pos_y = -0.28; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 8: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				arm_left.pos_x = 12.63; arm_left.pos_y = 0.17; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 9: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				arm_left.pos_x = 10.88; arm_left.pos_y = 0.62; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 10: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				arm_left.pos_x = 10.88; arm_left.pos_y = 0.62; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 11: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				arm_left.pos_x = 10.88; arm_left.pos_y = 0.62; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 12: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				arm_left.pos_x = 10.88; arm_left.pos_y = 0.62; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 13: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 10.40; anim_extra_components[? "shell"].pos_y = 0.60; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 10.88; arm_left.pos_y = 0.62; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 14: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 10.40; anim_extra_components[? "shell"].pos_y = 0.60; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 10.88; arm_left.pos_y = 0.62; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 15: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 10.40; anim_extra_components[? "shell"].pos_y = 0.60; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 10.88; arm_left.pos_y = 0.62; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 16: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.94; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 10.40; anim_extra_components[? "shell"].pos_y = 0.60; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 10.88; arm_left.pos_y = 0.62; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 4.03; weapon.rotation = 0.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 17: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.69; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 12.95; anim_extra_components[? "shell"].pos_y = -0.05; anim_extra_components[? "shell"].rotation = -2.95; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 12.53; arm_left.pos_y = 0.22; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 3.78; weapon.rotation = -0.51; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 18: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.44; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 15.50; anim_extra_components[? "shell"].pos_y = -0.70; anim_extra_components[? "shell"].rotation = -5.90; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 14.18; arm_left.pos_y = -0.18; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 3.53; weapon.rotation = -1.49; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 19: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 2.19; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 18.05; anim_extra_components[? "shell"].pos_y = -1.35; anim_extra_components[? "shell"].rotation = -8.85; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 15.83; arm_left.pos_y = -0.58; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 3.28; weapon.rotation = -2.48; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 20: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.55; arm_right.pos_y = 1.94; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 20.60; anim_extra_components[? "shell"].pos_y = -2; anim_extra_components[? "shell"].rotation = -11.80; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 17.48; arm_left.pos_y = -0.98; arm_left.index = 0
				weapon.pos_x = 25.05; weapon.pos_y = 3.03; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 21: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.40; arm_right.pos_y = 1.84; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 21; anim_extra_components[? "shell"].pos_y = -1.65; anim_extra_components[? "shell"].rotation = -10.72; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 17.93; arm_left.pos_y = -0.53; arm_left.index = 0
				weapon.pos_x = 24.90; weapon.pos_y = 2.93; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 22: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.25; arm_right.pos_y = 1.74; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 21.40; anim_extra_components[? "shell"].pos_y = -1.30; anim_extra_components[? "shell"].rotation = -9.64; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 18.38; arm_left.pos_y = -0.08; arm_left.index = 0
				weapon.pos_x = 24.75; weapon.pos_y = 2.83; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 23: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.10; arm_right.pos_y = 1.64; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 21.80; anim_extra_components[? "shell"].pos_y = -0.95; anim_extra_components[? "shell"].rotation = -8.56; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 18.83; arm_left.pos_y = 0.37; arm_left.index = 0
				weapon.pos_x = 24.60; weapon.pos_y = 2.73; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 24: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 1.54; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 22.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -7.48; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 19.28; arm_left.pos_y = 0.82; arm_left.index = 0
				weapon.pos_x = 24.45; weapon.pos_y = 2.63; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 25: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 1.54; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 22.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -7.48; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 19.28; arm_left.pos_y = 0.82; arm_left.index = 0
				weapon.pos_x = 24.45; weapon.pos_y = 2.63; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 26: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 1.54; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 22.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -7.48; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 19.28; arm_left.pos_y = 0.82; arm_left.index = 0
				weapon.pos_x = 24.45; weapon.pos_y = 2.63; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 27: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 1.54; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 22.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -7.48; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 19.28; arm_left.pos_y = 0.82; arm_left.index = 0
				weapon.pos_x = 24.45; weapon.pos_y = 2.63; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 28: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 1.54; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 22.20; anim_extra_components[? "shell"].pos_y = -0.60; anim_extra_components[? "shell"].rotation = -7.48; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 19.28; arm_left.pos_y = 0.82; arm_left.index = 0
				weapon.pos_x = 24.45; weapon.pos_y = 2.63; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 29: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 1.54; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 23.13; anim_extra_components[? "shell"].pos_y = -0.47; anim_extra_components[? "shell"].rotation = -7.41; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 20.21; arm_left.pos_y = 0.89; arm_left.index = 0
				weapon.pos_x = 24.45; weapon.pos_y = 2.63; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				hooks[? "shell_insert"] = true
				break
			case 30: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 1.54; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 24.07; anim_extra_components[? "shell"].pos_y = -0.33; anim_extra_components[? "shell"].rotation = -7.35; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 21.15; arm_left.pos_y = 0.95; arm_left.index = 0
				weapon.pos_x = 24.45; weapon.pos_y = 2.63; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 31: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 1.54; arm_right.index = 4
				anim_extra_components[? "shell"].pos_x = 25; anim_extra_components[? "shell"].pos_y = -0.20; anim_extra_components[? "shell"].rotation = -7.28; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				arm_left.pos_x = 22.08; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 24.45; weapon.pos_y = 2.63; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				break
			case 32: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 22.95; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.08; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 24.45; weapon.pos_y = 2.63; weapon.rotation = -3.46; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 33: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.35; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.28; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 24.85; weapon.pos_y = 2.63; weapon.rotation = -4.20; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 34: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); 
				arm_right.pos_x = 23.75; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.48; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.63; weapon.rotation = -4.94; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].pos_x = 0; anim_extra_components[? "shell"].pos_y = 0; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				break
			case 35: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.68; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 25.65; weapon.pos_y = 2.63; weapon.rotation = -5.68; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].pos_x = 0; anim_extra_components[? "shell"].pos_y = 0; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				break
			case 36: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.68; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 25.65; weapon.pos_y = 2.63; weapon.rotation = -5.68; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].pos_x = 0; anim_extra_components[? "shell"].pos_y = 0; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				break
			case 37: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.68; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 25.65; weapon.pos_y = 2.63; weapon.rotation = -5.68; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].pos_x = 0; anim_extra_components[? "shell"].pos_y = 0; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				break
			case 38: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.68; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 25.65; weapon.pos_y = 2.63; weapon.rotation = -5.68; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].pos_x = 0; anim_extra_components[? "shell"].pos_y = 0; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				break
			case 39: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.68; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 25.65; weapon.pos_y = 2.63; weapon.rotation = -5.68; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].pos_x = 0; anim_extra_components[? "shell"].pos_y = 0; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				break
			case 40: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.68; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 25.65; weapon.pos_y = 2.63; weapon.rotation = -5.68; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].pos_x = 0; anim_extra_components[? "shell"].pos_y = 0; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				break
			case 41: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); 
				arm_right.pos_x = 24.15; arm_right.pos_y = 1.54; arm_right.index = 4
				arm_left.pos_x = 22.68; arm_left.pos_y = 1.02; arm_left.index = 0
				weapon.pos_x = 25.65; weapon.pos_y = 2.63; weapon.rotation = -5.68; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].pos_x = 0; anim_extra_components[? "shell"].pos_y = 0; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				break
			case 42: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, anim_extra_components[? "shell"]); 
				arm_right.pos_x = 24.05; arm_right.pos_y = 1.69; arm_right.index = 4
				arm_left.pos_x = 22.43; arm_left.pos_y = 0.87; arm_left.index = 0
				weapon.pos_x = 25.55; weapon.pos_y = 2.68; weapon.rotation = -3.60; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].pos_x = 0; anim_extra_components[? "shell"].pos_y = 0; anim_extra_components[? "shell"].rotation = 0; anim_extra_components[? "shell"].sprite = spr_striker_shell; anim_extra_components[? "shell"].index = 0; anim_extra_components[? "shell"].is_visible = true
				break
			case 43: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.95; arm_right.pos_y = 1.84; arm_right.index = 4
				arm_left.pos_x = 22.18; arm_left.pos_y = 0.72; arm_left.index = 0
				weapon.pos_x = 25.45; weapon.pos_y = 2.73; weapon.rotation = -1.53; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 44: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.85; arm_right.pos_y = 1.99; arm_right.index = 4
				arm_left.pos_x = 21.93; arm_left.pos_y = 0.57; arm_left.index = 0
				weapon.pos_x = 25.35; weapon.pos_y = 2.78; weapon.rotation = 0.55; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				break
			case 45: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, weapon); 
				arm_right.pos_x = 23.75; arm_right.pos_y = 2.14; arm_right.index = 4
				arm_left.pos_x = 21.68; arm_left.pos_y = 0.42; arm_left.index = 0
				weapon.pos_x = 25.25; weapon.pos_y = 2.83; weapon.rotation = 2.62; weapon.sprite = spr_striker; weapon.index = 3; weapon.is_visible = true
				anim_extra_components[? "shell"].is_visible = false
				anim_end = true
				break
		}
	}



}
