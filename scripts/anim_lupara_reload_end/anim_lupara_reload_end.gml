// Generated animation script
// To be called by an obj_weapon
function anim_lupara_reload_end() {

	// Animation end
	anim_end = anim_frame >= 44

	// Draw order changes
	if (anim_frame >= 0 && anim_frame < 45 &&
		(anim_frame_prev < 0 || anim_frame_prev >= 45)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon", "stock")
	}

	switch (anim_frame) {
		case 0:
			with (anim_components[? "arm_right"]) {pos_x=16.61; pos_y=6.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=12.31; pos_y=1.66; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.12; pos_y=7.98; pos_rot=-56.33; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=6.78; pos_rot=-10.88; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 1:
			with (anim_components[? "arm_right"]) {pos_x=16.61; pos_y=6.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.25; pos_y=-0.86; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.12; pos_y=7.98; pos_rot=-56.33; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=6.78; pos_rot=-10.88; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 2:
			with (anim_components[? "arm_right"]) {pos_x=16.61; pos_y=6.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=5.80; pos_y=-0.43; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.12; pos_y=7.98; pos_rot=-56.33; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=6.78; pos_rot=-10.88; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 3:
			with (anim_components[? "arm_right"]) {pos_x=16.61; pos_y=6.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=8.85; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.12; pos_y=7.98; pos_rot=-56.33; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=6.78; pos_rot=-10.88; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 4:
			with (anim_components[? "arm_right"]) {pos_x=16.61; pos_y=6.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.85; pos_y=1.69; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.12; pos_y=7.98; pos_rot=-56.33; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=6.78; pos_rot=-10.88; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 5:
			with (anim_components[? "arm_right"]) {pos_x=16.61; pos_y=6.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=12.68; pos_y=-0.57; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.12; pos_y=7.98; pos_rot=-56.33; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=6.78; pos_rot=-10.88; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 6:
			with (anim_components[? "arm_right"]) {pos_x=17.04; pos_y=5.34; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=3.14; pos_y=0.56; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.12; pos_y=5.84; pos_rot=-41.20; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.02; pos_y=6.07; pos_rot=-3.22; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 7:
			with (anim_components[? "arm_right"]) {pos_x=17.36; pos_y=3.49; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.15; pos_y=0.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.92; pos_y=3.22; pos_rot=-13.62; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.57; pos_y=4.44; pos_rot=1.34; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 8:
			with (anim_components[? "arm_right"]) {pos_x=17.67; pos_y=2.13; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=12.44; pos_y=0.78; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.85; pos_y=1.86; pos_rot=2.56; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.93; pos_y=3.07; pos_rot=1.34; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 9:
			with (anim_components[? "arm_right"]) {pos_x=19.03; pos_y=1.37; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.44; pos_y=-1.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.14; pos_y=0.54; pos_rot=5.79; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=17.57; pos_y=2.32; pos_rot=6.36; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 10:
			with (anim_components[? "arm_right"]) {pos_x=19.72; pos_y=0.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.89; pos_y=0.01; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.83; pos_y=-1.36; pos_rot=14.76; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.43; pos_y=1.46; pos_rot=13.19; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 11:
			with (anim_components[? "arm_right"]) {pos_x=19.72; pos_y=0.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.83; pos_y=-1.36; pos_rot=14.76; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.43; pos_y=1.46; pos_rot=13.19; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 12:
			with (anim_components[? "arm_right"]) {pos_x=19.72; pos_y=0.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.83; pos_y=-1.36; pos_rot=14.76; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.43; pos_y=1.46; pos_rot=13.19; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 13:
			with (anim_components[? "arm_right"]) {pos_x=19.72; pos_y=0.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.83; pos_y=-1.36; pos_rot=14.76; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.43; pos_y=1.46; pos_rot=13.19; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 14:
			with (anim_components[? "arm_right"]) {pos_x=19.72; pos_y=0.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.83; pos_y=-1.36; pos_rot=14.76; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.43; pos_y=1.46; pos_rot=13.19; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 15:
			with (anim_components[? "arm_right"]) {pos_x=19.72; pos_y=0.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.83; pos_y=-1.36; pos_rot=14.76; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.43; pos_y=1.46; pos_rot=13.19; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 16:
			with (anim_components[? "arm_right"]) {pos_x=19.72; pos_y=0.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.83; pos_y=-1.36; pos_rot=14.76; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.43; pos_y=1.46; pos_rot=13.19; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 17:
			with (anim_components[? "arm_right"]) {pos_x=19.57; pos_y=0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.65; pos_y=-0.63; pos_rot=12.94; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=18.18; pos_y=1.93; pos_rot=11.43; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 18:
			with (anim_components[? "arm_right"]) {pos_x=19.42; pos_y=1.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.48; pos_y=0.09; pos_rot=11.12; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=17.93; pos_y=2.41; pos_rot=9.67; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 19:
			with (anim_components[? "arm_right"]) {pos_x=19.27; pos_y=1.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.30; pos_y=0.82; pos_rot=9.29; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=17.68; pos_y=2.88; pos_rot=7.92; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 20:
			with (anim_components[? "arm_right"]) {pos_x=19.12; pos_y=2.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.13; pos_y=1.54; pos_rot=7.47; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=17.43; pos_y=3.36; pos_rot=6.16; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 21:
			with (anim_components[? "arm_right"]) {pos_x=18.97; pos_y=2.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.95; pos_y=2.27; pos_rot=5.65; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=17.18; pos_y=3.83; pos_rot=4.41; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 22:
			with (anim_components[? "arm_right"]) {pos_x=18.82; pos_y=3.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.78; pos_y=2.99; pos_rot=3.82; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.93; pos_y=4.31; pos_rot=2.65; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 23:
			with (anim_components[? "arm_right"]) {pos_x=18.67; pos_y=3.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.60; pos_y=3.72; pos_rot=2.00; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.68; pos_y=4.78; pos_rot=0.89; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 24:
			with (anim_components[? "arm_right"]) {pos_x=18.52; pos_y=4.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.79; pos_y=3.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.43; pos_y=4.44; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.43; pos_y=5.26; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 25:
			with (anim_components[? "arm_right"]) {pos_x=18.04; pos_y=4.36; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.56; pos_y=3.16; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.66; pos_y=4.42; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.65; pos_y=5.26; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 26:
			with (anim_components[? "arm_right"]) {pos_x=17.57; pos_y=4.38; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.33; pos_y=3.21; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.88; pos_y=4.39; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.87; pos_y=5.25; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 27:
			with (anim_components[? "arm_right"]) {pos_x=17.09; pos_y=4.40; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=7.11; pos_y=3.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.11; pos_y=4.37; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.10; pos_y=5.25; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 28:
			with (anim_components[? "arm_right"]) {pos_x=16.61; pos_y=4.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=6.88; pos_y=3.30; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.34; pos_y=4.35; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=13.32; pos_y=5.25; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 29:
			with (anim_components[? "arm_right"]) {pos_x=16.14; pos_y=4.45; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=6.65; pos_y=3.35; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.57; pos_y=4.32; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=12.54; pos_y=5.24; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 30:
			with (anim_components[? "arm_right"]) {pos_x=15.66; pos_y=4.47; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=6.43; pos_y=3.40; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.79; pos_y=4.30; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=11.76; pos_y=5.24; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 31:
			with (anim_components[? "arm_right"]) {pos_x=15.18; pos_y=4.49; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=6.20; pos_y=3.44; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.02; pos_y=4.27; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.99; pos_y=5.24; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 32:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=5.97; pos_y=3.49; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.25; pos_y=4.25; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.21; pos_y=5.24; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 33:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=12.97; pos_y=-2.11; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.25; pos_y=4.25; pos_rot=0.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.21; pos_y=5.24; pos_rot=-0.86; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 34:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.53; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=13.71; pos_y=-1.43; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.15; pos_y=4.33; pos_rot=0.16; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.12; pos_y=5.32; pos_rot=-0.78; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 35:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.55; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.46; pos_y=-0.74; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.06; pos_y=4.42; pos_rot=0.15; sprite=spr_lupara_barrel; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=10.03; pos_y=5.40; pos_rot=-0.71; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 36:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.56; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=15.20; pos_y=-0.06; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.97; pos_y=4.50; pos_rot=0.13; sprite=spr_lupara_barrel; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.94; pos_y=5.49; pos_rot=-0.63; sprite=spr_lupara_stock; index=1; is_visible=true; } break
		case 37:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.58; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=15.94; pos_y=0.62; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.87; pos_y=4.58; pos_rot=0.11; sprite=spr_lupara_barrel; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.85; pos_y=5.57; pos_rot=-0.55; sprite=spr_lupara_stock; index=1; is_visible=true; } break
		case 38:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.68; pos_y=1.30; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.78; pos_y=4.67; pos_rot=0.10; sprite=spr_lupara_barrel; index=2; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.76; pos_y=5.65; pos_rot=-0.47; sprite=spr_lupara_stock; index=1; is_visible=true; } break
		case 39:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.61; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.43; pos_y=1.98; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.68; pos_y=4.75; pos_rot=0.08; sprite=spr_lupara_barrel; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.68; pos_y=5.74; pos_rot=-0.39; sprite=spr_lupara_stock; index=1; is_visible=true; } break
		case 40:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.63; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.17; pos_y=2.66; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.59; pos_y=4.83; pos_rot=0.06; sprite=spr_lupara_barrel; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.59; pos_y=5.82; pos_rot=-0.31; sprite=spr_lupara_stock; index=1; is_visible=true; } break
		case 41:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.65; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.91; pos_y=3.35; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.49; pos_y=4.92; pos_rot=0.05; sprite=spr_lupara_barrel; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.50; pos_y=5.90; pos_rot=-0.24; sprite=spr_lupara_stock; index=1; is_visible=true; } break
		case 42:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.67; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.65; pos_y=4.03; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.40; pos_y=5.00; pos_rot=0.03; sprite=spr_lupara_barrel; index=1; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.41; pos_y=5.99; pos_rot=-0.16; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 43:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.68; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.39; pos_y=4.71; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.31; pos_y=5.08; pos_rot=0.02; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.32; pos_y=6.07; pos_rot=-0.08; sprite=spr_lupara_stock; index=0; is_visible=true; } break
		case 44:
			with (anim_components[? "arm_right"]) {pos_x=14.70; pos_y=4.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.14; pos_y=5.39; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=17.21; pos_y=5.16; pos_rot=0; sprite=spr_lupara_barrel; index=0; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=9.23; pos_y=6.15; pos_rot=0; sprite=spr_lupara_stock; index=0; is_visible=true; } break
	}

}
