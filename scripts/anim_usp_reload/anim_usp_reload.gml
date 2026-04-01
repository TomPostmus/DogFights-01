// Generated animation script
// To be called by an obj_weapon
function anim_usp_reload() {

	// Animation end
	anim_end = anim_frame >= 88

	// Draw order changes
	if (anim_frame >= 0 && anim_frame < 10 &&
		(anim_frame_prev < 0 || anim_frame_prev >= 10)) {
		new_anim_draw_order("arm_left", "arm_right", "weapon")
	} else 	if (anim_frame >= 10 && anim_frame < 15 &&
		(anim_frame_prev < 10 || anim_frame_prev >= 15)) {
		new_anim_draw_order("arm_right", "weapon", "arm_left")
	} else 	if (anim_frame >= 15 && anim_frame < 37 &&
		(anim_frame_prev < 15 || anim_frame_prev >= 37)) {
		new_anim_draw_order("arm_right", "mag", "weapon", "arm_left")
	} else 	if (anim_frame >= 37 && anim_frame < 49 &&
		(anim_frame_prev < 37 || anim_frame_prev >= 49)) {
		new_anim_draw_order("arm_right", "weapon", "arm_left")
	} else 	if (anim_frame >= 49 && anim_frame < 76 &&
		(anim_frame_prev < 49 || anim_frame_prev >= 76)) {
		new_anim_draw_order("arm_right", "mag", "weapon", "arm_left")
	} else 	if (anim_frame >= 76 && anim_frame < 85 &&
		(anim_frame_prev < 76 || anim_frame_prev >= 85)) {
		new_anim_draw_order("arm_right", "weapon", "arm_left")
	} else 	if (anim_frame >= 85 && anim_frame < 89 &&
		(anim_frame_prev < 85 || anim_frame_prev >= 89)) {
		new_anim_draw_order("arm_left", "arm_right", "weapon")
	}

	switch (anim_frame) {
		case 0:
			with (anim_components[? "arm_left"]) {pos_x=0; pos_y=0; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=20.80; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.40; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=5; is_visible=true; update_wcomponents()} break
		case 1:
			with (anim_components[? "arm_left"]) {pos_x=2.66; pos_y=-0.31; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.31; pos_y=4.46; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.77; pos_y=5.69; pos_rot=0; sprite=spr_usp_turnside; index=5; is_visible=true; update_wcomponents()} break
		case 2:
			with (anim_components[? "arm_left"]) {pos_x=5.31; pos_y=-0.63; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.83; pos_y=4.11; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.14; pos_y=5.77; pos_rot=0; sprite=spr_usp_turnside; index=6; is_visible=true; update_wcomponents()} break
		case 3:
			with (anim_components[? "arm_left"]) {pos_x=7.97; pos_y=-0.94; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=22.34; pos_y=3.77; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.51; pos_y=5.86; pos_rot=0; sprite=spr_usp_turnside; index=6; is_visible=true; update_wcomponents()} break
		case 4:
			with (anim_components[? "arm_left"]) {pos_x=10.63; pos_y=-1.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=22.86; pos_y=3.43; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.89; pos_y=5.94; pos_rot=0; sprite=spr_usp_turnside; index=6; is_visible=true; update_wcomponents()} break
		case 5:
			with (anim_components[? "arm_left"]) {pos_x=13.29; pos_y=-1.57; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23.37; pos_y=3.09; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.26; pos_y=6.03; pos_rot=0; sprite=spr_usp_turnside; index=6; is_visible=true; update_wcomponents()} break
		case 6:
			with (anim_components[? "arm_left"]) {pos_x=15.94; pos_y=-1.89; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23.89; pos_y=2.74; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.63; pos_y=6.11; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()} break
		case 7:
			with (anim_components[? "arm_left"]) {pos_x=18.60; pos_y=-2.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.40; pos_y=2.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24; pos_y=6.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()} break
		case 8:
			with (anim_components[? "arm_left"]) {pos_x=19.80; pos_y=-1.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.44; pos_y=2.28; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.04; pos_y=6.08; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()} break
		case 9:
			with (anim_components[? "arm_left"]) {pos_x=21; pos_y=-1.40; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.48; pos_y=2.16; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.08; pos_y=5.96; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()} break
		case 10:
			with (anim_components[? "arm_right"]) {pos_x=24.52; pos_y=2.04; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.12; pos_y=5.84; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=22.20; pos_y=-1; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; } break
		case 11:
			with (anim_components[? "arm_right"]) {pos_x=24.56; pos_y=1.92; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.16; pos_y=5.72; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.40; pos_y=-0.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 12:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.60; pos_y=-0.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 13:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.52; pos_y=0; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 14:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.44; pos_y=0.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 15:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.20; pos_y=0.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.36; pos_y=0.40; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 16:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.20; pos_y=0.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.28; pos_y=0.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 17:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.20; pos_y=0.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.20; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 18:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.20; pos_y=0.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.20; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 19:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.20; pos_y=0.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.20; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 20:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.20; pos_y=0.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.20; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 21:
			with (anim_components[? "arm_right"]) {pos_x=24.60; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.20; pos_y=0.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.20; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.20; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 22:
			with (anim_components[? "arm_right"]) {pos_x=24.53; pos_y=2; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.13; pos_y=0.17; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.13; pos_y=5.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.13; pos_y=0.17; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 23:
			with (anim_components[? "arm_right"]) {pos_x=24.47; pos_y=2.20; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.07; pos_y=-0.47; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.07; pos_y=6; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.07; pos_y=-0.47; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 24:
			with (anim_components[? "arm_right"]) {pos_x=24.40; pos_y=2.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23; pos_y=-1.10; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24; pos_y=6.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24; pos_y=-1.10; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 25:
			with (anim_components[? "arm_right"]) {pos_x=24.33; pos_y=2.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.93; pos_y=-1.73; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.93; pos_y=6.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.93; pos_y=-1.73; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 26:
			with (anim_components[? "arm_right"]) {pos_x=24.27; pos_y=2.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.87; pos_y=-2.37; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.87; pos_y=6.60; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.87; pos_y=-2.37; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 27:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.80; pos_y=-3; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=-3; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 28:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.13; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.67; pos_y=-3.27; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.93; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.67; pos_y=-3.27; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 29:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.27; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.53; pos_y=-3.53; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.07; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.53; pos_y=-3.53; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 30:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.40; pos_y=-3.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.40; pos_y=-3.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 31:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.50; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.40; pos_y=-3.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.30; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.40; pos_y=-3.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 32:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.40; pos_y=-3.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.40; pos_y=-3.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 33:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=21.75; pos_y=-4.50; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=22.75; pos_y=-4.50; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 34:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=21.10; pos_y=-5.20; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=22.10; pos_y=-5.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 35:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=20.45; pos_y=-5.90; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=21.45; pos_y=-5.90; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 36:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=19.80; pos_y=-6.60; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20.80; pos_y=-6.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 37:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20.80; pos_y=-6.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; } break
		case 38:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20.60; pos_y=-6.70; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; } break
		case 39:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20.40; pos_y=-6.80; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; } break
		case 40:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20.20; pos_y=-6.90; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; } break
		case 41:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.40; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20; pos_y=-7; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; } break
		case 42:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.50; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.30; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=18.40; pos_y=-5.87; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; } break
		case 43:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=16.80; pos_y=-4.73; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; } break
		case 44:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.30; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.10; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=15.20; pos_y=-3.60; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; } break
		case 45:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.20; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=13.60; pos_y=-2.47; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; } break
		case 46:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.10; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.90; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=12; pos_y=-1.33; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 47:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=10.40; pos_y=-0.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 48:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=10.40; pos_y=-0.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 49:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=10; pos_y=1; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=10.40; pos_y=-0.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 50:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=10; pos_y=1; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=10.40; pos_y=-0.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 51:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=10; pos_y=1; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=10.40; pos_y=-0.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 52:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=11.47; pos_y=0.55; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=11.88; pos_y=-0.65; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 53:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=12.95; pos_y=0.10; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=13.35; pos_y=-1.10; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 54:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=14.43; pos_y=-0.35; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=14.82; pos_y=-1.55; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 55:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=15.90; pos_y=-0.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=16.30; pos_y=-2; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 56:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=17.38; pos_y=-1.25; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=17.77; pos_y=-2.45; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 57:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=18.85; pos_y=-1.70; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.25; pos_y=-2.90; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 58:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=20.32; pos_y=-2.15; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20.72; pos_y=-3.35; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 59:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=21.80; pos_y=-2.60; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=22.20; pos_y=-3.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 60:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.13; pos_y=-2.60; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=22.53; pos_y=-3.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 61:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.47; pos_y=-2.60; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=22.87; pos_y=-3.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 62:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.80; pos_y=-2.60; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.20; pos_y=-3.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 63:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.80; pos_y=-2.60; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.20; pos_y=-3.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 64:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=22.80; pos_y=-2.60; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.20; pos_y=-3.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 65:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23; pos_y=-0.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.40; pos_y=-2.00; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 66:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.20; pos_y=1.00; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.60; pos_y=-0.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 67:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.40; pos_y=2.80; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.80; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=1.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 68:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.13; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.40; pos_y=2.93; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=6.93; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=1.73; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 69:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.27; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.40; pos_y=3.07; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.07; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=1.87; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 70:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.40; pos_y=3.20; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=2; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 71:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.40; pos_y=3.20; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=2; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 72:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.40; pos_y=3.20; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=2; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 73:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.40; pos_y=3.20; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=2; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 74:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.40; pos_y=3.20; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=2; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 75:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "mag"]) {pos_x=23.40; pos_y=3.20; pos_rot=0; sprite=spr_usp_mag; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=2; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 76:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=2; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 77:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=22.32; pos_y=1.44; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 78:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20.84; pos_y=0.88; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 79:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.36; pos_y=0.32; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 80:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=17.88; pos_y=-0.24; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 81:
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=5; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.80; pos_y=7.20; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=16.40; pos_y=-0.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 82:
			with (anim_components[? "arm_right"]) {pos_x=23.71; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.46; pos_y=6.97; pos_rot=0; sprite=spr_usp_turnside; index=7; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=14.06; pos_y=-0.69; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; } break
		case 83:
			with (anim_components[? "arm_right"]) {pos_x=23.23; pos_y=3.80; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.11; pos_y=6.74; pos_rot=0; sprite=spr_usp_turnside; index=6; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=11.71; pos_y=-0.57; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; } break
		case 84:
			with (anim_components[? "arm_right"]) {pos_x=22.74; pos_y=4; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.77; pos_y=6.51; pos_rot=0; sprite=spr_usp_turnside; index=6; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=9.37; pos_y=-0.46; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; } break
		case 85:
			with (anim_components[? "arm_left"]) {pos_x=7.03; pos_y=-0.34; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=22.26; pos_y=4.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.43; pos_y=6.29; pos_rot=0; sprite=spr_usp_turnside; index=6; is_visible=true; update_wcomponents()} break
		case 86:
			with (anim_components[? "arm_left"]) {pos_x=4.69; pos_y=-0.23; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.77; pos_y=4.40; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.09; pos_y=6.06; pos_rot=0; sprite=spr_usp_turnside; index=6; is_visible=true; update_wcomponents()} break
		case 87:
			with (anim_components[? "arm_left"]) {pos_x=2.34; pos_y=-0.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.29; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.74; pos_y=5.83; pos_rot=0; sprite=spr_usp_turnside; index=5; is_visible=true; update_wcomponents()} break
		case 88:
			with (anim_components[? "arm_left"]) {pos_x=0; pos_y=0; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=20.80; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.40; pos_y=5.60; pos_rot=0; sprite=spr_usp_turnside; index=5; is_visible=true; update_wcomponents()} break
	}

}
