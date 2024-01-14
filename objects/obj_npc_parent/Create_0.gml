// [Initialize] Sets the default speed of the NPCs (to be used in adding path points)
npc_speed = 1000;

// Disables the animation of the NPC
image_speed = 0


// Setting up everything needed for this NPCs path

// [Initialize] Creates a blank path set to "path"
path = path_add()
// Sets the path to not loop
path_set_closed(path, false)

// Adds a point with the current x and y of this npc, using npc_speed, to "path"
path_add_point(path, x, y, npc_speed)

// [Initialize] Sets the timer to how long the NPC should wait before moving
path_start_timer = -1;
// Says the path is currently completed (<1 means it's running)
path_position = 1;


// Set up for velocity tracking

// [Initialize] Sets the previous x to the current x
pre_pos_x = x
// [Initialize] Sets the previous y to the current y
pre_pos_y = y


// [Initialize] Sets the infected level to 0 (higher numbers means more infected, 9 being the max)
infected_level = 0;
// [Initialize] Timer for how long this NPC has been in the radius of an infected NPC for
infected_timer = 0;