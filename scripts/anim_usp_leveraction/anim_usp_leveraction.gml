// Generated animation script
// To be called by an obj_weapon
function anim_usp_leveraction() {

	// Animation end
	anim_end = anim_frame >= 53

	// Draw order changes
	if (anim_frame >= 0 && anim_frame < 12 &&
		(anim_frame_prev < 0 || anim_frame_prev >= 12)) {
		new_anim_draw_order("arm_left", "grip", "arm_right", "weapon")
	} else 	if (anim_frame >= 12 && anim_frame < 50 &&
		(anim_frame_prev < 12 || anim_frame_prev >= 50)) {
		new_anim_draw_order("grip", "arm_right", "weapon", "arm_left")
	} else 	if (anim_frame >= 50 && anim_frame < 54 &&
		(anim_frame_prev < 50 || anim_frame_prev >= 54)) {
		new_anim_draw_order("arm_left", "grip", "arm_right", "weapon")
	}

	switch (anim_frame) {
		case 0:
			with (anim_components[? "arm_left"]) {pos_x=0; pos_y=0; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=21.40; pos_y=5.60; pos_rot=0; sprite=spr_usp_grip_turnside; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=20.80; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.40; pos_y=5.60; pos_rot=0; sprite=spr_usp_gripless_turnside; index=0; is_visible=true; update_wcomponents()} break
		case 1:
			with (anim_components[? "arm_left"]) {pos_x=1.60; pos_y=-0.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=21.66; pos_y=5.14; pos_rot=0; sprite=spr_usp_grip_turnside; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.29; pos_y=4.77; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.66; pos_y=5.14; pos_rot=0; sprite=spr_usp_gripless_turnside; index=0; is_visible=true; update_wcomponents()} break
		case 2:
			with (anim_components[? "arm_left"]) {pos_x=3.20; pos_y=-0.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=21.91; pos_y=4.69; pos_rot=0; sprite=spr_usp_grip_turnside; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.77; pos_y=4.74; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.91; pos_y=4.69; pos_rot=0; sprite=spr_usp_gripless_turnside; index=1; is_visible=true; update_wcomponents()} break
		case 3:
			with (anim_components[? "arm_left"]) {pos_x=4.80; pos_y=-0.77; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=22.17; pos_y=4.23; pos_rot=0; sprite=spr_usp_grip_turnside; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=22.26; pos_y=4.71; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.17; pos_y=4.23; pos_rot=0; sprite=spr_usp_gripless_turnside; index=1; is_visible=true; update_wcomponents()} break
		case 4:
			with (anim_components[? "arm_left"]) {pos_x=6.40; pos_y=-1.03; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=22.43; pos_y=3.77; pos_rot=0; sprite=spr_usp_grip_turnside; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=22.74; pos_y=4.69; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.43; pos_y=3.77; pos_rot=0; sprite=spr_usp_gripless_turnside; index=1; is_visible=true; update_wcomponents()} break
		case 5:
			with (anim_components[? "arm_left"]) {pos_x=8; pos_y=-1.29; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=22.69; pos_y=3.31; pos_rot=0; sprite=spr_usp_grip_turnside; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23.23; pos_y=4.66; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.69; pos_y=3.31; pos_rot=0; sprite=spr_usp_gripless_turnside; index=1; is_visible=true; update_wcomponents()} break
		case 6:
			with (anim_components[? "arm_left"]) {pos_x=9.60; pos_y=-1.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=22.94; pos_y=2.86; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23.71; pos_y=4.63; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.94; pos_y=2.86; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()} break
		case 7:
			with (anim_components[? "arm_left"]) {pos_x=11.20; pos_y=-1.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=23.20; pos_y=2.40; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.20; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.20; pos_y=2.40; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()} break
		case 8:
			with (anim_components[? "arm_left"]) {pos_x=12.89; pos_y=-1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=23.18; pos_y=2.42; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.18; pos_y=4.62; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.18; pos_y=2.42; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()} break
		case 9:
			with (anim_components[? "arm_left"]) {pos_x=14.58; pos_y=-1.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=23.16; pos_y=2.44; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.16; pos_y=4.64; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.16; pos_y=2.44; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()} break
		case 10:
			with (anim_components[? "arm_left"]) {pos_x=16.27; pos_y=-0.93; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=23.13; pos_y=2.47; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.13; pos_y=4.67; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.13; pos_y=2.47; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()} break
		case 11:
			with (anim_components[? "arm_left"]) {pos_x=17.96; pos_y=-0.64; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=23.11; pos_y=2.49; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.11; pos_y=4.69; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.11; pos_y=2.49; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()} break
		case 12:
			with (anim_components[? "grip"]) {pos_x=23.09; pos_y=2.51; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.09; pos_y=4.71; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.09; pos_y=2.51; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.64; pos_y=-0.36; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 13:
			with (anim_components[? "grip"]) {pos_x=23.07; pos_y=2.53; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.07; pos_y=4.73; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.07; pos_y=2.53; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=21.33; pos_y=-0.07; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 14:
			with (anim_components[? "grip"]) {pos_x=23.04; pos_y=2.56; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.04; pos_y=4.76; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.04; pos_y=2.56; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.02; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 15:
			with (anim_components[? "grip"]) {pos_x=23.02; pos_y=2.58; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.02; pos_y=4.78; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.02; pos_y=2.58; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.71; pos_y=0.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 16:
			with (anim_components[? "grip"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=26.40; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 17:
			with (anim_components[? "grip"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=26.40; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 18:
			with (anim_components[? "grip"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=26.40; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 19:
			with (anim_components[? "grip"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=26.40; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 20:
			with (anim_components[? "grip"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23; pos_y=2.60; pos_rot=0; sprite=spr_usp_gripless_leveractionside; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=26.40; pos_y=0.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 21:
			with (anim_components[? "grip"]) {pos_x=22.67; pos_y=2.53; pos_rot=2.65; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23.67; pos_y=4.73; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.67; pos_y=2.53; pos_rot=2.65; sprite=spr_usp_gripless_leveractionside; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=24.73; pos_y=0.93; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 22:
			with (anim_components[? "grip"]) {pos_x=22.33; pos_y=2.47; pos_rot=5.30; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23.33; pos_y=4.67; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.33; pos_y=2.47; pos_rot=5.30; sprite=spr_usp_gripless_leveractionside; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=23.07; pos_y=1.07; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 23:
			with (anim_components[? "grip"]) {pos_x=22; pos_y=2.40; pos_rot=7.95; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22; pos_y=2.40; pos_rot=7.95; sprite=spr_usp_gripless_leveractionside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=21.40; pos_y=1.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 24:
			with (anim_components[? "grip"]) {pos_x=21.48; pos_y=2.40; pos_rot=8.59; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=22.48; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.48; pos_y=2.40; pos_rot=8.59; sprite=spr_usp_gripless_leveractionside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20.88; pos_y=1.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 25:
			with (anim_components[? "grip"]) {pos_x=20.97; pos_y=2.40; pos_rot=9.22; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.97; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.97; pos_y=2.40; pos_rot=9.22; sprite=spr_usp_gripless_leveractionside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=20.37; pos_y=1.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 26:
			with (anim_components[? "grip"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.45; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_gripless_leveractionside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.85; pos_y=1.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 27:
			with (anim_components[? "grip"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.45; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_gripless_leveractionside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.85; pos_y=1.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 28:
			with (anim_components[? "grip"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.45; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_gripless_leveractionside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.85; pos_y=1.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 29:
			with (anim_components[? "grip"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.45; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_gripless_leveractionside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.85; pos_y=1.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 30:
			with (anim_components[? "grip"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.45; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.45; pos_y=2.40; pos_rot=9.86; sprite=spr_usp_gripless_leveractionside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.85; pos_y=1.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 31:
			with (anim_components[? "grip"]) {pos_x=21.45; pos_y=2.60; pos_rot=7.40; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=22.45; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.45; pos_y=2.60; pos_rot=7.40; sprite=spr_usp_gripless_leveractionside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.50; pos_y=1.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 32:
			with (anim_components[? "grip"]) {pos_x=22.45; pos_y=2.80; pos_rot=4.93; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23.45; pos_y=5; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.45; pos_y=2.80; pos_rot=4.93; sprite=spr_usp_gripless_leveractionside; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=19.15; pos_y=2.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 33:
			with (anim_components[? "grip"]) {pos_x=23.45; pos_y=3; pos_rot=2.47; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.45; pos_y=5.20; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.45; pos_y=3; pos_rot=2.47; sprite=spr_usp_gripless_leveractionside; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=18.80; pos_y=2.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 34:
			with (anim_components[? "grip"]) {pos_x=24.45; pos_y=3.20; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=25.45; pos_y=5.40; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.45; pos_y=3.20; pos_rot=0; sprite=spr_usp_gripless_leveractionside; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=18.45; pos_y=3.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 35:
			with (anim_components[? "grip"]) {pos_x=24.56; pos_y=3.26; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=25.56; pos_y=5.46; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.56; pos_y=3.26; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=18.23; pos_y=3.15; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 36:
			with (anim_components[? "grip"]) {pos_x=24.68; pos_y=3.33; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=25.68; pos_y=5.53; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.68; pos_y=3.33; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=18; pos_y=3.10; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 37:
			with (anim_components[? "grip"]) {pos_x=24.79; pos_y=3.39; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=25.79; pos_y=5.59; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.79; pos_y=3.39; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=17.78; pos_y=3.05; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 38:
			with (anim_components[? "grip"]) {pos_x=24.90; pos_y=3.45; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=25.90; pos_y=5.65; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.90; pos_y=3.45; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=17.55; pos_y=3; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 39:
			with (anim_components[? "grip"]) {pos_x=25.01; pos_y=3.51; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=26.01; pos_y=5.71; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.01; pos_y=3.51; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=17.32; pos_y=2.95; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 40:
			with (anim_components[? "grip"]) {pos_x=25.13; pos_y=3.58; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=26.13; pos_y=5.78; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.13; pos_y=3.58; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=17.10; pos_y=2.90; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 41:
			with (anim_components[? "grip"]) {pos_x=25.24; pos_y=3.64; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=26.24; pos_y=5.84; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.24; pos_y=3.64; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=16.88; pos_y=2.85; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 42:
			with (anim_components[? "grip"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=26.35; pos_y=5.90; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=16.65; pos_y=2.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 43:
			with (anim_components[? "grip"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=26.35; pos_y=5.90; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=15.25; pos_y=2.15; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 44:
			with (anim_components[? "grip"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=26.35; pos_y=5.90; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=13.85; pos_y=1.50; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 45:
			with (anim_components[? "grip"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=26.35; pos_y=5.90; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=12.45; pos_y=0.85; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 46:
			with (anim_components[? "grip"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=26.35; pos_y=5.90; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.35; pos_y=3.70; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=11.05; pos_y=0.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 47:
			with (anim_components[? "grip"]) {pos_x=24.79; pos_y=3.97; pos_rot=0; sprite=spr_usp_grip_turnside; index=2; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=25.56; pos_y=5.74; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.79; pos_y=3.97; pos_rot=0; sprite=spr_usp_gripless_turnside; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=9.47; pos_y=0.17; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 48:
			with (anim_components[? "grip"]) {pos_x=24.22; pos_y=4.24; pos_rot=0; sprite=spr_usp_grip_turnside; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=24.76; pos_y=5.59; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.22; pos_y=4.24; pos_rot=0; sprite=spr_usp_gripless_turnside; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=7.89; pos_y=0.14; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 49:
			with (anim_components[? "grip"]) {pos_x=23.66; pos_y=4.51; pos_rot=0; sprite=spr_usp_grip_turnside; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23.97; pos_y=5.43; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.66; pos_y=4.51; pos_rot=0; sprite=spr_usp_gripless_turnside; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "arm_left"]) {pos_x=6.31; pos_y=0.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; } break
		case 50:
			with (anim_components[? "arm_left"]) {pos_x=4.74; pos_y=0.09; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=23.09; pos_y=4.79; pos_rot=0; sprite=spr_usp_grip_turnside; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=23.18; pos_y=5.27; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.09; pos_y=4.79; pos_rot=0; sprite=spr_usp_gripless_turnside; index=1; is_visible=true; update_wcomponents()} break
		case 51:
			with (anim_components[? "arm_left"]) {pos_x=3.16; pos_y=0.06; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=22.53; pos_y=5.06; pos_rot=0; sprite=spr_usp_grip_turnside; index=1; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=22.39; pos_y=5.11; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.53; pos_y=5.06; pos_rot=0; sprite=spr_usp_gripless_turnside; index=1; is_visible=true; update_wcomponents()} break
		case 52:
			with (anim_components[? "arm_left"]) {pos_x=1.58; pos_y=0.03; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=21.96; pos_y=5.33; pos_rot=0; sprite=spr_usp_grip_turnside; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=21.59; pos_y=4.96; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.96; pos_y=5.33; pos_rot=0; sprite=spr_usp_gripless_turnside; index=0; is_visible=true; update_wcomponents()} break
		case 53:
			with (anim_components[? "arm_left"]) {pos_x=0; pos_y=0; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "grip"]) {pos_x=21.40; pos_y=5.60; pos_rot=0; sprite=spr_usp_grip_turnside; index=0; is_visible=true; }
			with (anim_components[? "arm_right"]) {pos_x=20.80; pos_y=4.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.40; pos_y=5.60; pos_rot=0; sprite=spr_usp_gripless_turnside; index=0; is_visible=true; update_wcomponents()} break
	}

}
