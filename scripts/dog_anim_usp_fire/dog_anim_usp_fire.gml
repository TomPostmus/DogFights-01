/// @param dog_obj
/// @param recoil_x
/// @param recoil_y
/// @req_sprite spr_usp_leverslide
function dog_anim_usp_fire() {

	var dog = argument[0];
	var recoil_x = argument[1];
	var recoil_y = argument[2];
	var this_script = dog_anim_usp_fire;

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
		switch (anim_arms_index) {
			case 0: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				arm_right.pos_x = 20.80 - recoil_x; arm_right.pos_y = 4.80 + recoil_y; arm_right.index = 0
				weapon.pos_x = 21.40 - recoil_x; weapon.pos_y = 5.60 + recoil_y; weapon.rotation = 0; weapon.sprite = spr_usp_leverslide; weapon.index = 0; weapon.is_visible = true
				break
			case 1: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				arm_right.pos_x = 20.80 - recoil_x; arm_right.pos_y = 4.80 + recoil_y; arm_right.index = 0
				weapon.pos_x = 21.40 - recoil_x; weapon.pos_y = 5.60 + recoil_y; weapon.rotation = 0; weapon.sprite = spr_usp_leverslide; weapon.index = 1; weapon.is_visible = true
				break
			case 2: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				arm_right.pos_x = 20.80 - recoil_x; arm_right.pos_y = 4.80 + recoil_y; arm_right.index = 0
				weapon.pos_x = 21.40 - recoil_x; weapon.pos_y = 5.60 + recoil_y; weapon.rotation = 0; weapon.sprite = spr_usp_leverslide; weapon.index = 2; weapon.is_visible = true
				break
			case 3: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				arm_right.pos_x = 20.80 - recoil_x; arm_right.pos_y = 4.80 + recoil_y; arm_right.index = 0
				weapon.pos_x = 21.40 - recoil_x; weapon.pos_y = 5.60 + recoil_y; weapon.rotation = 0; weapon.sprite = spr_usp_leverslide; weapon.index = 2; weapon.is_visible = true
				break
			case 4: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				arm_right.pos_x = 20.80 - recoil_x; arm_right.pos_y = 4.80 + recoil_y; arm_right.index = 0
				weapon.pos_x = 21.40 - recoil_x; weapon.pos_y = 5.60 + recoil_y; weapon.rotation = 0; weapon.sprite = spr_usp_leverslide; weapon.index = 1; weapon.is_visible = true
				break
			case 5: ds_list_add(anim_draw_order, arm_left); ds_list_add(anim_draw_order, arm_right); ds_list_add(anim_draw_order, weapon); 
				arm_left.pos_x = 0; arm_left.pos_y = 0; arm_left.index = 0
				arm_right.pos_x = 20.80 - recoil_x; arm_right.pos_y = 4.80 + recoil_y; arm_right.index = 0
				weapon.pos_x = 21.40 - recoil_x; weapon.pos_y = 5.60 + recoil_y; weapon.rotation = 0; weapon.sprite = spr_usp_leverslide; weapon.index = 0; weapon.is_visible = true
				anim_end = true
				break
		}
	}



}
