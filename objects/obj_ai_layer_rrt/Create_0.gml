colslider = create_groundhigh(x, y, obj_ai_collision_slider) // create collision slider for checking collisions on planned RRT paths (it 'slides' over the RRT paths)

// Inputs from player
body_x = undefined // the current x,y,th position of the player
body_y = undefined
body_th = undefined // orientation of player
cost_field = undefined // the cost field in which RRT should grow

// RRT (Rapid Random Tree) layer properties
rrt_curbranch = undefined // current RRT* branch we're walking
rrt_dest = undefined // destination branch of RRT
rrt_branches = ds_list_create() // all branches of RRT
rrt_branches_open = ds_list_create() // list of branches that are still open, no connections at end point yet
rrt_gearshift_pen = 0 // penalty variables in G cost for gearshift or steershift between RRT node and its parent. The higher the shift penalties, the more it preserves momentum.
rrt_steershift_pen = 0
rrt_branch_completed = false // whether current branch we're walking has been completed
rrt_walk_timer = -1 // timer for keeping completion time of element in check
rrt_walk_maxtime = 80 // how many steps maximally to wait for completing element
