// Generated animation script
// To be called by an obj_weapon
function anim_lupara_reload_insert() {

	// Animation end
	anim_end = anim_frame >= 52

	// Draw order changes
	if (anim_frame >= 0 && anim_frame < 2 &&
		(anim_frame_prev < 0 || anim_frame_prev >= 2)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon", "stock")
	} else 	if (anim_frame >= 2 && anim_frame < 18 &&
		(anim_frame_prev < 2 || anim_frame_prev >= 18)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon", "stock", "shell")
	} else 	if (anim_frame >= 18 && anim_frame < 53 &&
		(anim_frame_prev < 18 || anim_frame_prev >= 53)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon", "stock")
	}

	switch (anim_frame) {
		case 0:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.24; pos_y=6.53; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 1:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.06; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=15.97; pos_y=-0.30; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.34; pos_y=6.14; pos_rot=-53.05; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.93; pos_y=5.73; pos_rot=-4.79; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 2:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.71; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.09; pos_y=0.24; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.45; pos_y=5.76; pos_rot=-52.50; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.99; pos_y=5.46; pos_rot=-3.69; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=20.08; pos_y=-0.58; pos_rot=-33.82; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 3:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.37; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.21; pos_y=0.77; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.55; pos_y=5.37; pos_rot=-51.94; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.04; pos_y=5.19; pos_rot=-2.59; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=21.18; pos_y=-0.27; pos_rot=-33.82; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 4:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.32; pos_y=1.30; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.66; pos_y=4.98; pos_rot=-51.39; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=21.18; pos_y=-0.27; pos_rot=-33.82; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 5:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.40; pos_y=1.86; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.58; pos_y=4.95; pos_rot=-50.01; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=21.57; pos_y=0.34; pos_rot=-35.30; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 6:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.48; pos_y=2.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.50; pos_y=4.91; pos_rot=-48.64; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=21.97; pos_y=0.95; pos_rot=-36.79; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 7:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.56; pos_y=2.98; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.42; pos_y=4.87; pos_rot=-47.27; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.37; pos_y=1.56; pos_rot=-38.27; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 8:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.64; pos_y=3.53; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.77; pos_y=2.17; pos_rot=-39.75; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 9:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.07; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.77; pos_y=2.17; pos_rot=-39.75; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 10:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.07; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.77; pos_y=2.17; pos_rot=-39.75; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 11:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.07; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.77; pos_y=2.17; pos_rot=-39.75; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 12:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.07; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.77; pos_y=2.17; pos_rot=-39.75; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 13:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.07; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.77; pos_y=2.17; pos_rot=-39.75; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 14:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.07; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.77; pos_y=2.17; pos_rot=-39.75; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 15:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.07; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.77; pos_y=2.17; pos_rot=-39.75; sprite=spr_striker_shell; index=0; is_visible=true; } break
		case 16:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.45; pos_y=3.88; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=23.54; pos_y=2.82; pos_rot=-39.75; sprite=spr_striker_shell; index=1; is_visible=true; } break
		case 17:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.09; pos_y=4.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=24.31; pos_y=3.46; pos_rot=-39.75; sprite=spr_striker_shell; index=2; is_visible=true; } break
		case 18:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.48; pos_y=4.64; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 19:
			with (anim_components[? "arm_right"]) {pos_x=17.26; pos_y=4.28; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.25; pos_y=5.16; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.73; pos_y=4.70; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.48; pos_y=5.06; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 20:
			with (anim_components[? "arm_right"]) {pos_x=17.64; pos_y=4.28; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.76; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.99; pos_y=4.70; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.86; pos_y=5.06; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 21:
			with (anim_components[? "arm_right"]) {pos_x=18.28; pos_y=4.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.27; pos_y=5.93; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.50; pos_y=4.96; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.38; pos_y=5.31; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 22:
			with (anim_components[? "arm_right"]) {pos_x=18.28; pos_y=4.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.27; pos_y=5.93; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.50; pos_y=4.96; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.38; pos_y=5.31; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 23:
			with (anim_components[? "arm_right"]) {pos_x=18.28; pos_y=4.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.27; pos_y=5.93; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.50; pos_y=4.96; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.38; pos_y=5.31; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 24:
			with (anim_components[? "arm_right"]) {pos_x=18.28; pos_y=4.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.27; pos_y=5.93; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.50; pos_y=4.96; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.38; pos_y=5.31; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 25:
			with (anim_components[? "arm_right"]) {pos_x=18.28; pos_y=4.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.27; pos_y=5.93; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.50; pos_y=4.96; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=16.38; pos_y=5.31; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 26:
			with (anim_components[? "arm_right"]) {pos_x=17.64; pos_y=4.28; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.76; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.99; pos_y=4.70; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.86; pos_y=5.06; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 27:
			with (anim_components[? "arm_right"]) {pos_x=17.26; pos_y=4.28; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.25; pos_y=5.16; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.73; pos_y=4.70; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.48; pos_y=5.06; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 28:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.48; pos_y=4.64; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 29:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.09; pos_y=4.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 30:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.45; pos_y=3.88; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 31:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.07; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 32:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.07; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 33:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.64; pos_y=3.53; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 34:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.64; pos_y=2.90; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 35:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.43; pos_y=2.36; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 36:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.32; pos_y=1.73; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 37:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.32; pos_y=1.30; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.35; pos_y=4.83; pos_rot=-45.89; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.09; pos_y=4.93; pos_rot=-1.48; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 38:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.25; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.58; pos_y=0.95; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.33; pos_y=5.11; pos_rot=-47.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.06; pos_y=5.11; pos_rot=-2.22; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 39:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.48; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.83; pos_y=0.59; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.31; pos_y=5.40; pos_rot=-48.47; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=15.02; pos_y=5.28; pos_rot=-2.95; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 40:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.71; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.09; pos_y=0.24; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.29; pos_y=5.68; pos_rot=-49.75; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.99; pos_y=5.46; pos_rot=-3.69; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 41:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=4.94; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.34; pos_y=-0.12; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.27; pos_y=5.96; pos_rot=-51.04; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.95; pos_y=5.64; pos_rot=-4.43; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 42:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=15.60; pos_y=-0.47; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.26; pos_y=6.25; pos_rot=-52.32; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.92; pos_y=5.81; pos_rot=-5.16; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 43:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.24; pos_y=6.53; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 44:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.28; pos_y=6.57; pos_rot=-55.04; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 45:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.32; pos_y=6.61; pos_rot=-56.47; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 46:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.36; pos_y=6.65; pos_rot=-57.90; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 47:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.40; pos_y=6.69; pos_rot=-59.33; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 48:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.36; pos_y=6.66; pos_rot=-58.18; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 49:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.33; pos_y=6.62; pos_rot=-57.04; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 50:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.30; pos_y=6.59; pos_rot=-55.90; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 51:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.27; pos_y=6.56; pos_rot=-54.75; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
		case 52:
			with (anim_components[? "arm_right"]) {pos_x=16.87; pos_y=5.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.85; pos_y=-0.83; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.24; pos_y=6.53; pos_rot=-53.61; sprite=spr_lupara_barrel; index=3; is_visible=true; update_wcomponents()}
			with (anim_components[? "stock"]) {pos_x=14.88; pos_y=5.99; pos_rot=-5.90; sprite=spr_lupara_stock; index=2; is_visible=true; } break
	}

}
