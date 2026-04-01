/// @param sprite
/// @param frame
/// @param component
/// @param attribute*
function weapon_gun_usp_data() {

	/// components: silencer, barrel

	var sprite = argument[0];
	var frame = argument[1];
	var component = argument[2];
	var attribute = undefined;
	if (argument_count > 3) attribute = argument[3]

	switch (sprite) {
		case spr_usp: 
			switch (frame) {
				case 0: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				default: show_error("Frame index " + string(frame) + " out of range of " + sprite_get_name(sprite), false); break
			}
		break
		case spr_usp_gripless_turnside: 
			switch (frame) {
				case 0: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 1: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 2: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				default: show_error("Frame index " + string(frame) + " out of range of " + sprite_get_name(sprite), false); break
			}
		break
		case spr_usp_turnside: 
			switch (frame) {
				case 0: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 1: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 2: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 3: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 4: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 5: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 6: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 7: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				default: show_error("Frame index " + string(frame) + " out of range of " + sprite_get_name(sprite), false); break
			}
		break
		case spr_usp_gripless_leveractionside: 
			switch (frame) {
				case 0: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 1: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 2: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 3: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 4: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 5: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				default: show_error("Frame index " + string(frame) + " out of range of " + sprite_get_name(sprite), false); break
			}
		break
		case spr_usp_leveractionside: 
			switch (frame) {
				case 0: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 1: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 2: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 3: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 4: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 5: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				default: show_error("Frame index " + string(frame) + " out of range of " + sprite_get_name(sprite), false); break
			}
		break
		case spr_usp_leverslide: 
			switch (frame) {
				case 0: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 7
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 1: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 6
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 2: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 5
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_usp_silencer
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 0
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				default: show_error("Frame index " + string(frame) + " out of range of " + sprite_get_name(sprite), false); break
			}
		break
		default: show_error("Invalid sprite index: " + string(sprite), false); break
	}



}
