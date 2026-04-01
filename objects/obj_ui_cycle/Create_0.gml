left = 0
top = 0
width = 100
height = 20

active = true
subfocus = true

clicked = false
hover = false

options = ds_list_create()
option_index = 0

value = ""

backg_colour = c_black
backg_alpha = 0.3
backg_inactive_colour = c_gray
backg_clicked_colour = c_dkgray

border_colour = c_black
border_hover_colour = c_black
border_click_colour = c_black
border_inactive_colour = c_dkgray

button_icon = spr_ui_icon_dropdownarrow_white
button_colour = c_ltgray
button_colour_hover = c_white
button_colour_click = c_gray
button_colour_inactive = c_gray

text_font = ft_normal
text_colour = c_black
text_h_offset = 0

button_up = create_ui(0, 0, obj_ui_button)
button_up.icon = spr_ui_icon_dropdownarrow_white_up
button_up.secborder_alpha = 0
button_down = create_ui(0, 0, obj_ui_button)
button_down.icon = spr_ui_icon_dropdownarrow_white
button_down.secborder_alpha = 0

button_colour = c_ltgray
button_colour_hover = c_white
button_colour_click = c_gray

button_border_colour = c_black
button_border_hover_colour = c_black
button_border_click_colour = c_black