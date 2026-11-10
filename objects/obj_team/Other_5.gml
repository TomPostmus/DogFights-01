// Unassign all players
for (var i = 0; i < ds_list_size(players); i ++)
	unassign_player(players[|i])
	
// Clear character list (characters are destroyed on Room End)
ds_list_clear(characters)