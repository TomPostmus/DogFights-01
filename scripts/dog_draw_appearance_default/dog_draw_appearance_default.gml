/// @param dog_obj
function dog_draw_appearance_default() {

	var dog = argument[0];

	with (dog) {
		//Draw arms
		if (anim_arms != undefined && anim_draw_order != undefined && ds_exists(anim_draw_order, ds_type_list)) {
			for (var i = 0; i < ds_list_size(anim_draw_order); i ++) {
				var component = anim_draw_order[|i];
				if (object_is_class(component.object_index, obj_dog_arm)) {
					dog_draw_arm(id, component)
				} else if (object_is_class(component.object_index, obj_weapon)) {
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
		draw_sprite_ext(head_spr, anim_head, x + lengthdir_x(head_offset - anim_head_kickback, rotation), y + lengthdir_y(head_offset - anim_head_kickback, rotation), 1, 1, anim_angle_head, c_white, 1)
	}


}
