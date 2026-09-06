// Inherit the parent event
event_inherited();

debug_draw_mode = 0

// AI component references
vision = noone // reference to vision object, initialized upon Room Start
action_planner = noone // references to planning layers
layer_agrid = noone
layer_rrt = noone