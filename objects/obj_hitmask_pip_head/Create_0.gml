event_inherited()

height = HL.high

animated = false

function hit_callback(_bullet) {
	body.hit(_bullet, "head")
}