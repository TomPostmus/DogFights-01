event_inherited()

title = "Create a new game"
header = false
backg_colour = WINDOW_RED_COLOUR
border_colour = backg_colour
width = 700
height = 500

add_map_window = -1
change_map_window = -1
choose_gamemode_window = -1
mapcard_position_replacement = -1
max_maps = 18

game_name = ""
game_gamemode = ""

var line_colour = c_black

var separator_line = create_ui(0, 0, obj_ui_line)
separator_line.colour = border_colour
separator_line.end_y = height - 50
separator_line.end_sprite = -1
separator_line.end_length = 0

ui_window_add_element(separator_line, 260, 40)

var mapcycle_header_text = create_ui(0, 0, obj_ui_text)
mapcycle_header_text.text = "Map cycle: "
mapcycle_header_text.colour = line_colour
mapcycle_header_text.font = ft_normal
mapcycle_header_text.halign = fa_left

ui_window_add_element(mapcycle_header_text, 15, 49)

mapcycle_default = ui_window_red_secondary_button()
mapcycle_default.width = 100
mapcycle_default.height = 19
mapcycle_default.shape = "one_corner_topleft"
mapcycle_default.corner_size = mapcycle_default.height
mapcycle_default.text = "default"
mapcycle_default.secborder_alpha = 0
mapcycle_default.text_h_offset = 7
mapcycle_default.text_v_offset = -1
mapcycle_default.text_inactive_colour = c_white

ui_window_add_element(mapcycle_default, 250 - mapcycle_default.width, 41)

mapcycle = create_ui(0, 0, obj_ui_mapcycle)
mapcycle.width = 240
mapcycle.height = 300
mapcycle.max_height = height - 100
mapcycle.border_colour = line_colour

ui_window_add_element(mapcycle, 10, 60)

button_add_map = ui_window_red_secondary_button()
button_add_map.width = 239
button_add_map.height = 30
button_add_map.icon = spr_ui_icon_addmap
button_add_map.shape = "one_corner"
button_add_map.corner_size = 20

ui_window_add_element(button_add_map, 20, height - 40)

var name_text = create_ui(0, 0, obj_ui_text)
name_text.colour = line_colour
name_text.text = "Game name: "
name_text.halign = fa_left
name_text.font = ft_normal

ui_window_add_element(name_text, 270, 50)

name_field = create_ui(0, 0, obj_ui_input)
name_field.width = 200
name_field.height = 20
name_field.backg_alpha = 0.3
name_field.text_colour = c_white
name_field.text_h_offset = 9
name_field.text_maxchar = 23

name_field.backg_colour = c_black
name_field.border_colour = line_colour

name_field.backg_hover_colour = c_dkgray
name_field.border_hover_colour = line_colour

name_field.backg_input_colour = c_dkgray
name_field.border_input_colour = $FFD64848

ui_window_add_element(name_field, width - 10 - name_field.width, 40)

var gamemode_text = create_ui(0, 0, obj_ui_text)
gamemode_text.colour = line_colour
gamemode_text.text = "Game mode: "
gamemode_text.halign = fa_left
gamemode_text.font = ft_normal

ui_window_add_element(gamemode_text, 270, 80)

gamemode_button = ui_window_red_secondary_button()
gamemode_button.width = 200
gamemode_button.height = 20
gamemode_button.text = "Choose game mode..."
gamemode_button.icon = spr_ui_icon_choose
gamemode_button.secborder_alpha = 0

gamemode_button.text_inactive_colour = c_white

ui_window_add_element(gamemode_button, width - 10 - gamemode_button.width, 70)

var duration_text = create_ui(0, 0, obj_ui_text)
duration_text.colour = line_colour
duration_text.text = "Duration: "
duration_text.font = ft_normal
duration_text.halign = fa_left

ui_window_add_element(duration_text, 270, 110)

duration_cycle = create_ui(0, 0, obj_ui_cycle)
duration_cycle.width = 200
duration_cycle.height = 20
duration_cycle.text_h_offset = 9
duration_cycle.text_colour = c_white

duration_cycle.button_colour = WINDOW_RED_SECCOLOUR
duration_cycle.button_colour_hover = WINDOW_RED_SECCOLOUR_HOVER
duration_cycle.button_colour_click = WINDOW_RED_SECCOLOUR_CLICK

ds_list_add(duration_cycle.options, "30 seconds")
ds_list_add(duration_cycle.options, "1 minute")
ds_list_add(duration_cycle.options, "2 minutes")
ds_list_add(duration_cycle.options, "3 minutes")
ds_list_add(duration_cycle.options, "4 minutes")
ds_list_add(duration_cycle.options, "5 minutes")
ds_list_add(duration_cycle.options, "6 minutes")
ds_list_add(duration_cycle.options, "7 minutes")
ds_list_add(duration_cycle.options, "8 minutes")
ds_list_add(duration_cycle.options, "9 minutes")
ds_list_add(duration_cycle.options, "10 minutes")
ds_list_add(duration_cycle.options, "11 minutes")
ds_list_add(duration_cycle.options, "12 minutes")
ds_list_add(duration_cycle.options, "13 minutes")
ds_list_add(duration_cycle.options, "14 minutes")
ds_list_add(duration_cycle.options, "15 minutes")
ds_list_add(duration_cycle.options, "20 minutes")
ds_list_add(duration_cycle.options, "25 minutes")
ds_list_add(duration_cycle.options, "30 minutes")
ds_list_add(duration_cycle.options, "35 minutes")
ds_list_add(duration_cycle.options, "40 minutes")
ds_list_add(duration_cycle.options, "45 minutes")
ds_list_add(duration_cycle.options, "1 hour")
ds_list_add(duration_cycle.options, "Unlimited")

duration_cycle.option_index = 3

ui_window_add_element(duration_cycle, width - 10 - duration_cycle.width, 100)

var scorelimit_text = create_ui(0, 0, obj_ui_text)
scorelimit_text.colour = line_colour
scorelimit_text.text = "Score limit: "
scorelimit_text.font = ft_normal
scorelimit_text.halign = fa_left

ui_window_add_element(scorelimit_text, 270, 140)

scorelimit_cycle = create_ui(0, 0, obj_ui_cycle)
scorelimit_cycle.width = 200
scorelimit_cycle.height = 20
scorelimit_cycle.text_h_offset = 9
scorelimit_cycle.text_colour = c_white

scorelimit_cycle.button_colour = WINDOW_RED_SECCOLOUR
scorelimit_cycle.button_colour_hover = WINDOW_RED_SECCOLOUR_HOVER
scorelimit_cycle.button_colour_click = WINDOW_RED_SECCOLOUR_CLICK

ds_list_add(scorelimit_cycle.options, "5 points")
ds_list_add(scorelimit_cycle.options, "10 points")
ds_list_add(scorelimit_cycle.options, "15 points")
ds_list_add(scorelimit_cycle.options, "20 points")
ds_list_add(scorelimit_cycle.options, "30 points")
ds_list_add(scorelimit_cycle.options, "40 points")
ds_list_add(scorelimit_cycle.options, "50 points")
ds_list_add(scorelimit_cycle.options, "60 points")
ds_list_add(scorelimit_cycle.options, "70 points")
ds_list_add(scorelimit_cycle.options, "85 points")
ds_list_add(scorelimit_cycle.options, "100 points")
ds_list_add(scorelimit_cycle.options, "125 points")
ds_list_add(scorelimit_cycle.options, "150 points")
ds_list_add(scorelimit_cycle.options, "175 points")
ds_list_add(scorelimit_cycle.options, "200 points")
ds_list_add(scorelimit_cycle.options, "Unlimited")

scorelimit_cycle.option_index = 3

ui_window_add_element(scorelimit_cycle, width - 10 - scorelimit_cycle.width, 130)

var mapcycle_text = create_ui(0, 0, obj_ui_text)
mapcycle_text.colour = line_colour
mapcycle_text.text = "Map cycle progression: "
mapcycle_text.font = ft_normal
mapcycle_text.halign = fa_left

ui_window_add_element(mapcycle_text, 270, 170)

mapcycle_dropdown = create_ui(0, 0, obj_ui_dropdown)
mapcycle_dropdown.width = 200
mapcycle_dropdown.height = 20
mapcycle_dropdown.text_h_offset = 9
mapcycle_dropdown.text_colour = c_white
mapcycle_dropdown.options_secborder_alpha = 0
mapcycle_dropdown.options_border_alpha = 0

mapcycle_dropdown.button_colour = WINDOW_RED_SECCOLOUR
mapcycle_dropdown.button_colour_hover = WINDOW_RED_SECCOLOUR_HOVER
mapcycle_dropdown.button_colour_click = WINDOW_RED_SECCOLOUR_CLICK

mapcycle_dropdown.options_colour = $FF545454
mapcycle_dropdown.options_colour_hover = $FF686868
mapcycle_dropdown.options_colour_click = $FF444444

mapcycle_dropdown.options_text_colour = c_white
mapcycle_dropdown.options_text_colour_hover = c_white
mapcycle_dropdown.options_text_colour_click = c_white

ui_dropdown_add_option(mapcycle_dropdown, "In order", spr_ui_icon_emtpy)
ui_dropdown_add_option(mapcycle_dropdown, "Randomly", spr_ui_icon_emtpy)

ui_window_add_element(mapcycle_dropdown, width - 10 - mapcycle_dropdown.width, 160)

create_button = ui_window_red_primary_button()
create_button.width = 100
create_button.height = 30
create_button.text = "Create"
create_button.icon = spr_ui_icon_proceedarrow
create_button.text_font = ft_normal_bold

create_button.script_onclicked = http_get_kaas

ui_window_add_element(create_button, width - 10 - create_button.width, height - 10 - create_button.height)

cancel_button = ui_window_red_secondary_button()
cancel_button.width = 100
cancel_button.height = 30
cancel_button.text = "Cancel"
cancel_button.icon = spr_ui_icon_exitwindow
cancel_button.text_font = ft_normal_bold
cancel_button.secborder_alpha = 0

ui_window_add_element(cancel_button, width - 20 - cancel_button.width - create_button.width, height - 10 - create_button.height)