event_inherited()

height = HL.high

animated = false

function hit_callback(_bullet) {
	player.hit(_bullet, "head")
}