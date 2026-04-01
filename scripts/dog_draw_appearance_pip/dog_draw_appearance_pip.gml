/// @param dog_obj
function dog_draw_appearance_pip() {

	var dog = argument[0];

	with (dog) {
		//Draw arms
		if (anim_arms != undefined && anim_draw_order != undefined && ds_exists(anim_draw_order, ds_type_list)) {
			for (var i = 0; i < ds_list_size(anim_draw_order); i ++) {
				var component = anim_draw_order[|i];
				if (component.object_index == obj_dog_arm || object_is_ancestor(component.object_index, obj_dog_arm)) {
					dog_draw_arm(id, component)
				} else if (component.object_index == obj_weapon || object_is_ancestor(component.object_index, obj_weapon)) {
					dog_draw_weapon(id, component)
				} else {
					dog_draw_component(id, component)
				}
			}
		}
	
		//Draw body
		var body_spr = asset_get_index(appearance[? APP_KEY_KIND] + "_body");
		draw_sprite_ext(body_spr, anim_body, x, y, 1, 1, rotation, c_white, 1)
	
		//Draw head
		var head_spr = asset_get_index(appearance[? APP_KEY_KIND] + "_head");
		draw_sprite_ext(head_spr, anim_head, x + lengthdir_x(head_offset - anim_head_kickback, rotation), y + lengthdir_y(head_offset - anim_head_kickback, rotation), 1, 1, -head.phy_rotation, c_white, 1)
	
		//Draw eyes
		var eyes_spr = asset_get_index(appearance[? APP_KEY_KIND] + (anim_blink ? "_eyes_blink" : "_eyes"));
		draw_sprite_ext(eyes_spr, anim_eyes, x + lengthdir_x(head_offset - anim_head_kickback, rotation), y + lengthdir_y(head_offset - anim_head_kickback, rotation), 1, 1, -head.phy_rotation, c_white, 1)
	
		//Draw tail
		var tail_spr = asset_get_index(appearance[? APP_KEY_KIND] + "_tail");
		draw_sprite_ext(tail_spr, anim_tail, x + lengthdir_x(tail_offset, rotation), y + lengthdir_y(tail_offset, rotation), 1, 1, rotation, c_white, 1)
	}


}
