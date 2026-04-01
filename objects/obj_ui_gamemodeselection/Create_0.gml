left = 0
top = 0
width = 100
height = 100

active = true
subfocus = true

click = false
clicked = false

border_colour = c_black
border_alpha = 1

gamemodes = ds_list_create()
gamemode_surface = surface_create(width, height)

hover_index = -1

var teamdeathmatch = create_ui(0, 0, obj_ui_gamemodedescription)
teamdeathmatch.gamemode_name = "Team deathmatch"
teamdeathmatch.gamemode_sprite = spr_ui_gamemode_teamdeathmatch
teamdeathmatch.gamemode_description = "A regular team deathmatch game: Get as many kills as possible with your teammates, because the team with the highest killcount wins! "
ds_list_add(gamemodes, teamdeathmatch)

var freeforall = create_ui(0, 0, obj_ui_gamemodedescription)
freeforall.gamemode_name = "Free for all"
freeforall.gamemode_sprite = spr_ui_gamemode_freeforall
freeforall.gamemode_description = "Every player for himself! The player with the hightest amount of kills is the winner of the deathmatch. "
ds_list_add(gamemodes, freeforall)

var freeforall = create_ui(0, 0, obj_ui_gamemodedescription)
freeforall.gamemode_name = "Turf War"
freeforall.gamemode_sprite = spr_ui_gamemode_turfwar
freeforall.gamemode_description = ". "
ds_list_add(gamemodes, freeforall)