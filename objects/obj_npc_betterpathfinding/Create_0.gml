// [Initialize] Sets the default speed of the NPCs (to be used in adding path points)
npc_speed = 100;

// Disables the animation of the NPC
image_speed = 0


// Setting up everything needed for this NPCs movement

// [Initialize] Sets the timer to how long the NPC should wait before moving
path_start_timer = -1;
// Says the path is currently completed
path_completed = true

if (global.pathfinding)
{
	path = path_add()
}

// Track the position we are moving to
target_x = floor(x);
target_y = floor(y);


// Set up for velocity tracking

// [Initialize] Sets the previous x to the current x
pre_pos_x = x
// [Initialize] Sets the previous y to the current y
pre_pos_y = y


// [Initialize] Sets the infected level to 0 (higher numbers means more infected, 9 being the max)
infected_level = 0;
// [Initialize] Timer for how long this NPC has been in the radius of an infected NPC for
infected_timer = 0;