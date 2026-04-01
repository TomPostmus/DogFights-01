/// @param dog
/// @param circle_pivot
function dog_skeleton_joint_pip() {

	var dog = argument[0];
	var pivot = argument[1];

	with (dog) {
		var body = create_physics(x, y, obj_physics_dog_body)
		body.weight = 1
		body.h_bottom = 0
		body.h_top = 20
		var head = create_physics(x + dog.head_offset, y, obj_physics_dog_head)
		head.weight = 1
		head.h_bottom = 17
		head.h_top = 32
		/*var head = create_physics(x + 13, y, obj_physics_circle)
		head.weight = 1
		head.radius = 8
		head.h_bottom = 17
		head.h_top = 32*/
		return joint_create(pivot, body, head)
	}


}
