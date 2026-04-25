for (var i = 0; i < ds_list_size(elements); i ++) {
	instance_destroy()
}
ds_list_destroy(elements)
ds_map_destroy(element_positions)

if (vertices_border != undefined)
	ds_list_destroy(vertices_border)
if (vertices_backg != undefined)
	ds_list_destroy(vertices_backg)