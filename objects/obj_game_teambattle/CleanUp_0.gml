// Inherit the parent event
event_inherited();

for (var i = 0; i < ds_list_size(teams); i ++)
	instance_destroy(teams[|i])
ds_list_destroy(teams)