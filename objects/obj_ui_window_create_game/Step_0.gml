event_inherited()

//Center
left = display_get_gui_width()/2 - width/2 
top = display_get_gui_height()/2 - height/2

//Position add button
var coord = array_create(2, 0)
coord[0] = 11
coord[1] = 60 + mapcycle.height
ui_window_position_element(button_add_map, coord[0], coord[1])
button_add_map.corner_size = clamp((button_add_map.top + button_add_map.height) - (top + height-30), 0, button_add_map.height)

//Clicked add button
if (button_add_map.clicked) {
	if (add_map_window == -1 || !instance_exists(add_map_window)) {
		add_map_window = ui_create_window(obj_ui_window_create_game_add_maps, -1, -1)
	} else {
		ui_focus_window(add_map_window)
	}
}

//Clicked mapcard body
for (var i = 0; i < ds_list_size(mapcycle.cards); i++) {
	var card = mapcycle.cards[|i];
	if (card.clicked_body) {
		if (change_map_window == -1 || !instance_exists(change_map_window)) {
			change_map_window = ui_create_window(obj_ui_window_create_game_add_maps, -1, -1)
			change_map_window.title = "Replace position " + string(i+1) + " with map "
			mapcard_position_replacement = i
		} else {
			ui_focus_window(change_map_window)
		}
	}
}

//Add map from Add Map window
if (add_map_window != -1 && instance_exists(add_map_window) && add_map_window.mapselection.clicked) {
	var map_description = ds_list_find_value(add_map_window.mapselection.maps, add_map_window.mapselection.hover_index)
	var map_sprite;
	map_sprite = ui_window_icon_to_map(map_description.map_name)
	
	var mapcard = create_ui(0, 0, obj_ui_mapcard)
	mapcard.map_name = map_description.map_name
	mapcard.map_sprite = map_sprite
	mapcard.left = mapcycle.left
	mapcard.top = ds_list_size(mapcycle.cards) == 0 ? mapcycle.top : mapcycle.top + mapcycle.height
	mapcard.height = ds_list_size(mapcycle.cards) == 0 ? mapcycle.nomap_height : 0
	ds_list_add(mapcycle.cards, mapcard)
	
	instance_destroy(add_map_window)
}

//Change map from Change Map window
if (change_map_window != -1 && instance_exists(change_map_window) && change_map_window.mapselection.clicked) {
	var map_description = ds_list_find_value(change_map_window.mapselection.maps, change_map_window.mapselection.hover_index)
	var map_sprite;
	map_sprite = ui_window_icon_to_map(map_description.map_name)
	
	var mapcard = ds_list_find_value(mapcycle.cards, mapcard_position_replacement)
	mapcard.map_name = map_description.map_name
	mapcard.map_sprite = map_sprite
	
	instance_destroy(change_map_window)
}

//Add default maps
if (mapcycle_default.clicked) {
	for (var i = 0; i < ds_list_size(mapcycle.cards); i++) {
		instance_destroy(mapcycle.cards[|i])
	}
	ds_list_clear(mapcycle.cards)
	
	var mapcard = create_ui(0, 0, obj_ui_mapcard)
	mapcard.map_name = "Joseph's farm"
	mapcard.map_sprite = spr_ui_map_josephsfarm
	ds_list_add(mapcycle.cards, mapcard)
	mapcard = create_ui(0, 0, obj_ui_mapcard)
	mapcard.map_name = "Ijs map"
	mapcard.map_sprite = spr_ui_map_ijsmap
	ds_list_add(mapcycle.cards, mapcard)
	mapcard = create_ui(0, 0, obj_ui_mapcard)
	mapcard.map_name = "Desert map"
	mapcard.map_sprite = spr_ui_map_desertmap
	ds_list_add(mapcycle.cards, mapcard)
	
	for (var i = 0; i < ds_list_size(mapcycle.cards); i++) {
		mapcycle.cards[|i].left = mapcycle.left
		mapcycle.cards[|i].top = mapcycle.top
		mapcycle.cards[|i].height = 0
	}
}

//Maximal amount of mapcards
button_add_map.active = active && ds_list_size(mapcycle.cards) < max_maps

//Click gamemode select button
if (gamemode_button.clicked) {
	if (choose_gamemode_window == -1 || !instance_exists(choose_gamemode_window)) {
		choose_gamemode_window = ui_create_window(obj_ui_window_create_game_choose_gamemode, -1, -1)
	} else {
		ui_focus_window(choose_gamemode_window)
	}
}

//Gamemmode chosen from window
if (choose_gamemode_window != -1 && instance_exists(choose_gamemode_window) && choose_gamemode_window.gamemodeselection.clicked) {
	var gamemode_description = ds_list_find_value(choose_gamemode_window.gamemodeselection.gamemodes, choose_gamemode_window.gamemodeselection.hover_index)
	game_gamemode = gamemode_description.gamemode_name
	gamemode_button.text = game_gamemode
	
	instance_destroy(choose_gamemode_window)
}