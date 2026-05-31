// Enable viewports in ingame rooms
var _nr_players_active = ds_list_size(obj_lobby.players_active)
for (var i = 0; i < array_length(global.ingame_rooms); i ++) 
	room_set_viewports(global.ingame_rooms[i], _nr_players_active) // enable viewports in ingame rooms