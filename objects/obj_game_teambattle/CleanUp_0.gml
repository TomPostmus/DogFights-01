// Inherit the parent event
event_inherited();

for (var i = 0; i < ds_list_size(teams); i ++)
	instance_destroy(teams[|i]) // cleanup team objects managed by game
ds_list_destroy(teams)