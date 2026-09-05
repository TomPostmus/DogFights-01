ai_path_sampletime = 30 // how many frames we have for scheduling all path updates
ai_path_timer = 0 // timer counting up for
ai_path_scheduled = ds_stack_create() // stack of AI players that are currently scheduled