event_inherited()

// Generated function
// Updates properties of wcomponents
function update_wcomponents() {

	switch (sprite) {
	case spr_striker:
		switch (index) {
		case 0:
			new_wcomponents_draw_order("1", "silencer", "barrel", "stock", "red dot sight")
			if (ds_map_exists(wcomponents, "silencer")) {with (wcomponents[? "silencer"]) {pos_x=other.pos_x + 15; pos_y=other.pos_y + 0; sprite=spr_silencer_striker; index=0; is_visible=true; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "barrel")) {with (wcomponents[? "barrel"]) {pos_x=other.pos_x + 15; pos_y=other.pos_y + 0; sprite=undefined; index=0; is_visible=false; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "stock")) {with (wcomponents[? "stock"]) {pos_x=other.pos_x + -10; pos_y=other.pos_y + 0; sprite=spr_stock_striker; index=0; is_visible=true; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "red dot sight")) {with (wcomponents[? "red dot sight"]) {pos_x=other.pos_x + 4; pos_y=other.pos_y + 0; sprite=spr_reddotsight_striker; index=0; is_visible=true; pos_rot=other.pos_rot}} break
		case 1:
			new_wcomponents_draw_order("1", "silencer", "barrel", "stock", "red dot sight")
			if (ds_map_exists(wcomponents, "silencer")) {with (wcomponents[? "silencer"]) {pos_x=other.pos_x + 15; pos_y=other.pos_y + 0; sprite=spr_silencer_striker; index=0; is_visible=true; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "barrel")) {with (wcomponents[? "barrel"]) {pos_x=other.pos_x + 15; pos_y=other.pos_y + 0; sprite=undefined; index=0; is_visible=false; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "stock")) {with (wcomponents[? "stock"]) {pos_x=other.pos_x + -10; pos_y=other.pos_y + 0; sprite=spr_stock_striker; index=1; is_visible=true; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "red dot sight")) {with (wcomponents[? "red dot sight"]) {pos_x=other.pos_x + 4; pos_y=other.pos_y + 0; sprite=spr_reddotsight_striker; index=1; is_visible=true; pos_rot=other.pos_rot}} break
		case 2:
			new_wcomponents_draw_order("1", "silencer", "barrel", "stock", "red dot sight")
			if (ds_map_exists(wcomponents, "silencer")) {with (wcomponents[? "silencer"]) {pos_x=other.pos_x + 15; pos_y=other.pos_y + 0; sprite=spr_silencer_striker; index=0; is_visible=true; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "barrel")) {with (wcomponents[? "barrel"]) {pos_x=other.pos_x + 15; pos_y=other.pos_y + 0; sprite=undefined; index=0; is_visible=false; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "stock")) {with (wcomponents[? "stock"]) {pos_x=other.pos_x + -10; pos_y=other.pos_y + 0; sprite=spr_stock_striker; index=2; is_visible=true; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "red dot sight")) {with (wcomponents[? "red dot sight"]) {pos_x=other.pos_x + 4; pos_y=other.pos_y + 0; sprite=spr_reddotsight_striker; index=2; is_visible=true; pos_rot=other.pos_rot}} break
		case 3:
			new_wcomponents_draw_order("1", "silencer", "barrel", "stock", "red dot sight")
			if (ds_map_exists(wcomponents, "silencer")) {with (wcomponents[? "silencer"]) {pos_x=other.pos_x + 15; pos_y=other.pos_y + 2; sprite=spr_silencer_striker; index=0; is_visible=true; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "barrel")) {with (wcomponents[? "barrel"]) {pos_x=other.pos_x + -6; pos_y=other.pos_y + 3; sprite=undefined; index=0; is_visible=false; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "stock")) {with (wcomponents[? "stock"]) {pos_x=other.pos_x + -10; pos_y=other.pos_y + 0; sprite=spr_stock_striker; index=3; is_visible=true; pos_rot=other.pos_rot}}
			if (ds_map_exists(wcomponents, "red dot sight")) {with (wcomponents[? "red dot sight"]) {pos_x=other.pos_x + 4; pos_y=other.pos_y + 0; sprite=spr_reddotsight_striker; index=3; is_visible=true; pos_rot=other.pos_rot}} break
		} break
	}

}