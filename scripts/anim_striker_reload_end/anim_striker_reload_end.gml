// Generated animation script
// To be called by an obj_weapon
function anim_striker_reload_end() {

	// Animation end
	anim_end = anim_frame >= 45

	// Draw order changes
	if (anim_frame >= 0 && anim_frame < 46 &&
		(anim_frame_prev < 0 || anim_frame_prev >= 46)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon")
	}
	anim_frame_prev = anim_frame

	switch (anim_frame) {
		case 0:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.68; pos_y=0.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 1:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.68; pos_y=-0.38; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 2:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.48; pos_y=-1.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 3:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.48; pos_y=-1.78; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 4:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.54; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.68; pos_y=-1.98; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.63; pos_rot=1.89; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 5:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.08; pos_y=-2.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 6:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.56; pos_y=-2.35; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 7:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.22; pos_y=-2.52; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 8:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.18; pos_y=-2.52; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 9:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.49; pos_y=-2.52; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 10:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.80; pos_y=-2.52; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 11:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.11; pos_y=-2.52; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 12:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=15.42; pos_y=-2.52; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 13:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.04; pos_y=-2.52; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 14:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=13.35; pos_y=-2.52; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 15:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.71; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.60; pos_y=-0.63; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.97; pos_rot=-0.39; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 16:
			with (anim_components[? "arm_right"]) {pos_x=23.01; pos_y=2.80; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.52; pos_y=-0.56; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.91; pos_y=4.01; pos_rot=-0.37; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 17:
			with (anim_components[? "arm_right"]) {pos_x=22.68; pos_y=2.90; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.45; pos_y=-0.49; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.57; pos_y=4.06; pos_rot=-0.36; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 18:
			with (anim_components[? "arm_right"]) {pos_x=22.34; pos_y=2.99; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.38; pos_y=-0.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.22; pos_y=4.10; pos_rot=-0.34; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 19:
			with (anim_components[? "arm_right"]) {pos_x=22; pos_y=3.09; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.31; pos_y=-0.35; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.88; pos_y=4.14; pos_rot=-0.32; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 20:
			with (anim_components[? "arm_right"]) {pos_x=21.66; pos_y=3.18; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.24; pos_y=-0.28; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.54; pos_y=4.18; pos_rot=-0.30; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 21:
			with (anim_components[? "arm_right"]) {pos_x=21.32; pos_y=3.28; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.17; pos_y=-0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.20; pos_y=4.22; pos_rot=-0.28; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 22:
			with (anim_components[? "arm_right"]) {pos_x=20.99; pos_y=3.37; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.10; pos_y=-0.15; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.85; pos_y=4.26; pos_rot=-0.26; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 23:
			with (anim_components[? "arm_right"]) {pos_x=20.65; pos_y=3.46; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=10.02; pos_y=-0.08; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.51; pos_y=4.30; pos_rot=-0.24; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 24:
			with (anim_components[? "arm_right"]) {pos_x=20.31; pos_y=3.56; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.95; pos_y=-0.01; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.17; pos_y=4.35; pos_rot=-0.22; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 25:
			with (anim_components[? "arm_right"]) {pos_x=19.98; pos_y=3.65; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.88; pos_y=0.06; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.82; pos_y=4.39; pos_rot=-0.20; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 26:
			with (anim_components[? "arm_right"]) {pos_x=19.64; pos_y=3.75; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.81; pos_y=0.13; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.48; pos_y=4.43; pos_rot=-0.18; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 27:
			with (anim_components[? "arm_right"]) {pos_x=19.30; pos_y=3.84; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.74; pos_y=0.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.14; pos_y=4.47; pos_rot=-0.16; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 28:
			with (anim_components[? "arm_right"]) {pos_x=18.96; pos_y=3.94; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.67; pos_y=0.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.80; pos_y=4.51; pos_rot=-0.14; sprite=spr_striker; index=2; is_visible=true; update_wcomponents()} break
		case 29:
			with (anim_components[? "arm_right"]) {pos_x=18.63; pos_y=4.03; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.59; pos_y=0.33; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.45; pos_y=4.55; pos_rot=-0.12; sprite=spr_striker; index=2; is_visible=true; update_wcomponents()} break
		case 30:
			with (anim_components[? "arm_right"]) {pos_x=18.29; pos_y=4.13; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.52; pos_y=0.40; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.11; pos_y=4.59; pos_rot=-0.10; sprite=spr_striker; index=1; is_visible=true; update_wcomponents()} break
		case 31:
			with (anim_components[? "arm_right"]) {pos_x=17.95; pos_y=4.22; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.45; pos_y=0.47; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.77; pos_y=4.63; pos_rot=-0.08; sprite=spr_striker; index=1; is_visible=true; update_wcomponents()} break
		case 32:
			with (anim_components[? "arm_right"]) {pos_x=17.61; pos_y=4.32; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=9.38; pos_y=0.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.43; pos_y=4.68; pos_rot=-0.06; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 33:
			with (anim_components[? "arm_right"]) {pos_x=17.27; pos_y=4.41; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.48; pos_y=-1.12; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.09; pos_y=4.72; pos_rot=-0.04; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 34:
			with (anim_components[? "arm_right"]) {pos_x=16.94; pos_y=4.51; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.13; pos_y=-0.70; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.74; pos_y=4.76; pos_rot=-0.02; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 35:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.44; pos_y=-0.46; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 36:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.48; pos_y=-0.12; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 37:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=18.99; pos_y=0.40; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 38:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.68; pos_y=1.09; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 39:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.89; pos_y=1.78; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 40:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.27; pos_y=2.47; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 41:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.13; pos_y=3.16; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 42:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.82; pos_y=3.85; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 43:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=25.03; pos_y=4.37; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 44:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=25.03; pos_y=4.88; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 45:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=25.20; pos_y=5.40; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
	}

}
