/// @param dog_obj
/// @param arm_obj
function dog_draw_arm() {

	var dog = argument[0];
	var arm = argument[1];

	with (dog) {
		var arm_pos_x = arm.pos_x + anim_arms_offset_x
		var arm_pos_y = arm.pos_y + anim_arms_offset_y
		var hand_sprite = asset_get_index(appearance[? APP_KEY_KIND] + "_hand");
		var arm_sprite = asset_get_index(appearance[? APP_KEY_KIND] + "_arm");
		if (arm.object_index == obj_dog_arm_right || object_is_ancestor(arm.object_index, obj_dog_arm_right)) {
			var shoulder_x = arms_offset;
			var shoulder_y = shoulder_offset + clamp(0.9*(arm_pos_y - 3), 0, 2);
			var dist = point_distance(arm_pos_x, arm_pos_y, shoulder_x, shoulder_y);
			var dir = point_direction(arm_pos_x, arm_pos_y, shoulder_x, shoulder_y);
			draw_sprite_ext(hand_sprite, arm.index, x + lengthdir_x(arm_pos_x, rotation) + lengthdir_x(arm_pos_y, rotation - 90), y + lengthdir_y(arm_pos_x, rotation) + lengthdir_y(arm_pos_y, rotation - 90), 1, 1, dir+180+rotation, c_white, 1)
			var arm_index = ceil(dist-4); if (arm_index < 0) arm_index = 0
			draw_sprite_ext(arm_sprite, arm_index, x + lengthdir_x(arm_pos_x, rotation) + lengthdir_x(arm_pos_y, rotation - 90) + lengthdir_x(4, dir+rotation), y + lengthdir_y(arm_pos_x, rotation) + lengthdir_y(arm_pos_y, rotation - 90) + lengthdir_y(4, dir+rotation), 1, 1, dir+180+rotation, c_white, 1)
		} else if (arm.object_index == obj_dog_arm_left || object_is_ancestor(arm.object_index, obj_dog_arm_left)) {
			var shoulder_x = arms_offset;
			var shoulder_y = -shoulder_offset + clamp(0.9*(arm_pos_y + 3), -2, 0);
			var dist = point_distance(arm_pos_x, arm_pos_y, shoulder_x, shoulder_y);
			var dir = point_direction(arm_pos_x, arm_pos_y, shoulder_x, shoulder_y);
			draw_sprite_ext(hand_sprite, arm.index, x + lengthdir_x(arm_pos_x, rotation) + lengthdir_x(arm_pos_y, rotation - 90), y + lengthdir_y(arm_pos_x, rotation) + lengthdir_y(arm_pos_y, rotation - 90), 1, -1, dir+180+rotation, c_white, 1)
			var arm_index = ceil(dist-4); if (arm_index < 0) arm_index = 0
			draw_sprite_ext(arm_sprite, arm_index, x + lengthdir_x(arm_pos_x, rotation) + lengthdir_x(arm_pos_y, rotation - 90) + lengthdir_x(4, dir+rotation), y + lengthdir_y(arm_pos_x, rotation) + lengthdir_y(arm_pos_y, rotation - 90) + lengthdir_y(4, dir+rotation), 1, -1, dir+180+rotation, c_white, 1)
		}
	}


}
