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

maps = ds_list_create()
map_surface = surface_create(width, height)

hover_index = -1

var josephsfarm = create_ui(0, 0, obj_ui_mapdescription)
josephsfarm.map_name = "Joseph's farm"
josephsfarm.map_sprite = spr_ui_map_josephsfarm_icon
josephsfarm.map_description = "In the north of the Brabantian Plains lies the farm of the wealthy Joseph Burghouts. But while old Joseph is away to enjoy his leave, unwanted creatures come to disturb the peace! "
ds_list_add(maps, josephsfarm)

var ijsmap = create_ui(0, 0, obj_ui_mapdescription)
ijsmap.map_name = "Ijs map"
ijsmap.map_sprite = spr_ui_map_ijsmap_icon
ijsmap.map_description = "KaasKaasKaasKaasKaasKaasKaas"
ds_list_add(maps, ijsmap)

var desertmap = create_ui(0, 0, obj_ui_mapdescription)
desertmap.map_name = "Desert map"
desertmap.map_sprite = spr_ui_map_desertmap_icon
desertmap.map_description = "KaasKaasKaasKaasKaasKaasKaas"
ds_list_add(maps, desertmap)