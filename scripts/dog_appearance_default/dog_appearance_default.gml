/// @param dog_obj
function dog_appearance_default() {

	var dog = argument[0];

	with (dog) {
		//Animate body
		var body_sprite = asset_get_index(appearance[? APP_KEY_KIND] + "_body");
		if (body_sprite != undefined && sprite_exists(body_sprite)) {
			var decomposed_speed = length_in_direction(speed_x, speed_y, rotation)
			if (abs(decomposed_speed) > 0.2) anim_body += decomposed_speed * anim_walk_speed
			else anim_body = 0
			anim_body = strong_mod(anim_body, sprite_get_number(body_sprite))
		}
	}


}
