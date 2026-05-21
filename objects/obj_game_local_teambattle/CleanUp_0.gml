// Inherit the parent event
event_inherited();


for (var i = 0; i < teams_number; i ++) {
	ds_list_destroy(teams[i])
	ds_list_destroy(team_spawns[i])
	ds_list_destroy(team_reserves[i])
}