// Switch active player one
if (keyboard_check_pressed(vk_f5)) {	
	for (var i = 0; i < instance_number(obj_player); i ++)
		if (instance_find(obj_player, i) == players_active[|0]) break // find index of current active player
		
	players_active[|0] = instance_find(obj_player, (i+1) mod instance_number(obj_player)) // set active player to next
}