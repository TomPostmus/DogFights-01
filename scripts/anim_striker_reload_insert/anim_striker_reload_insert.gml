// Generated animation script
// To be called by an obj_weapon
function anim_striker_reload_insert() {

	// Animation end
	anim_end = anim_frame >= 34

	// Draw order changes
	if (anim_frame >= 0 && anim_frame < 11 &&
		(anim_frame_prev < 0 || anim_frame_prev >= 11)) {
		new_anim_draw_order("arm_right", "arm_left", "weapon")
	} else 	if (anim_frame >= 11 && anim_frame < 32 &&
		(anim_frame_prev < 11 || anim_frame_prev >= 32)) {
		new_anim_draw_order("arm_right", "arm_left", "shell", "weapon")
	} else 	if (anim_frame >= 32 && anim_frame < 35 &&
		(anim_frame_prev < 32 || anim_frame_prev >= 35)) {
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
			with (anim_components[? "arm_left"]) {pos_x=20.43; pos_y=0.35; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 2:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.18; pos_y=0.27; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 3:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.93; pos_y=0.20; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 4:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.68; pos_y=0.12; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 5:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=15.43; pos_y=0.05; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 6:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=14.18; pos_y=-0.03; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 7:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=12.93; pos_y=-0.10; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 8:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 9:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=11.68; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 10:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=13.68; pos_y=-1.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 11:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=15.68; pos_y=-1.78; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=17.20; pos_y=-4.60; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 12:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=16.68; pos_y=-1.98; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=18.40; pos_y=-3.80; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 13:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=17.68; pos_y=-1.58; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=19.80; pos_y=-2.80; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 14:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.08; pos_y=-1.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=21.40; pos_y=-2.20; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 15:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.28; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.40; pos_y=-1.20; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 16:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.28; pos_y=-0.18; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.40; pos_y=-1.20; pos_rot=-3.98; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 17:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=19.68; pos_y=0.02; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=22.40; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 18:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=20.88; pos_y=0.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=24.20; pos_y=-0.40; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 19:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.68; pos_y=0.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=25; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 20:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=26; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 21:
			with (anim_components[? "arm_right"]) {pos_x=24.15; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.38; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=26.60; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.65; pos_y=2.83; pos_rot=1.98; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 22:
			with (anim_components[? "arm_right"]) {pos_x=24.55; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.05; pos_y=2.83; pos_rot=1.35; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 23:
			with (anim_components[? "arm_right"]) {pos_x=24.55; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.05; pos_y=2.83; pos_rot=1.35; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 24:
			with (anim_components[? "arm_right"]) {pos_x=24.55; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.05; pos_y=2.83; pos_rot=1.35; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 25:
			with (anim_components[? "arm_right"]) {pos_x=24.55; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.05; pos_y=2.83; pos_rot=1.35; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 26:
			with (anim_components[? "arm_right"]) {pos_x=24.55; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.05; pos_y=2.83; pos_rot=1.35; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 27:
			with (anim_components[? "arm_right"]) {pos_x=24.55; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.05; pos_y=2.83; pos_rot=1.35; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 28:
			with (anim_components[? "arm_right"]) {pos_x=24.55; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.05; pos_y=2.83; pos_rot=1.35; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 29:
			with (anim_components[? "arm_right"]) {pos_x=24.55; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.05; pos_y=2.83; pos_rot=1.35; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 30:
			with (anim_components[? "arm_right"]) {pos_x=24.55; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.88; pos_y=0.22; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=26.05; pos_y=2.83; pos_rot=1.35; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 31:
			with (anim_components[? "arm_right"]) {pos_x=24.35; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=23.33; pos_y=0.27; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "shell"]) {pos_x=27.20; pos_y=-0.60; pos_rot=-2.30; sprite=spr_striker_shell; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.85; pos_y=2.83; pos_rot=1.66; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 32:
			with (anim_components[? "arm_right"]) {pos_x=24.15; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.78; pos_y=0.32; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.65; pos_y=2.83; pos_rot=1.98; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 33:
			with (anim_components[? "arm_right"]) {pos_x=23.95; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=22.23; pos_y=0.37; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.45; pos_y=2.83; pos_rot=2.30; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
		case 34:
			with (anim_components[? "arm_right"]) {pos_x=23.75; pos_y=2.14; pos_rot=0; sprite=spr_pip_hand; index=4; is_visible=true; }
			with (anim_components[? "arm_left"]) {pos_x=21.68; pos_y=0.42; pos_rot=0; sprite=spr_pip_hand; index=0; is_visible=true; }
			with (anim_components[? "weapon"]) {pos_x=25.25; pos_y=2.83; pos_rot=2.62; sprite=spr_striker; index=3; is_visible=true; update_wcomponents()} break
	}

}
