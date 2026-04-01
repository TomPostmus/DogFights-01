// Generated animation script
// To be called by an obj_weapon
function anim_striker_reload_start() {

	// Animation end
	anim_end = anim_frame >= 64

	// Draw order changes
	if (anim_frame >= 0 && anim_frame < 45 &&
		(anim_frame_prev < 0 || anim_frame_prev >= 45)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon")
	} else 	if (anim_frame >= 45 && anim_frame < 64 &&
		(anim_frame_prev < 45 || anim_frame_prev >= 64)) {
		new_anim_draw_order("arm_right", "arm_left", "shell", "weapon")
	} else 	if (anim_frame >= 64 && anim_frame < 65 &&
		(anim_frame_prev < 64 || anim_frame_prev >= 65)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon")
	}

	switch (anim_frame) {
		case 0:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=25.20; pos_y=5.40; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 1:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=24.60; pos_y=5.40; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 2:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=24.60; pos_y=5.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 3:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.80; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 4:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.40; pos_y=4; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 5:
			with (anim_components[? "arm_right"]) {pos_x=16.60; pos_y=4.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.40; pos_y=3.60; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.40; pos_y=4.80; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 6:
			with (anim_components[? "arm_right"]) {pos_x=18.92; pos_y=4.96; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.88; pos_y=3.26; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.58; pos_y=5.34; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 7:
			with (anim_components[? "arm_right"]) {pos_x=18.92; pos_y=4.96; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.08; pos_y=2.46; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.58; pos_y=5.34; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 8:
			with (anim_components[? "arm_right"]) {pos_x=18.92; pos_y=4.96; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.28; pos_y=2.06; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.58; pos_y=5.34; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 9:
			with (anim_components[? "arm_right"]) {pos_x=18.92; pos_y=4.96; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.09; pos_y=1.47; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.58; pos_y=5.34; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 10:
			with (anim_components[? "arm_right"]) {pos_x=18.92; pos_y=4.96; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.09; pos_y=0.67; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=18.58; pos_y=5.34; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 11:
			with (anim_components[? "arm_right"]) {pos_x=18.55; pos_y=4.54; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.05; pos_y=5.63; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 12:
			with (anim_components[? "arm_right"]) {pos_x=20.35; pos_y=5.14; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.65; pos_y=6.23; pos_rot=0; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 13:
			with (anim_components[? "arm_right"]) {pos_x=20.42; pos_y=5.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.80; pos_y=6.31; pos_rot=-0.35; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 14:
			with (anim_components[? "arm_right"]) {pos_x=20.49; pos_y=5.23; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=19.96; pos_y=6.39; pos_rot=-0.71; sprite=spr_striker; index=0; is_visible=true; update_wcomponents()} break
		case 15:
			with (anim_components[? "arm_right"]) {pos_x=20.56; pos_y=5.28; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.11; pos_y=6.48; pos_rot=-1.06; sprite=spr_striker; index=1; is_visible=true; update_wcomponents()} break
		case 16:
			with (anim_components[? "arm_right"]) {pos_x=20.63; pos_y=5.32; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.26; pos_y=6.56; pos_rot=-1.41; sprite=spr_striker; index=1; is_visible=true; update_wcomponents()} break
		case 17:
			with (anim_components[? "arm_right"]) {pos_x=20.70; pos_y=5.37; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.41; pos_y=6.64; pos_rot=-1.77; sprite=spr_striker; index=1; is_visible=true; update_wcomponents()} break
		case 18:
			with (anim_components[? "arm_right"]) {pos_x=20.77; pos_y=5.42; pos_rot=0; sprite=spr_pip_hand; index=1; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.57; pos_y=6.72; pos_rot=-2.12; sprite=spr_striker; index=1; is_visible=true; update_wcomponents()} break
		case 19:
			with (anim_components[? "arm_right"]) {pos_x=20.84; pos_y=5.47; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.72; pos_y=6.81; pos_rot=-2.48; sprite=spr_striker; index=1; is_visible=true; update_wcomponents()} break
		case 20:
			with (anim_components[? "arm_right"]) {pos_x=20.91; pos_y=5.51; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=20.87; pos_y=6.89; pos_rot=-2.83; sprite=spr_striker; index=1; is_visible=true; update_wcomponents()} break
		case 21:
			with (anim_components[? "arm_right"]) {pos_x=20.99; pos_y=5.56; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.03; pos_y=6.97; pos_rot=-3.18; sprite=spr_striker; index=2; is_visible=true; update_wcomponents()} break
		case 22:
			with (anim_components[? "arm_right"]) {pos_x=21.06; pos_y=5.61; pos_rot=0; sprite=spr_pip_hand; index=2; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.18; pos_y=7.05; pos_rot=-3.54; sprite=spr_striker; index=2; is_visible=true; update_wcomponents()} break
		case 23:
			with (anim_components[? "arm_right"]) {pos_x=21.13; pos_y=5.65; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.33; pos_y=7.13; pos_rot=-3.89; sprite=spr_striker; index=2; is_visible=true; update_wcomponents()} break
		case 24:
			with (anim_components[? "arm_right"]) {pos_x=21.20; pos_y=5.70; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.49; pos_y=7.22; pos_rot=-4.24; sprite=spr_striker; index=2; is_visible=true; update_wcomponents()} break
		case 25:
			with (anim_components[? "arm_right"]) {pos_x=21.27; pos_y=5.75; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.64; pos_y=7.30; pos_rot=-4.60; sprite=spr_striker; index=2; is_visible=true; update_wcomponents()} break
		case 26:
			with (anim_components[? "arm_right"]) {pos_x=21.34; pos_y=5.79; pos_rot=0; sprite=spr_pip_hand; index=3; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.79; pos_y=7.38; pos_rot=-4.95; sprite=spr_striker; index=2; is_visible=true; update_wcomponents()} break
		case 27:
			with (anim_components[? "arm_right"]) {pos_x=21.41; pos_y=5.84; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=21.94; pos_y=7.46; pos_rot=-5.31; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 28:
			with (anim_components[? "arm_right"]) {pos_x=21.48; pos_y=5.89; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.10; pos_y=7.55; pos_rot=-5.66; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 29:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 30:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 31:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 32:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 33:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 34:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 35:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 36:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 37:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 38:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 39:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 40:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 41:
			with (anim_components[? "arm_right"]) {pos_x=21.55; pos_y=5.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=22.25; pos_y=7.63; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 42:
			with (anim_components[? "arm_right"]) {pos_x=21.95; pos_y=5.34; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.05; pos_y=7.03; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 43:
			with (anim_components[? "arm_right"]) {pos_x=21.95; pos_y=4.34; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.45; pos_y=6.43; pos_rot=-6.01; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 44:
			with (anim_components[? "arm_right"]) {pos_x=21.95; pos_y=4.34; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=13.68; pos_y=-1.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=23.85; pos_y=5.83; pos_rot=-1.27; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 45:
			with (anim_components[? "arm_right"]) {pos_x=21.95; pos_y=3.34; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=15.68; pos_y=-1.78; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=17.20; pos_y=-4.60; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.25; pos_y=5.03; pos_rot=-1.27; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 46:
			with (anim_components[? "arm_right"]) {pos_x=22.75; pos_y=2.74; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.68; pos_y=-1.98; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=18.40; pos_y=-3.80; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=24.85; pos_y=4.63; pos_rot=-1.27; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 47:
			with (anim_components[? "arm_right"]) {pos_x=23.35; pos_y=2.54; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.68; pos_y=-1.58; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=19.80; pos_y=-2.80; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=3.63; pos_rot=-1.27; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 48:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.08; pos_y=-1.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=21.40; pos_y=-2.20; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 49:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.28; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.40; pos_y=-1.20; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 50:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.28; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.40; pos_y=-1.20; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 51:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.68; pos_y=0.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.40; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 52:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.88; pos_y=0.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=24.20; pos_y=-0.40; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 53:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.68; pos_y=0.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=25; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 54:
			with (anim_components[? "arm_right"]) {pos_x=24.35; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=26; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.85; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 55:
			with (anim_components[? "arm_right"]) {pos_x=24.75; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.25; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 56:
			with (anim_components[? "arm_right"]) {pos_x=24.75; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.25; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 57:
			with (anim_components[? "arm_right"]) {pos_x=24.75; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.25; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 58:
			with (anim_components[? "arm_right"]) {pos_x=24.75; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.25; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 59:
			with (anim_components[? "arm_right"]) {pos_x=24.75; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.25; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 60:
			with (anim_components[? "arm_right"]) {pos_x=24.75; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.25; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 61:
			with (anim_components[? "arm_right"]) {pos_x=24.75; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.25; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 62:
			with (anim_components[? "arm_right"]) {pos_x=24.75; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.25; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 63:
			with (anim_components[? "arm_right"]) {pos_x=24.75; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.25; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 64:
			with (anim_components[? "arm_right"]) {pos_x=24.35; pos_y=1.94; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.85; pos_y=2.23; pos_rot=2.00; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
	}

}
