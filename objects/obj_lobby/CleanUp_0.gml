// Cleanup players
for (var i = 0; i < ds_list_size(players); i ++)
	with (players[|i])
		instance_destroy()
		
ds_list_destroy(players)
ds_list_destroy(players_active)

with (game)
	instance_destroy()