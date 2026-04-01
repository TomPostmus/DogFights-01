// Generated animation script
// To be called by an obj_weapon
function anim_lupara_reload_start() {

	// Animation end
	anim_end = anim_frame >= 104

	// Draw order changes
	if (anim_frame >= 0 && anim_frame < 105 &&
		(anim_frame_prev < 0 || anim_frame_prev >= 105)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon", "stock")
	}

	switch (anim_frame) {
		case 0:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.14; pos_y=5.39; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.21; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.23; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 1:
			with (anim_components[? "arm_right"]) {pos_x=15.19; pos_y=4.67; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.24; pos_y=4.47; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.99; pos_y=5.15; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.01; pos_y=6.14; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 2:
			with (anim_components[? "arm_right"]) {pos_x=15.44; pos_y=4.66; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.37; pos_y=3.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.38; pos_y=5.14; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.40; pos_y=6.13; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 3:
			with (anim_components[? "arm_right"]) {pos_x=15.93; pos_y=4.63; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.47; pos_y=2.59; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.17; pos_y=5.12; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=11.19; pos_y=6.12; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 4:
			with (anim_components[? "arm_right"]) {pos_x=16.18; pos_y=4.61; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.44; pos_y=1.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.56; pos_y=5.11; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=11.58; pos_y=6.11; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 5:
			with (anim_components[? "arm_right"]) {pos_x=16.67; pos_y=4.59; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.37; pos_y=1.05; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.34; pos_y=5.10; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=12.36; pos_y=6.10; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 6:
			with (anim_components[? "arm_right"]) {pos_x=17.16; pos_y=4.56; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.14; pos_y=0.13; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.12; pos_y=5.08; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=13.14; pos_y=6.08; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 7:
			with (anim_components[? "arm_right"]) {pos_x=17.65; pos_y=4.53; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.57; pos_y=-0.46; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.90; pos_y=5.06; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=13.92; pos_y=6.07; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 8:
			with (anim_components[? "arm_right"]) {pos_x=18.14; pos_y=4.50; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.68; pos_y=-0.88; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.68; pos_y=5.05; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.71; pos_y=6.06; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 9:
			with (anim_components[? "arm_right"]) {pos_x=18.63; pos_y=4.47; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.94; pos_y=-1.13; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.46; pos_y=5.03; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.49; pos_y=6.04; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 10:
			with (anim_components[? "arm_right"]) {pos_x=19.12; pos_y=4.45; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.88; pos_y=-1.38; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.25; pos_y=5.01; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.27; pos_y=6.03; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 11:
			with (anim_components[? "arm_right"]) {pos_x=19.93; pos_y=4.40; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.48; pos_y=-0.77; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.17; pos_y=4.97; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=17.20; pos_y=5.99; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 12:
			with (anim_components[? "arm_right"]) {pos_x=20.73; pos_y=4.36; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.08; pos_y=-0.16; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.10; pos_y=4.93; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.12; pos_y=5.95; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 13:
			with (anim_components[? "arm_right"]) {pos_x=21.09; pos_y=4.27; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=13.23; pos_y=0.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.58; pos_y=4.85; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.60; pos_y=5.87; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 14:
			with (anim_components[? "arm_right"]) {pos_x=21.45; pos_y=4.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=12.39; pos_y=0.97; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.05; pos_y=4.76; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.08; pos_y=5.78; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 15:
			with (anim_components[? "arm_right"]) {pos_x=21.80; pos_y=4.09; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.54; pos_y=1.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.53; pos_y=4.68; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.56; pos_y=5.70; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 16:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.01; pos_y=4.59; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=5.61; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 17:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.01; pos_y=4.59; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=5.61; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 18:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.01; pos_y=4.59; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=5.61; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 19:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.01; pos_y=4.34; pos_rot=0; sprite=spr_lupara_barrel; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=5.36; pos_rot=0; sprite=spr_lupara_stock; index=1; is_visible=true; } break
		case 20:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.01; pos_y=4.34; pos_rot=0; sprite=spr_lupara_barrel; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=5.36; pos_rot=0; sprite=spr_lupara_stock; index=1; is_visible=true; } break
		case 21:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=3.97; pos_rot=0; sprite=spr_lupara_barrel; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=5.07; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 22:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=3.97; pos_rot=0; sprite=spr_lupara_barrel; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=5.07; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 23:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=4.01; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=4.95; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 24:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=4.01; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=4.95; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 25:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=4.01; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=4.95; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 26:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=4.01; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=4.95; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 27:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=4.01; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=4.95; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 28:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=4.01; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=4.95; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 29:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=4.01; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=4.95; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 30:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=4.01; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=4.95; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 31:
			with (anim_components[? "arm_right"]) {pos_x=22.16; pos_y=4.00; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.03; pos_y=4.01; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.04; pos_y=4.95; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 32:
			with (anim_components[? "arm_right"]) {pos_x=22.29; pos_y=3.87; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.15; pos_y=3.64; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.16; pos_y=4.70; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 33:
			with (anim_components[? "arm_right"]) {pos_x=22.29; pos_y=3.50; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.15; pos_y=3.27; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.16; pos_y=4.34; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 34:
			with (anim_components[? "arm_right"]) {pos_x=22.29; pos_y=3.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.15; pos_y=3.03; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.16; pos_y=4.09; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 35:
			with (anim_components[? "arm_right"]) {pos_x=22.29; pos_y=3.13; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.15; pos_y=2.91; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.16; pos_y=3.97; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 36:
			with (anim_components[? "arm_right"]) {pos_x=22.17; pos_y=2.89; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.15; pos_y=2.66; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.16; pos_y=3.73; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 37:
			with (anim_components[? "arm_right"]) {pos_x=22.17; pos_y=2.52; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.15; pos_y=2.30; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.16; pos_y=3.36; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 38:
			with (anim_components[? "arm_right"]) {pos_x=22.17; pos_y=2.04; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.01; pos_y=1.60; pos_rot=1.10; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.16; pos_y=3.00; pos_rot=3.31; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 39:
			with (anim_components[? "arm_right"]) {pos_x=22.03; pos_y=1.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.87; pos_y=0.91; pos_rot=2.67; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.03; pos_y=2.58; pos_rot=4.24; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 40:
			with (anim_components[? "arm_right"]) {pos_x=21.98; pos_y=1.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.83; pos_y=0.64; pos_rot=3.86; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.03; pos_y=2.45; pos_rot=5.02; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 41:
			with (anim_components[? "arm_right"]) {pos_x=21.94; pos_y=1.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.79; pos_y=0.37; pos_rot=5.05; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.03; pos_y=2.31; pos_rot=5.79; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 42:
			with (anim_components[? "arm_right"]) {pos_x=21.89; pos_y=1.03; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.74; pos_y=0.10; pos_rot=6.25; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.03; pos_y=2.18; pos_rot=6.56; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 43:
			with (anim_components[? "arm_right"]) {pos_x=21.78; pos_y=0.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.62; pos_y=-0.13; pos_rot=6.25; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.91; pos_y=1.82; pos_rot=6.56; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 44:
			with (anim_components[? "arm_right"]) {pos_x=21.74; pos_y=0.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.53; pos_y=-0.44; pos_rot=7.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.87; pos_y=1.69; pos_rot=7.83; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 45:
			with (anim_components[? "arm_right"]) {pos_x=21.70; pos_y=0.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.44; pos_y=-0.74; pos_rot=8.98; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.83; pos_y=1.56; pos_rot=9.09; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 46:
			with (anim_components[? "arm_right"]) {pos_x=21.66; pos_y=0.16; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.35; pos_y=-1.05; pos_rot=10.34; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.79; pos_y=1.42; pos_rot=10.35; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 47:
			with (anim_components[? "arm_right"]) {pos_x=21.62; pos_y=-0.01; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.25; pos_y=-1.35; pos_rot=11.71; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.75; pos_y=1.29; pos_rot=11.61; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 48:
			with (anim_components[? "arm_right"]) {pos_x=21.58; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.16; pos_y=-1.65; pos_rot=13.08; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.71; pos_y=1.16; pos_rot=12.87; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 49:
			with (anim_components[? "arm_right"]) {pos_x=21.54; pos_y=-0.35; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.07; pos_y=-1.96; pos_rot=14.44; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.67; pos_y=1.03; pos_rot=14.13; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 50:
			with (anim_components[? "arm_right"]) {pos_x=21.50; pos_y=-0.53; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.98; pos_y=-2.26; pos_rot=15.81; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.63; pos_y=0.89; pos_rot=15.39; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 51:
			with (anim_components[? "arm_right"]) {pos_x=21.46; pos_y=-0.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.88; pos_y=-2.57; pos_rot=17.17; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.59; pos_y=0.76; pos_rot=16.66; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 52:
			with (anim_components[? "arm_right"]) {pos_x=21.46; pos_y=-0.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.88; pos_y=-2.57; pos_rot=17.17; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.59; pos_y=0.76; pos_rot=16.66; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 53:
			with (anim_components[? "arm_right"]) {pos_x=21.46; pos_y=-0.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.88; pos_y=-2.57; pos_rot=17.17; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.59; pos_y=0.76; pos_rot=16.66; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 54:
			with (anim_components[? "arm_right"]) {pos_x=21.46; pos_y=-0.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.88; pos_y=-2.57; pos_rot=17.17; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.59; pos_y=0.76; pos_rot=16.66; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 55:
			with (anim_components[? "arm_right"]) {pos_x=21.46; pos_y=-0.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.88; pos_y=-2.57; pos_rot=17.17; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.59; pos_y=0.76; pos_rot=16.66; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 56:
			with (anim_components[? "arm_right"]) {pos_x=21.46; pos_y=-0.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.88; pos_y=-2.57; pos_rot=17.17; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.59; pos_y=0.76; pos_rot=16.66; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 57:
			with (anim_components[? "arm_right"]) {pos_x=21.42; pos_y=-0.87; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.79; pos_y=-2.87; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.55; pos_y=0.63; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 58:
			with (anim_components[? "arm_right"]) {pos_x=21.33; pos_y=-0.99; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.69; pos_y=-3.02; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.45; pos_y=0.48; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 59:
			with (anim_components[? "arm_right"]) {pos_x=21.23; pos_y=-1.10; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.58; pos_y=-3.16; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.34; pos_y=0.34; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 60:
			with (anim_components[? "arm_right"]) {pos_x=21.14; pos_y=-1.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.48; pos_y=-3.31; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.24; pos_y=0.19; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 61:
			with (anim_components[? "arm_right"]) {pos_x=21.05; pos_y=-1.34; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.37; pos_y=-3.45; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.13; pos_y=0.05; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 62:
			with (anim_components[? "arm_right"]) {pos_x=20.96; pos_y=-1.45; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.27; pos_y=-3.60; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.03; pos_y=-0.10; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 63:
			with (anim_components[? "arm_right"]) {pos_x=20.87; pos_y=-1.57; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.17; pos_y=-3.75; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.92; pos_y=-0.25; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 64:
			with (anim_components[? "arm_right"]) {pos_x=20.78; pos_y=-1.69; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.06; pos_y=-3.89; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.82; pos_y=-0.39; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 65:
			with (anim_components[? "arm_right"]) {pos_x=20.68; pos_y=-1.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.96; pos_y=-4.04; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.72; pos_y=-0.54; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 66:
			with (anim_components[? "arm_right"]) {pos_x=20.68; pos_y=-1.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.96; pos_y=-4.04; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.72; pos_y=-0.54; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 67:
			with (anim_components[? "arm_right"]) {pos_x=20.68; pos_y=-1.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.96; pos_y=-4.04; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.72; pos_y=-0.54; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 68:
			with (anim_components[? "arm_right"]) {pos_x=20.68; pos_y=-1.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.96; pos_y=-4.04; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.72; pos_y=-0.54; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 69:
			with (anim_components[? "arm_right"]) {pos_x=20.68; pos_y=-1.80; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.96; pos_y=-4.04; pos_rot=18.54; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.72; pos_y=-0.54; pos_rot=17.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 70:
			with (anim_components[? "arm_right"]) {pos_x=21.46; pos_y=-0.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.88; pos_y=-2.57; pos_rot=17.17; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.59; pos_y=0.76; pos_rot=16.66; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 71:
			with (anim_components[? "arm_right"]) {pos_x=21.74; pos_y=0.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.53; pos_y=-0.44; pos_rot=7.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.87; pos_y=1.69; pos_rot=7.83; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 72:
			with (anim_components[? "arm_right"]) {pos_x=22.17; pos_y=2.89; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.15; pos_y=2.66; pos_rot=0; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.16; pos_y=3.73; pos_rot=0; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 73:
			with (anim_components[? "arm_right"]) {pos_x=21.80; pos_y=4.64; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.41; pos_y=4.78; pos_rot=-9.20; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=20.16; pos_y=5.48; pos_rot=-1.34; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 74:
			with (anim_components[? "arm_right"]) {pos_x=21.32; pos_y=6.19; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=28.41; pos_y=7.16; pos_rot=-33.13; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=19.57; pos_y=6.91; pos_rot=-6.89; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 75:
			with (anim_components[? "arm_right"]) {pos_x=20.73; pos_y=7.50; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.81; pos_y=9.19; pos_rot=-47.75; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.74; pos_y=7.98; pos_rot=-12.11; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 76:
			with (anim_components[? "arm_right"]) {pos_x=20.49; pos_y=7.97; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.69; pos_y=10.27; pos_rot=-61.16; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.62; pos_y=8.33; pos_rot=-15.00; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 77:
			with (anim_components[? "arm_right"]) {pos_x=20.37; pos_y=8.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.81; pos_y=11.57; pos_rot=-81.56; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.62; pos_y=8.69; pos_rot=-17.21; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 78:
			with (anim_components[? "arm_right"]) {pos_x=20.37; pos_y=8.81; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.98; pos_y=13.59; pos_rot=-129.06; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.38; pos_y=8.93; pos_rot=-19.55; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 79:
			with (anim_components[? "arm_right"]) {pos_x=20.25; pos_y=8.93; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.69; pos_y=2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.27; pos_y=14.31; pos_rot=-154.70; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.14; pos_y=9.17; pos_rot=-19.55; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 80:
			with (anim_components[? "arm_right"]) {pos_x=20.49; pos_y=8.21; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.34; pos_y=13.12; pos_rot=-139.17; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.62; pos_y=8.57; pos_rot=-16.59; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 81:
			with (anim_components[? "arm_right"]) {pos_x=20.49; pos_y=7.74; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.69; pos_y=11.45; pos_rot=-107.31; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.50; pos_y=8.22; pos_rot=-12.81; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 82:
			with (anim_components[? "arm_right"]) {pos_x=20.37; pos_y=7.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.81; pos_y=9.66; pos_rot=-71.91; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.38; pos_y=7.86; pos_rot=-10.77; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 83:
			with (anim_components[? "arm_right"]) {pos_x=20.37; pos_y=7.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.69; pos_y=9.31; pos_rot=-64.30; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.38; pos_y=7.86; pos_rot=-10.77; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 84:
			with (anim_components[? "arm_right"]) {pos_x=20.37; pos_y=7.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.69; pos_y=9.31; pos_rot=-59.20; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.38; pos_y=7.86; pos_rot=-10.77; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 85:
			with (anim_components[? "arm_right"]) {pos_x=20.37; pos_y=7.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.46; pos_y=9.07; pos_rot=-53.86; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.38; pos_y=7.86; pos_rot=-10.77; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 86:
			with (anim_components[? "arm_right"]) {pos_x=20.37; pos_y=7.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.34; pos_y=8.81; pos_rot=-49.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.38; pos_y=7.86; pos_rot=-10.77; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 87:
			with (anim_components[? "arm_right"]) {pos_x=20.39; pos_y=7.06; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.43; pos_y=8.55; pos_rot=-48.77; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.40; pos_y=7.64; pos_rot=-10.07; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 88:
			with (anim_components[? "arm_right"]) {pos_x=20.40; pos_y=6.85; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.52; pos_y=8.25; pos_rot=-49.01; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.41; pos_y=7.42; pos_rot=-9.38; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 89:
			with (anim_components[? "arm_right"]) {pos_x=20.42; pos_y=6.65; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.61; pos_y=7.95; pos_rot=-49.98; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.43; pos_y=7.20; pos_rot=-8.68; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 90:
			with (anim_components[? "arm_right"]) {pos_x=20.44; pos_y=6.44; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.59; pos_y=7.65; pos_rot=-50.46; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.45; pos_y=6.97; pos_rot=-7.99; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 91:
			with (anim_components[? "arm_right"]) {pos_x=20.45; pos_y=6.24; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.68; pos_y=7.24; pos_rot=-51.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.46; pos_y=6.75; pos_rot=-7.29; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 92:
			with (anim_components[? "arm_right"]) {pos_x=20.47; pos_y=6.04; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.77; pos_y=7.02; pos_rot=-51.93; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.48; pos_y=6.53; pos_rot=-6.59; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 93:
			with (anim_components[? "arm_right"]) {pos_x=20.49; pos_y=5.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.75; pos_y=6.85; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.50; pos_y=6.31; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 94:
			with (anim_components[? "arm_right"]) {pos_x=20.49; pos_y=5.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.75; pos_y=6.85; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.50; pos_y=6.31; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 95:
			with (anim_components[? "arm_right"]) {pos_x=20.49; pos_y=5.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.81; pos_y=1.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.75; pos_y=6.85; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.50; pos_y=6.31; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 96:
			with (anim_components[? "arm_right"]) {pos_x=20.09; pos_y=5.78; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.26; pos_y=1.25; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=27.36; pos_y=6.81; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.10; pos_y=6.28; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 97:
			with (anim_components[? "arm_right"]) {pos_x=19.68; pos_y=5.74; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.71; pos_y=0.99; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.97; pos_y=6.78; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=17.69; pos_y=6.24; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 98:
			with (anim_components[? "arm_right"]) {pos_x=19.28; pos_y=5.69; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=12.16; pos_y=0.73; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.58; pos_y=6.74; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=17.29; pos_y=6.20; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 99:
			with (anim_components[? "arm_right"]) {pos_x=18.88; pos_y=5.64; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=12.61; pos_y=0.47; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.19; pos_y=6.71; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.89; pos_y=6.17; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 100:
			with (anim_components[? "arm_right"]) {pos_x=18.48; pos_y=5.59; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=13.06; pos_y=0.21; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.80; pos_y=6.67; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.49; pos_y=6.13; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 101:
			with (anim_components[? "arm_right"]) {pos_x=18.08; pos_y=5.55; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=13.51; pos_y=-0.05; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.41; pos_y=6.64; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.09; pos_y=6.10; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 102:
			with (anim_components[? "arm_right"]) {pos_x=17.67; pos_y=5.50; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=13.96; pos_y=-0.31; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.02; pos_y=6.60; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.68; pos_y=6.06; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 103:
			with (anim_components[? "arm_right"]) {pos_x=17.27; pos_y=5.45; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.41; pos_y=-0.57; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.63; pos_y=6.57; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.28; pos_y=6.03; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 104:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.24; pos_y=6.53; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
	}

}
