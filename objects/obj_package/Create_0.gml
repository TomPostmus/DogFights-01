event_inherited()

height = HL.low // collision height of package

interactable = true // whether can be interacted with
opened = false // whether has been opened
image_speed = 0 // stop automatically going to next frame

// Interact function; open package
function interact() {
	opened = true
	interactable = false // no more interactable
	image_index = 1 // next sub image
	
	// Spawn Lupara pickup
	var _pickup = create_groundlow(x + 4, y, obj_lupara_pickup/*,{image_angle: 90}*/)
	_pickup.depth = depth - 1 // make sure it is above package
}