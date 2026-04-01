left = 0
top = 0
width = 200
height = 100
alpha = 1
corner_size = 0

active = true
subfocus = true
night = false

backg_colour = c_red
backg_alpha = 0.6

map_name = ""
map_sprite = -1
map_index = ""

header_backg_colour = $FF545454
header_backg_alpha = 0.4
header_height = 20
header_font = ft_normal
header_text_colour = c_white

border_alpha = 1
border_colour = c_black
border_hover_colour = $FFFFFFFF
border_click_colour = c_black
border_inactive_colour = c_dkgray

secborder_colour = c_gray
secborder_hover_colour = c_ltgray
secborder_click_colour = c_aqua
secborder_inactive_colour = c_gray


exit_button = create_ui(x, y, obj_ui_button)
exit_button.width = header_height
exit_button.height = header_height+1
exit_button.icon = spr_ui_icon_exitwindow
exit_button.colour_hover = header_backg_colour
exit_button.colour_click = header_backg_colour
exit_button.secborder_click_colour = $FF5110D3
exit_button.alpha = 0
exit_button.border_alpha = 0
exit_button.secborder_alpha = 0

hover = false
click = false
clicked = false
hover_header = false
clicked_header = false
hover_body = false
clicked_body = false