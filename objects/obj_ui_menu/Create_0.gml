parent = undefined // parent menu which it can go back to
windows = ds_list_create()

draw = function() {
	
	for (var i = 0; i < ds_list_size(windows); i ++)
		windows[|i].draw()
	
}