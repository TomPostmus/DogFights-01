exit_button.secborder_hover_colour = border_hover_colour
exit_button.active = active
exit_button.subfocus = subfocus

if (exit_button.hover && !exit_button.click) {
	exit_button.border_alpha = 0
	exit_button.secborder_alpha = 1
	exit_button.alpha = 0
} else if (exit_button.click) {
	exit_button.border_alpha = 1
	exit_button.secborder_alpha = 1
	exit_button.alpha = 0.2
} else {
	exit_button.border_alpha = 0
	exit_button.secborder_alpha = 0
	exit_button.alpha = 0
}

if (exit_button.clicked) {
	instance_destroy()
}