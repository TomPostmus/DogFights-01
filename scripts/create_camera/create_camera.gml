/// @function create_camera(x, y, [zoom])
/// @description Creates
/// @param {real} x The x position of the camera
/// @param {real} y The y position of the camera
/// @param {real} zoom The zoom that camera is initialized with. By default zoom of 1 is assumed.
/// @returns {obj_camera} The created camera
function create_camera(_x, _y, _zoom=undefined) {

	if (!layer_exists("Cameras")) {
		layer_create(-90, "Cameras")
	}

	var _camera = instance_create_layer(_x, _y, "Cameras", obj_camera);
	
	if (_zoom)
		_camera.zoom = _zoom

	return _camera


}
