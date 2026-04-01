/// @param sprite
/// @param frame
/// @param component
/// @param attribute*
function weapon_gun_striker_data() {

	/// components: silencer, barrel, stock, red dot sight

	var sprite = argument[0];
	var frame = argument[1];
	var component = argument[2];
	var attribute = undefined;
	if (argument_count > 3) attribute = argument[3]

	switch (sprite) {
		case spr_striker: 
			switch (frame) {
				case 0: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 15
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_silencer_striker
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 15
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "stock": 
							switch (attribute) {
								case ATTR_X: return -10
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_stock_striker
								case ATTR_IND: return 0
							}
						break
						case "red dot sight": 
							switch (attribute) {
								case ATTR_X: return 4
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_reddotsight_striker
								case ATTR_IND: return 0
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							ds_list_add(draw_order, "stock")
							ds_list_add(draw_order, "red dot sight")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 1: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 15
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_silencer_striker
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 15
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "stock": 
							switch (attribute) {
								case ATTR_X: return -10
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_stock_striker
								case ATTR_IND: return 1
							}
						break
						case "red dot sight": 
							switch (attribute) {
								case ATTR_X: return 4
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_reddotsight_striker
								case ATTR_IND: return 1
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							ds_list_add(draw_order, "stock")
							ds_list_add(draw_order, "red dot sight")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 2: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 15
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_silencer_striker
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return 15
								case ATTR_Y: return 0
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "stock": 
							switch (attribute) {
								case ATTR_X: return -10
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_stock_striker
								case ATTR_IND: return 2
							}
						break
						case "red dot sight": 
							switch (attribute) {
								case ATTR_X: return 4
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_reddotsight_striker
								case ATTR_IND: return 2
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							ds_list_add(draw_order, "stock")
							ds_list_add(draw_order, "red dot sight")
							return draw_order
						default: show_error("Weapon does not have component " + component, false); break
					}
				break
				case 3: 
					switch (component) {
						case "silencer": 
							switch (attribute) {
								case ATTR_X: return 15
								case ATTR_Y: return 2
								case ATTR_SPR: return spr_silencer_striker
								case ATTR_IND: return 0
							}
						break
						case "barrel": 
							switch (attribute) {
								case ATTR_X: return -6
								case ATTR_Y: return 3
								case ATTR_SPR: return undefined
								case ATTR_IND: return 0
							}
						break
						case "stock": 
							switch (attribute) {
								case ATTR_X: return -10
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_stock_striker
								case ATTR_IND: return 3
							}
						break
						case "red dot sight": 
							switch (attribute) {
								case ATTR_X: return 4
								case ATTR_Y: return 0
								case ATTR_SPR: return spr_reddotsight_striker
								case ATTR_IND: return 3
							}
						break
						case "draw_order": 
							var draw_order = ds_list_create();
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "1")
							ds_list_add(draw_order, "silencer")
							ds_list_add(draw_order, "barrel")
							ds_list_add(draw_order, "stock")
							ds_list_add(draw_order, "red dot sight")
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
