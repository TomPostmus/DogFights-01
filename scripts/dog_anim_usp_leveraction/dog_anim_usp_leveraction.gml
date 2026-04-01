/// @param dog_obj
/// @req_sprite spr_usp_grip_turnside
/// @req_sprite spr_usp_gripless_turnside
/// @req_sprite spr_usp_gripless_leveractionside
function dog_anim_usp_leveraction() {

	var dog = argument[0];
	var this_script = dog_anim_usp_leveraction;

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

		if (!ds_map_exists(anim_extra_components, "grip")) {
			var component = create_controllers(obj_animcomp);
			anim_extra_components[? "grip"] = component
		}

		if (anim_end) anim_arms_index = 0
		anim_end = false
		switch (anim_arms_index) {
			case 0: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 21.40; anim_extra_components[? "grip"].pos_y = 5.60; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 0; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 20.80; arm_right.pos_y = 4.80; arm_right.index = 0
				weapon.pos_x = 21.40; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 0; weapon.is_visible = true
				break
			case 1: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 1.60; arm_left.pos_y = -0.26; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 21.66; anim_extra_components[? "grip"].pos_y = 5.14; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 0; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 21.29; arm_right.pos_y = 4.77; arm_right.index = 0
				weapon.pos_x = 21.66; weapon.pos_y = 5.14; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 0; weapon.is_visible = true
				break
			case 2: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 3.20; arm_left.pos_y = -0.51; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 21.91; anim_extra_components[? "grip"].pos_y = 4.69; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 1; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 21.77; arm_right.pos_y = 4.74; arm_right.index = 1
				weapon.pos_x = 21.91; weapon.pos_y = 4.69; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 1; weapon.is_visible = true
				break
			case 3: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 4.80; arm_left.pos_y = -0.77; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 22.17; anim_extra_components[? "grip"].pos_y = 4.23; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 1; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 22.26; arm_right.pos_y = 4.71; arm_right.index = 1
				weapon.pos_x = 22.17; weapon.pos_y = 4.23; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 1; weapon.is_visible = true
				break
			case 4: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 6.40; arm_left.pos_y = -1.03; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 22.43; anim_extra_components[? "grip"].pos_y = 3.77; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 1; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 22.74; arm_right.pos_y = 4.69; arm_right.index = 1
				weapon.pos_x = 22.43; weapon.pos_y = 3.77; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 1; weapon.is_visible = true
				break
			case 5: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 8; arm_left.pos_y = -1.29; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 22.69; anim_extra_components[? "grip"].pos_y = 3.31; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 1; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 23.23; arm_right.pos_y = 4.66; arm_right.index = 1
				weapon.pos_x = 22.69; weapon.pos_y = 3.31; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 1; weapon.is_visible = true
				break
			case 6: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 9.60; arm_left.pos_y = -1.54; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 22.94; anim_extra_components[? "grip"].pos_y = 2.86; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 23.71; arm_right.pos_y = 4.63; arm_right.index = 2
				weapon.pos_x = 22.94; weapon.pos_y = 2.86; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				break
			case 7: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 11.20; arm_left.pos_y = -1.80; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 23.20; anim_extra_components[? "grip"].pos_y = 2.40; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.20; arm_right.pos_y = 4.60; arm_right.index = 2
				weapon.pos_x = 23.20; weapon.pos_y = 2.40; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				break
			case 8: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 12.89; arm_left.pos_y = -1.51; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 23.18; anim_extra_components[? "grip"].pos_y = 2.42; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.18; arm_right.pos_y = 4.62; arm_right.index = 2
				weapon.pos_x = 23.18; weapon.pos_y = 2.42; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				break
			case 9: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 14.58; arm_left.pos_y = -1.22; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 23.16; anim_extra_components[? "grip"].pos_y = 2.44; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.16; arm_right.pos_y = 4.64; arm_right.index = 2
				weapon.pos_x = 23.16; weapon.pos_y = 2.44; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				break
			case 10: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 16.27; arm_left.pos_y = -0.93; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 23.13; anim_extra_components[? "grip"].pos_y = 2.47; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.13; arm_right.pos_y = 4.67; arm_right.index = 2
				weapon.pos_x = 23.13; weapon.pos_y = 2.47; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				break
			case 11: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 17.96; arm_left.pos_y = -0.64; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 23.11; anim_extra_components[? "grip"].pos_y = 2.49; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.11; arm_right.pos_y = 4.69; arm_right.index = 2
				weapon.pos_x = 23.11; weapon.pos_y = 2.49; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				break
			case 12: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23.09; anim_extra_components[? "grip"].pos_y = 2.51; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.09; arm_right.pos_y = 4.71; arm_right.index = 2
				weapon.pos_x = 23.09; weapon.pos_y = 2.51; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 19.64; arm_left.pos_y = -0.36; arm_left.index = 0
				break
			case 13: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23.07; anim_extra_components[? "grip"].pos_y = 2.53; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.07; arm_right.pos_y = 4.73; arm_right.index = 2
				weapon.pos_x = 23.07; weapon.pos_y = 2.53; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 21.33; arm_left.pos_y = -0.07; arm_left.index = 0
				break
			case 14: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23.04; anim_extra_components[? "grip"].pos_y = 2.56; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.04; arm_right.pos_y = 4.76; arm_right.index = 2
				weapon.pos_x = 23.04; weapon.pos_y = 2.56; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 23.02; arm_left.pos_y = 0.22; arm_left.index = 0
				break
			case 15: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23.02; anim_extra_components[? "grip"].pos_y = 2.58; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.02; arm_right.pos_y = 4.78; arm_right.index = 2
				weapon.pos_x = 23.02; weapon.pos_y = 2.58; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 24.71; arm_left.pos_y = 0.51; arm_left.index = 0
				break
			case 16: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23; anim_extra_components[? "grip"].pos_y = 2.60; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24; arm_right.pos_y = 4.80; arm_right.index = 2
				weapon.pos_x = 23; weapon.pos_y = 2.60; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 26.40; arm_left.pos_y = 0.80; arm_left.index = 0
				break
			case 17: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23; anim_extra_components[? "grip"].pos_y = 2.60; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24; arm_right.pos_y = 4.80; arm_right.index = 2
				weapon.pos_x = 23; weapon.pos_y = 2.60; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 26.40; arm_left.pos_y = 0.80; arm_left.index = 0
				break
			case 18: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23; anim_extra_components[? "grip"].pos_y = 2.60; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24; arm_right.pos_y = 4.80; arm_right.index = 2
				weapon.pos_x = 23; weapon.pos_y = 2.60; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 26.40; arm_left.pos_y = 0.80; arm_left.index = 0
				break
			case 19: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23; anim_extra_components[? "grip"].pos_y = 2.60; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24; arm_right.pos_y = 4.80; arm_right.index = 2
				weapon.pos_x = 23; weapon.pos_y = 2.60; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 26.40; arm_left.pos_y = 0.80; arm_left.index = 0
				break
			case 20: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23; anim_extra_components[? "grip"].pos_y = 2.60; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24; arm_right.pos_y = 4.80; arm_right.index = 2
				weapon.pos_x = 23; weapon.pos_y = 2.60; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 0; weapon.is_visible = true
				arm_left.pos_x = 26.40; arm_left.pos_y = 0.80; arm_left.index = 0
				break
			case 21: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 22.67; anim_extra_components[? "grip"].pos_y = 2.53; anim_extra_components[? "grip"].rotation = 2.65; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 23.67; arm_right.pos_y = 4.73; arm_right.index = 2
				weapon.pos_x = 22.67; weapon.pos_y = 2.53; weapon.rotation = 2.65; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 1; weapon.is_visible = true
				arm_left.pos_x = 24.73; arm_left.pos_y = 0.93; arm_left.index = 0
				break
			case 22: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 22.33; anim_extra_components[? "grip"].pos_y = 2.47; anim_extra_components[? "grip"].rotation = 5.30; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 23.33; arm_right.pos_y = 4.67; arm_right.index = 2
				weapon.pos_x = 22.33; weapon.pos_y = 2.47; weapon.rotation = 5.30; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 1; weapon.is_visible = true
				arm_left.pos_x = 23.07; arm_left.pos_y = 1.07; arm_left.index = 0
				break
			case 23: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 22; anim_extra_components[? "grip"].pos_y = 2.40; anim_extra_components[? "grip"].rotation = 7.95; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 23; arm_right.pos_y = 4.60; arm_right.index = 2
				weapon.pos_x = 22; weapon.pos_y = 2.40; weapon.rotation = 7.95; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 21.40; arm_left.pos_y = 1.20; arm_left.index = 0
				break
			case 24: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 21.48; anim_extra_components[? "grip"].pos_y = 2.40; anim_extra_components[? "grip"].rotation = 8.59; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 22.48; arm_right.pos_y = 4.60; arm_right.index = 2
				weapon.pos_x = 21.48; weapon.pos_y = 2.40; weapon.rotation = 8.59; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 20.88; arm_left.pos_y = 1.20; arm_left.index = 0
				break
			case 25: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 20.97; anim_extra_components[? "grip"].pos_y = 2.40; anim_extra_components[? "grip"].rotation = 9.22; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 21.97; arm_right.pos_y = 4.60; arm_right.index = 2
				weapon.pos_x = 20.97; weapon.pos_y = 2.40; weapon.rotation = 9.22; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 20.37; arm_left.pos_y = 1.20; arm_left.index = 0
				break
			case 26: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 20.45; anim_extra_components[? "grip"].pos_y = 2.40; anim_extra_components[? "grip"].rotation = 9.86; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 21.45; arm_right.pos_y = 4.60; arm_right.index = 2
				weapon.pos_x = 20.45; weapon.pos_y = 2.40; weapon.rotation = 9.86; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 19.85; arm_left.pos_y = 1.20; arm_left.index = 0
				break
			case 27: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 20.45; anim_extra_components[? "grip"].pos_y = 2.40; anim_extra_components[? "grip"].rotation = 9.86; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 21.45; arm_right.pos_y = 4.60; arm_right.index = 2
				weapon.pos_x = 20.45; weapon.pos_y = 2.40; weapon.rotation = 9.86; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 19.85; arm_left.pos_y = 1.20; arm_left.index = 0
				break
			case 28: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 20.45; anim_extra_components[? "grip"].pos_y = 2.40; anim_extra_components[? "grip"].rotation = 9.86; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 21.45; arm_right.pos_y = 4.60; arm_right.index = 2
				weapon.pos_x = 20.45; weapon.pos_y = 2.40; weapon.rotation = 9.86; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 19.85; arm_left.pos_y = 1.20; arm_left.index = 0
				break
			case 29: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 20.45; anim_extra_components[? "grip"].pos_y = 2.40; anim_extra_components[? "grip"].rotation = 9.86; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 21.45; arm_right.pos_y = 4.60; arm_right.index = 2
				weapon.pos_x = 20.45; weapon.pos_y = 2.40; weapon.rotation = 9.86; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 19.85; arm_left.pos_y = 1.20; arm_left.index = 0
				break
			case 30: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 20.45; anim_extra_components[? "grip"].pos_y = 2.40; anim_extra_components[? "grip"].rotation = 9.86; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 21.45; arm_right.pos_y = 4.60; arm_right.index = 2
				weapon.pos_x = 20.45; weapon.pos_y = 2.40; weapon.rotation = 9.86; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 19.85; arm_left.pos_y = 1.20; arm_left.index = 0
				break
			case 31: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 21.45; anim_extra_components[? "grip"].pos_y = 2.60; anim_extra_components[? "grip"].rotation = 7.40; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 22.45; arm_right.pos_y = 4.80; arm_right.index = 2
				weapon.pos_x = 21.45; weapon.pos_y = 2.60; weapon.rotation = 7.40; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 19.50; arm_left.pos_y = 1.70; arm_left.index = 0
				break
			case 32: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 22.45; anim_extra_components[? "grip"].pos_y = 2.80; anim_extra_components[? "grip"].rotation = 4.93; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 23.45; arm_right.pos_y = 5; arm_right.index = 2
				weapon.pos_x = 22.45; weapon.pos_y = 2.80; weapon.rotation = 4.93; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 1; weapon.is_visible = true
				arm_left.pos_x = 19.15; arm_left.pos_y = 2.20; arm_left.index = 0
				break
			case 33: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23.45; anim_extra_components[? "grip"].pos_y = 3; anim_extra_components[? "grip"].rotation = 2.47; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.45; arm_right.pos_y = 5.20; arm_right.index = 2
				weapon.pos_x = 23.45; weapon.pos_y = 3; weapon.rotation = 2.47; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 0; weapon.is_visible = true
				arm_left.pos_x = 18.80; arm_left.pos_y = 2.70; arm_left.index = 0
				break
			case 34: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 24.45; anim_extra_components[? "grip"].pos_y = 3.20; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 25.45; arm_right.pos_y = 5.40; arm_right.index = 2
				weapon.pos_x = 24.45; weapon.pos_y = 3.20; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_leveractionside; weapon.index = 0; weapon.is_visible = true
				arm_left.pos_x = 18.45; arm_left.pos_y = 3.20; arm_left.index = 0
				break
			case 35: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 24.56; anim_extra_components[? "grip"].pos_y = 3.26; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 25.56; arm_right.pos_y = 5.46; arm_right.index = 2
				weapon.pos_x = 24.56; weapon.pos_y = 3.26; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 18.23; arm_left.pos_y = 3.15; arm_left.index = 0
				break
			case 36: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 24.68; anim_extra_components[? "grip"].pos_y = 3.33; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 25.68; arm_right.pos_y = 5.53; arm_right.index = 2
				weapon.pos_x = 24.68; weapon.pos_y = 3.33; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 18; arm_left.pos_y = 3.10; arm_left.index = 0
				break
			case 37: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 24.79; anim_extra_components[? "grip"].pos_y = 3.39; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 25.79; arm_right.pos_y = 5.59; arm_right.index = 2
				weapon.pos_x = 24.79; weapon.pos_y = 3.39; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 17.78; arm_left.pos_y = 3.05; arm_left.index = 0
				break
			case 38: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 24.90; anim_extra_components[? "grip"].pos_y = 3.45; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 25.90; arm_right.pos_y = 5.65; arm_right.index = 2
				weapon.pos_x = 24.90; weapon.pos_y = 3.45; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 17.55; arm_left.pos_y = 3; arm_left.index = 0
				break
			case 39: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 25.01; anim_extra_components[? "grip"].pos_y = 3.51; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 26.01; arm_right.pos_y = 5.71; arm_right.index = 2
				weapon.pos_x = 25.01; weapon.pos_y = 3.51; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 17.32; arm_left.pos_y = 2.95; arm_left.index = 0
				break
			case 40: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 25.13; anim_extra_components[? "grip"].pos_y = 3.58; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 26.13; arm_right.pos_y = 5.78; arm_right.index = 2
				weapon.pos_x = 25.13; weapon.pos_y = 3.58; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 17.10; arm_left.pos_y = 2.90; arm_left.index = 0
				break
			case 41: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 25.24; anim_extra_components[? "grip"].pos_y = 3.64; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 26.24; arm_right.pos_y = 5.84; arm_right.index = 2
				weapon.pos_x = 25.24; weapon.pos_y = 3.64; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 16.88; arm_left.pos_y = 2.85; arm_left.index = 0
				break
			case 42: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 25.35; anim_extra_components[? "grip"].pos_y = 3.70; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 26.35; arm_right.pos_y = 5.90; arm_right.index = 2
				weapon.pos_x = 25.35; weapon.pos_y = 3.70; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 16.65; arm_left.pos_y = 2.80; arm_left.index = 0
				break
			case 43: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 25.35; anim_extra_components[? "grip"].pos_y = 3.70; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 26.35; arm_right.pos_y = 5.90; arm_right.index = 2
				weapon.pos_x = 25.35; weapon.pos_y = 3.70; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 15.25; arm_left.pos_y = 2.15; arm_left.index = 0
				break
			case 44: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 25.35; anim_extra_components[? "grip"].pos_y = 3.70; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 26.35; arm_right.pos_y = 5.90; arm_right.index = 2
				weapon.pos_x = 25.35; weapon.pos_y = 3.70; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 13.85; arm_left.pos_y = 1.50; arm_left.index = 0
				break
			case 45: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 25.35; anim_extra_components[? "grip"].pos_y = 3.70; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 26.35; arm_right.pos_y = 5.90; arm_right.index = 2
				weapon.pos_x = 25.35; weapon.pos_y = 3.70; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 12.45; arm_left.pos_y = 0.85; arm_left.index = 0
				break
			case 46: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 25.35; anim_extra_components[? "grip"].pos_y = 3.70; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 26.35; arm_right.pos_y = 5.90; arm_right.index = 2
				weapon.pos_x = 25.35; weapon.pos_y = 3.70; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 11.05; arm_left.pos_y = 0.20; arm_left.index = 0
				break
			case 47: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 24.79; anim_extra_components[? "grip"].pos_y = 3.97; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 2; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 25.56; arm_right.pos_y = 5.74; arm_right.index = 2
				weapon.pos_x = 24.79; weapon.pos_y = 3.97; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 2; weapon.is_visible = true
				arm_left.pos_x = 9.47; arm_left.pos_y = 0.17; arm_left.index = 0
				break
			case 48: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 24.22; anim_extra_components[? "grip"].pos_y = 4.24; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 1; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 24.76; arm_right.pos_y = 5.59; arm_right.index = 1
				weapon.pos_x = 24.22; weapon.pos_y = 4.24; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 1; weapon.is_visible = true
				arm_left.pos_x = 7.89; arm_left.pos_y = 0.14; arm_left.index = 0
				break
			case 49: ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); ds_list_add(anim_draw_order, arm_left); 
				anim_extra_components[? "grip"].pos_x = 23.66; anim_extra_components[? "grip"].pos_y = 4.51; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 1; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 23.97; arm_right.pos_y = 5.43; arm_right.index = 1
				weapon.pos_x = 23.66; weapon.pos_y = 4.51; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 1; weapon.is_visible = true
				arm_left.pos_x = 6.31; arm_left.pos_y = 0.11; arm_left.index = 0
				break
			case 50: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 4.74; arm_left.pos_y = 0.09; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 23.09; anim_extra_components[? "grip"].pos_y = 4.79; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 1; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 23.18; arm_right.pos_y = 5.27; arm_right.index = 1
				weapon.pos_x = 23.09; weapon.pos_y = 4.79; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 1; weapon.is_visible = true
				break
			case 51: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 3.16; arm_left.pos_y = 0.06; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 22.53; anim_extra_components[? "grip"].pos_y = 5.06; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 1; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 22.39; arm_right.pos_y = 5.11; arm_right.index = 1
				weapon.pos_x = 22.53; weapon.pos_y = 5.06; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 1; weapon.is_visible = true
				break
			case 52: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 1.58; arm_left.pos_y = 0.03; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 21.96; anim_extra_components[? "grip"].pos_y = 5.33; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 0; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 21.59; arm_right.pos_y = 4.96; arm_right.index = 0
				weapon.pos_x = 21.96; weapon.pos_y = 5.33; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 0; weapon.is_visible = true
				break
			case 53: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, anim_extra_components[? "grip"]); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				anim_extra_components[? "grip"].pos_x = 21.40; anim_extra_components[? "grip"].pos_y = 5.60; anim_extra_components[? "grip"].rotation = 0; anim_extra_components[? "grip"].sprite = spr_usp_grip_turnside; anim_extra_components[? "grip"].index = 0; anim_extra_components[? "grip"].is_visible = true
				arm_right.pos_x = 20.80; arm_right.pos_y = 4.80; arm_right.index = 0
				weapon.pos_x = 21.40; weapon.pos_y = 5.60; weapon.rotation = 0; weapon.sprite = spr_usp_gripless_turnside; weapon.index = 0; weapon.is_visible = true
				anim_end = true
				break
		}
	}



}
