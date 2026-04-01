// Generated animation script
// To be called by an obj_weapon
function anim_lupara_selectfire() {

	// Animation end
	anim_end = anim_frame >= 66

	// Draw order changes
	if (anim_frame >= 0 && anim_frame < 26 &&
		(anim_frame_prev < 0 || anim_frame_prev >= 26)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon", "stock")
	} else 	if (anim_frame >= 26 && anim_frame < 56 &&
		(anim_frame_prev < 26 || anim_frame_prev >= 56)) {
		new_anim_draw_order("arm_right", "weapon", "stock", "arm_left")
	} else 	if (anim_frame >= 56 && anim_frame < 67 &&
		(anim_frame_prev < 56 || anim_frame_prev >= 67)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon", "stock")
	}

	switch (anim_frame) {
		case 0:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.14; pos_y=5.39; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.21; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.23; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 1:
			with (anim_components[? "arm_right"]) {pos_x=15.03; pos_y=4.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.81; pos_y=4.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.94; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.96; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 2:
			with (anim_components[? "arm_right"]) {pos_x=15.19; pos_y=4.67; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.81; pos_y=4.10; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.31; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.33; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 3:
			with (anim_components[? "arm_right"]) {pos_x=15.35; pos_y=4.66; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.81; pos_y=3.94; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.67; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.69; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 4:
			with (anim_components[? "arm_right"]) {pos_x=15.51; pos_y=4.65; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.81; pos_y=3.62; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.04; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=11.06; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 5:
			with (anim_components[? "arm_right"]) {pos_x=15.67; pos_y=4.63; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.33; pos_y=3.13; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.41; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=11.42; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 6:
			with (anim_components[? "arm_right"]) {pos_x=15.83; pos_y=4.62; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.85; pos_y=2.65; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.77; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=11.79; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 7:
			with (anim_components[? "arm_right"]) {pos_x=15.99; pos_y=4.61; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.52; pos_y=2.65; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.14; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=12.15; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 8:
			with (anim_components[? "arm_right"]) {pos_x=16.16; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.88; pos_y=2.49; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.50; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=12.52; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 9:
			with (anim_components[? "arm_right"]) {pos_x=16.32; pos_y=4.59; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.07; pos_y=2.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.87; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=12.89; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 10:
			with (anim_components[? "arm_right"]) {pos_x=16.48; pos_y=4.58; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.78; pos_y=1.36; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.23; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=13.25; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 11:
			with (anim_components[? "arm_right"]) {pos_x=16.64; pos_y=4.57; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.33; pos_y=1.36; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.60; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=13.62; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 12:
			with (anim_components[? "arm_right"]) {pos_x=16.80; pos_y=4.56; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.46; pos_y=1.04; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.96; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=13.98; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 13:
			with (anim_components[? "arm_right"]) {pos_x=16.96; pos_y=4.55; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.36; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.33; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.35; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 14:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 15:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 16:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 17:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 18:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 19:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 20:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 21:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 22:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 23:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 24:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 25:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.72; pos_y=1.84; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 26:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=15.81; pos_y=3.78; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 27:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.46; pos_y=3.94; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 28:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.43; pos_y=3.94; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 29:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=4.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 30:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.88; pos_y=4.91; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 31:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.36; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 32:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.36; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 33:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.36; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 34:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.88; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 35:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 36:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 37:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 38:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 39:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 40:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 41:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 42:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 43:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 44:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 45:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 46:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 47:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 48:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 49:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 50:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 51:
			with (anim_components[? "arm_right"]) {pos_x=17.12; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.70; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 52:
			with (anim_components[? "arm_right"]) {pos_x=16.88; pos_y=4.55; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.15; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.17; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.04; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 53:
			with (anim_components[? "arm_right"]) {pos_x=16.64; pos_y=4.57; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.60; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=13.62; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.01; pos_y=4.29; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 54:
			with (anim_components[? "arm_right"]) {pos_x=16.40; pos_y=4.59; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.05; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=13.07; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.98; pos_y=3.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 55:
			with (anim_components[? "arm_right"]) {pos_x=16.16; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.50; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=12.52; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.94; pos_y=3.36; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 56:
			with (anim_components[? "arm_right"]) {pos_x=15.91; pos_y=4.62; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.75; pos_y=2.89; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.95; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=11.97; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 57:
			with (anim_components[? "arm_right"]) {pos_x=15.67; pos_y=4.63; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.75; pos_y=2.10; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.41; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=11.42; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 58:
			with (anim_components[? "arm_right"]) {pos_x=15.43; pos_y=4.65; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.69; pos_y=3.57; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.86; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.88; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 59:
			with (anim_components[? "arm_right"]) {pos_x=15.19; pos_y=4.67; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.98; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.31; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.33; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 60:
			with (anim_components[? "arm_right"]) {pos_x=14.95; pos_y=4.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.43; pos_y=4.08; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.76; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.78; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 61:
			with (anim_components[? "arm_right"]) {pos_x=14.95; pos_y=4.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.75; pos_y=4.25; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.76; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.78; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 62:
			with (anim_components[? "arm_right"]) {pos_x=14.95; pos_y=4.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.07; pos_y=4.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.76; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.78; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 63:
			with (anim_components[? "arm_right"]) {pos_x=14.95; pos_y=4.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.56; pos_y=4.57; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.76; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.78; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 64:
			with (anim_components[? "arm_right"]) {pos_x=14.95; pos_y=4.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.36; pos_y=4.89; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.76; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.78; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 65:
			with (anim_components[? "arm_right"]) {pos_x=14.95; pos_y=4.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.69; pos_y=4.89; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.76; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.78; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 66:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.14; pos_y=5.39; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.21; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.23; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
	}

}
