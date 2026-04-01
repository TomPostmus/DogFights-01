/// @param room_index
/// @param number_of_viewports
function room_set_viewports() {

	var room_index = argument[0];
	var viewports = argument[1];

	switch (viewports) {
		case 1:
			room_set_view_enabled(room_index, true)
			room_set_viewport(room_index, 0, true, 0, 0, global.width, global.height)
			room_set_viewport(room_index, 1, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 2, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 3, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 4, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 5, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 6, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 7, false, 0, 0, 0, 0)
		break
		case 2:
			room_set_view_enabled(room_index, true)
			var w = global.width/2;
			var h = global.height;
			room_set_viewport(room_index, 0, true, 0, 0, w, h)
			room_set_viewport(room_index, 1, true, w, 0, w, h)
			room_set_viewport(room_index, 2, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 3, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 4, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 5, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 6, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 7, false, 0, 0, 0, 0)
		break
		case 3:
			room_set_view_enabled(room_index, true)
			var w = global.width/2;
			var h = global.height/2;
			room_set_viewport(room_index, 0, true, 0, 0, w, h)
			room_set_viewport(room_index, 1, true, w, 0, w, h)
			room_set_viewport(room_index, 2, true, w/2, h, w, h)
			room_set_viewport(room_index, 3, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 4, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 5, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 6, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 7, false, 0, 0, 0, 0)
		break
		case 4:
			room_set_view_enabled(room_index, true)
			var w = global.width/2;
			var h = global.height/2;
			room_set_viewport(room_index, 0, true, 0, 0, w, h)
			room_set_viewport(room_index, 1, true, w, 0, w, h)
			room_set_viewport(room_index, 2, true, 0, h, w, h)
			room_set_viewport(room_index, 3, true, w, h, w, h)
			room_set_viewport(room_index, 4, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 5, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 6, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 7, false, 0, 0, 0, 0)
		break
		case 5:
			room_set_view_enabled(room_index, true)
			var w = global.width/3;
			var h = global.height/2;
			room_set_viewport(room_index, 0, true, 0, 0, w, h)
			room_set_viewport(room_index, 1, true, w, 0, w, h)
			room_set_viewport(room_index, 2, true, w*2, 0, w, h)
			room_set_viewport(room_index, 3, true, global.width/6, h, w, h)
			room_set_viewport(room_index, 4, true, global.width/2, h, w, h)
			room_set_viewport(room_index, 5, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 6, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 7, false, 0, 0, 0, 0)
		break
		case 6:
			room_set_view_enabled(room_index, true)
			var w = global.width/3;
			var h = global.height/2;
			room_set_viewport(room_index, 0, true, 0, 0, w, h)
			room_set_viewport(room_index, 1, true, w, 0, w, h)
			room_set_viewport(room_index, 2, true, w*2, 0, w, h)
			room_set_viewport(room_index, 3, true, 0, h, w, h)
			room_set_viewport(room_index, 4, true, w, h, w, h)
			room_set_viewport(room_index, 5, true, w*2, h, w, h)
			room_set_viewport(room_index, 6, false, 0, 0, 0, 0)
			room_set_viewport(room_index, 7, false, 0, 0, 0, 0)
		break
		case 7:
			room_set_view_enabled(room_index, true)
			var w = global.width/4;
			var h = global.height/2;
			room_set_viewport(room_index, 0, true, 0, 0, w, h)
			room_set_viewport(room_index, 1, true, w, 0, w, h)
			room_set_viewport(room_index, 2, true, w*2, 0, w, h)
			room_set_viewport(room_index, 3, true, w*3, 0, w, h)
			room_set_viewport(room_index, 4, true, global.width*(1/8), h, w, h)
			room_set_viewport(room_index, 5, true, global.width*(3/8), h, w, h)
			room_set_viewport(room_index, 6, true, global.width*(5/8), h, w, h)
			room_set_viewport(room_index, 7, false, 0, 0, 0, 0)
		break
		case 8:
			room_set_view_enabled(room_index, true)
			var w = global.width/4;
			var h = global.height/2;
			room_set_viewport(room_index, 0, true, 0, 0, w, h)
			room_set_viewport(room_index, 1, true, w, 0, w, h)
			room_set_viewport(room_index, 2, true, w*2, 0, w, h)
			room_set_viewport(room_index, 3, true, w*3, 0, w, h)
			room_set_viewport(room_index, 4, true, 0, h, w, h)
			room_set_viewport(room_index, 5, true, w, h, w, h)
			room_set_viewport(room_index, 6, true, w*2, h, w, h)
			room_set_viewport(room_index, 7, true, w*3, h, w, h)
		break
	}


}
