event_inherited()

//Movement
if (instance_exists(dog)) {
	dog.move_input = input_forward - input_backward
	dog.turn_input = input_left - input_right
}