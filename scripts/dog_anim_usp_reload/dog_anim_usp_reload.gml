/// @param dog_obj
/// @req_sprite spr_usp_turnside
/// @req_sprite spr_usp_mag
function dog_anim_usp_reload() {

	var dog = argument[0];
	var this_script = dog_anim_usp_reload;

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

		if (!ds_map_exists(anim_extra_components, "mag")) {
			var component = create_controllers(obj_animcomp);
			anim_extra_components[? "mag"] = component
		}

		if (anim_end) anim_arms_index = 0
		anim_end = false
		switch (anim_arms_index) {
			case 0: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				arm_right.pos_x = 20.80; arm_right.pos_y = 4.80; arm_right.index = 0
				weapon.pos_x = 21.40; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 5; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 1: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 2.66; arm_left.pos_y = -0.31; arm_left.index = 0
				arm_right.pos_x = 21.31; arm_right.pos_y = 4.46; arm_right.index = 1
				weapon.pos_x = 21.77; weapon.pos_y = 5.69; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 5; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 2: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 5.31; arm_left.pos_y = -0.63; arm_left.index = 0
				arm_right.pos_x = 21.83; arm_right.pos_y = 4.11; arm_right.index = 1
				weapon.pos_x = 22.14; weapon.pos_y = 5.77; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 6; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 3: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 7.97; arm_left.pos_y = -0.94; arm_left.index = 0
				arm_right.pos_x = 22.34; arm_right.pos_y = 3.77; arm_right.index = 2
				weapon.pos_x = 22.51; weapon.pos_y = 5.86; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 6; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 4: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 10.63; arm_left.pos_y = -1.26; arm_left.index = 0
				arm_right.pos_x = 22.86; arm_right.pos_y = 3.43; arm_right.index = 3
				weapon.pos_x = 22.89; weapon.pos_y = 5.94; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 6; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 5: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 13.29; arm_left.pos_y = -1.57; arm_left.index = 0
				arm_right.pos_x = 23.37; arm_right.pos_y = 3.09; arm_right.index = 4
				weapon.pos_x = 23.26; weapon.pos_y = 6.03; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 6; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 6: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 15.94; arm_left.pos_y = -1.89; arm_left.index = 0
				arm_right.pos_x = 23.89; arm_right.pos_y = 2.74; arm_right.index = 4
				weapon.pos_x = 23.63; weapon.pos_y = 6.11; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 7: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 18.60; arm_left.pos_y = -2.20; arm_left.index = 0
				arm_right.pos_x = 24.40; arm_right.pos_y = 2.40; arm_right.index = 5
				weapon.pos_x = 24; weapon.pos_y = 6.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 8: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 19.80; arm_left.pos_y = -1.80; arm_left.index = 0
				arm_right.pos_x = 24.44; arm_right.pos_y = 2.28; arm_right.index = 5
				weapon.pos_x = 24.04; weapon.pos_y = 6.08; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 9: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 21; arm_left.pos_y = -1.40; arm_left.index = 1
				arm_right.pos_x = 24.48; arm_right.pos_y = 2.16; arm_right.index = 5
				weapon.pos_x = 24.08; weapon.pos_y = 5.96; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 10: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.52; arm_right.pos_y = 2.04; arm_right.index = 5
				weapon.pos_x = 24.12; weapon.pos_y = 5.84; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 22.20; arm_left.pos_y = -1; arm_left.index = 1
				anim_extra_components[? "mag"].is_visible = false
				break
			case 11: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.56; arm_right.pos_y = 1.92; arm_right.index = 5
				weapon.pos_x = 24.16; weapon.pos_y = 5.72; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.40; arm_left.pos_y = -0.60; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 12: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.60; arm_left.pos_y = -0.20; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 13: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.52; arm_left.pos_y = 0; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 14: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.44; arm_left.pos_y = 0.20; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 15: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.20; anim_extra_components[? "mag"].pos_y = 0.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.36; arm_left.pos_y = 0.40; arm_left.index = 2
				break
			case 16: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.20; anim_extra_components[? "mag"].pos_y = 0.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.28; arm_left.pos_y = 0.60; arm_left.index = 2
				break
			case 17: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.20; anim_extra_components[? "mag"].pos_y = 0.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.20; arm_left.pos_y = 0.80; arm_left.index = 2
				break
			case 18: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.20; anim_extra_components[? "mag"].pos_y = 0.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.20; arm_left.pos_y = 0.80; arm_left.index = 2
				break
			case 19: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.20; anim_extra_components[? "mag"].pos_y = 0.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.20; arm_left.pos_y = 0.80; arm_left.index = 2
				break
			case 20: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.20; anim_extra_components[? "mag"].pos_y = 0.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.20; arm_left.pos_y = 0.80; arm_left.index = 2
				break
			case 21: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.60; arm_right.pos_y = 1.80; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.20; anim_extra_components[? "mag"].pos_y = 0.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24.20; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.20; arm_left.pos_y = 0.80; arm_left.index = 2
				break
			case 22: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.53; arm_right.pos_y = 2; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.13; anim_extra_components[? "mag"].pos_y = 0.17; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24.13; weapon.pos_y = 5.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.13; arm_left.pos_y = 0.17; arm_left.index = 2
				break
			case 23: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.47; arm_right.pos_y = 2.20; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.07; anim_extra_components[? "mag"].pos_y = -0.47; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24.07; weapon.pos_y = 6; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24.07; arm_left.pos_y = -0.47; arm_left.index = 2
				break
			case 24: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.40; arm_right.pos_y = 2.40; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23; anim_extra_components[? "mag"].pos_y = -1.10; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 24; weapon.pos_y = 6.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 24; arm_left.pos_y = -1.10; arm_left.index = 2
				break
			case 25: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.33; arm_right.pos_y = 2.60; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.93; anim_extra_components[? "mag"].pos_y = -1.73; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.93; weapon.pos_y = 6.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.93; arm_left.pos_y = -1.73; arm_left.index = 2
				break
			case 26: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.27; arm_right.pos_y = 2.80; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.87; anim_extra_components[? "mag"].pos_y = -2.37; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.87; weapon.pos_y = 6.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.87; arm_left.pos_y = -2.37; arm_left.index = 2
				break
			case 27: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.80; anim_extra_components[? "mag"].pos_y = -3; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = -3; arm_left.index = 2
				break
			case 28: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.13; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.67; anim_extra_components[? "mag"].pos_y = -3.27; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.93; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.67; arm_left.pos_y = -3.27; arm_left.index = 2
				break
			case 29: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.27; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.53; anim_extra_components[? "mag"].pos_y = -3.53; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.07; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.53; arm_left.pos_y = -3.53; arm_left.index = 2
				break
			case 30: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.40; anim_extra_components[? "mag"].pos_y = -3.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.40; arm_left.pos_y = -3.80; arm_left.index = 2
				break
			case 31: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.50; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.40; anim_extra_components[? "mag"].pos_y = -3.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.30; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.40; arm_left.pos_y = -3.80; arm_left.index = 2
				break
			case 32: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.40; anim_extra_components[? "mag"].pos_y = -3.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.40; arm_left.pos_y = -3.80; arm_left.index = 2
				break
			case 33: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 21.75; anim_extra_components[? "mag"].pos_y = -4.50; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 22.75; arm_left.pos_y = -4.50; arm_left.index = 2
				break
			case 34: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 21.10; anim_extra_components[? "mag"].pos_y = -5.20; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 22.10; arm_left.pos_y = -5.20; arm_left.index = 2
				break
			case 35: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 20.45; anim_extra_components[? "mag"].pos_y = -5.90; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 21.45; arm_left.pos_y = -5.90; arm_left.index = 2
				break
			case 36: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 19.80; anim_extra_components[? "mag"].pos_y = -6.60; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 20.80; arm_left.pos_y = -6.60; arm_left.index = 2
				break
			case 37: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 20.80; arm_left.pos_y = -6.60; arm_left.index = 5
				anim_extra_components[? "mag"].is_visible = false
				break
			case 38: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 20.60; arm_left.pos_y = -6.70; arm_left.index = 5
				anim_extra_components[? "mag"].is_visible = false
				break
			case 39: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 20.40; arm_left.pos_y = -6.80; arm_left.index = 5
				anim_extra_components[? "mag"].is_visible = false
				break
			case 40: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 20.20; arm_left.pos_y = -6.90; arm_left.index = 5
				anim_extra_components[? "mag"].is_visible = false
				break
			case 41: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.60; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.40; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 20; arm_left.pos_y = -7; arm_left.index = 5
				anim_extra_components[? "mag"].is_visible = false
				break
			case 42: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.50; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.30; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 18.40; arm_left.pos_y = -5.87; arm_left.index = 4
				anim_extra_components[? "mag"].is_visible = false
				break
			case 43: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 16.80; arm_left.pos_y = -4.73; arm_left.index = 4
				anim_extra_components[? "mag"].is_visible = false
				break
			case 44: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.30; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.10; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 15.20; arm_left.pos_y = -3.60; arm_left.index = 4
				anim_extra_components[? "mag"].is_visible = false
				break
			case 45: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.20; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 13.60; arm_left.pos_y = -2.47; arm_left.index = 3
				anim_extra_components[? "mag"].is_visible = false
				break
			case 46: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.10; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 6.90; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 12; arm_left.pos_y = -1.33; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 47: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 10.40; arm_left.pos_y = -0.20; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 48: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 10.40; arm_left.pos_y = -0.20; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 49: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 10; anim_extra_components[? "mag"].pos_y = 1; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 10.40; arm_left.pos_y = -0.20; arm_left.index = 2
				break
			case 50: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 10; anim_extra_components[? "mag"].pos_y = 1; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 10.40; arm_left.pos_y = -0.20; arm_left.index = 2
				break
			case 51: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 10; anim_extra_components[? "mag"].pos_y = 1; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 10.40; arm_left.pos_y = -0.20; arm_left.index = 2
				break
			case 52: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 11.47; anim_extra_components[? "mag"].pos_y = 0.55; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 11.88; arm_left.pos_y = -0.65; arm_left.index = 2
				break
			case 53: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 12.95; anim_extra_components[? "mag"].pos_y = 0.10; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 13.35; arm_left.pos_y = -1.10; arm_left.index = 2
				break
			case 54: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 14.43; anim_extra_components[? "mag"].pos_y = -0.35; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 14.82; arm_left.pos_y = -1.55; arm_left.index = 2
				break
			case 55: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 15.90; anim_extra_components[? "mag"].pos_y = -0.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 16.30; arm_left.pos_y = -2; arm_left.index = 2
				break
			case 56: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 17.38; anim_extra_components[? "mag"].pos_y = -1.25; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 17.77; arm_left.pos_y = -2.45; arm_left.index = 2
				break
			case 57: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 18.85; anim_extra_components[? "mag"].pos_y = -1.70; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 19.25; arm_left.pos_y = -2.90; arm_left.index = 2
				break
			case 58: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 20.32; anim_extra_components[? "mag"].pos_y = -2.15; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 20.72; arm_left.pos_y = -3.35; arm_left.index = 2
				break
			case 59: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 21.80; anim_extra_components[? "mag"].pos_y = -2.60; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 22.20; arm_left.pos_y = -3.80; arm_left.index = 2
				break
			case 60: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.13; anim_extra_components[? "mag"].pos_y = -2.60; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 22.53; arm_left.pos_y = -3.80; arm_left.index = 2
				break
			case 61: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.47; anim_extra_components[? "mag"].pos_y = -2.60; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 22.87; arm_left.pos_y = -3.80; arm_left.index = 2
				break
			case 62: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.80; anim_extra_components[? "mag"].pos_y = -2.60; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.20; arm_left.pos_y = -3.80; arm_left.index = 2
				break
			case 63: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.80; anim_extra_components[? "mag"].pos_y = -2.60; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.20; arm_left.pos_y = -3.80; arm_left.index = 2
				break
			case 64: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 22.80; anim_extra_components[? "mag"].pos_y = -2.60; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.20; arm_left.pos_y = -3.80; arm_left.index = 2
				break
			case 65: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23; anim_extra_components[? "mag"].pos_y = -0.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.40; arm_left.pos_y = -2.00; arm_left.index = 2
				break
			case 66: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.20; anim_extra_components[? "mag"].pos_y = 1.00; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.60; arm_left.pos_y = -0.20; arm_left.index = 2
				break
			case 67: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.40; anim_extra_components[? "mag"].pos_y = 2.80; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.80; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 1.60; arm_left.index = 2
				break
			case 68: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.13; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.40; anim_extra_components[? "mag"].pos_y = 2.93; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 6.93; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 1.73; arm_left.index = 2
				break
			case 69: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.27; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.40; anim_extra_components[? "mag"].pos_y = 3.07; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.07; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 1.87; arm_left.index = 2
				break
			case 70: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.40; anim_extra_components[? "mag"].pos_y = 3.20; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 2; arm_left.index = 2
				break
			case 71: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.40; anim_extra_components[? "mag"].pos_y = 3.20; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 2; arm_left.index = 2
				break
			case 72: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.40; anim_extra_components[? "mag"].pos_y = 3.20; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 2; arm_left.index = 2
				break
			case 73: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.40; anim_extra_components[? "mag"].pos_y = 3.20; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 2; arm_left.index = 2
				break
			case 74: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.40; anim_extra_components[? "mag"].pos_y = 3.20; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 2; arm_left.index = 2
				break
			case 75: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, anim_extra_components[? "mag"]); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				anim_extra_components[? "mag"].pos_x = 23.40; anim_extra_components[? "mag"].pos_y = 3.20; anim_extra_components[? "mag"].rotation = 0; anim_extra_components[? "mag"].sprite = spr_usp_mag; anim_extra_components[? "mag"].index = 1; anim_extra_components[? "mag"].is_visible = true
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 2; arm_left.index = 2
				break
			case 76: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 23.80; arm_left.pos_y = 2; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 77: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 22.32; arm_left.pos_y = 1.44; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 78: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 20.84; arm_left.pos_y = 0.88; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 79: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 19.36; arm_left.pos_y = 0.32; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 80: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 17.88; arm_left.pos_y = -0.24; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 81: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 24.20; arm_right.pos_y = 3.40; arm_right.index = 5
				weapon.pos_x = 23.80; weapon.pos_y = 7.20; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 16.40; arm_left.pos_y = -0.80; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 82: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 23.71; arm_right.pos_y = 3.60; arm_right.index = 4
				weapon.pos_x = 23.46; weapon.pos_y = 6.97; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 7; weapon.is_visible = true
				arm_left.pos_x = 14.06; arm_left.pos_y = -0.69; arm_left.index = 2
				anim_extra_components[? "mag"].is_visible = false
				break
			case 83: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 23.23; arm_right.pos_y = 3.80; arm_right.index = 4
				weapon.pos_x = 23.11; weapon.pos_y = 6.74; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 6; weapon.is_visible = true
				arm_left.pos_x = 11.71; arm_left.pos_y = -0.57; arm_left.index = 1
				anim_extra_components[? "mag"].is_visible = false
				break
			case 84: ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				arm_right.pos_x = 22.74; arm_right.pos_y = 4; arm_right.index = 3
				weapon.pos_x = 22.77; weapon.pos_y = 6.51; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 6; weapon.is_visible = true
				arm_left.pos_x = 9.37; arm_left.pos_y = -0.46; arm_left.index = 1
				anim_extra_components[? "mag"].is_visible = false
				break
			case 85: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 7.03; arm_left.pos_y = -0.34; arm_left.index = 1
				arm_right.pos_x = 22.26; arm_right.pos_y = 4.20; arm_right.index = 2
				weapon.pos_x = 22.43; weapon.pos_y = 6.29; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 6; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 86: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 4.69; arm_left.pos_y = -0.23; arm_left.index = 1
				arm_right.pos_x = 21.77; arm_right.pos_y = 4.40; arm_right.index = 1
				weapon.pos_x = 22.09; weapon.pos_y = 6.06; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 6; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 87: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 2.34; arm_left.pos_y = -0.11; arm_left.index = 0
				arm_right.pos_x = 21.29; arm_right.pos_y = 4.60; arm_right.index = 1
				weapon.pos_x = 21.74; weapon.pos_y = 5.83; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 5; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				break
			case 88: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				arm_right.pos_x = 20.80; arm_right.pos_y = 4.80; arm_right.index = 0
				weapon.pos_x = 21.40; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_turnside; weapon.index = 5; weapon.is_visible = true
				anim_extra_components[? "mag"].is_visible = false
				anim_end = true
				break
		}
	}



}
