event_inherited()

//Get device
if (gamepad_get_device_count() > 0) {
	device = 0
}

if (device != undefined) {
	
	//Movement input
	input_forward = -gamepad_axis_value(device, gp_axislv)
	input_right = gamepad_axis_value(device, gp_axisrh)
	input_backward = 0
	input_left = 0
	
	//input_forward = gamepad_button_check(device, gp_padu)
	//input_right = gamepad_button_check(device, gp_padr)
	//input_backward = gamepad_button_check(device, gp_padd)
	//input_left = gamepad_button_check(device, gp_padl)
	
	//Weapon input
	if (instance_exists(input_weapon)) {
		input_weapon.input_reload = gamepad_button_check_pressed(device, gp_face3)
		input_weapon.input_attack = gamepad_button_check(device, gp_shoulderrb)
		input_weapon.input_attack2 = gamepad_button_check(device, gp_shoulderlb)
	}
}