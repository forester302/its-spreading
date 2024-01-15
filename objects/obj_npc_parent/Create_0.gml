// [Initialize] Sets the default speed of the NPCs
npc_speed = 6;

// Disables the animation of the NPC
image_speed = 0


// Setting up everything needed for this NPCs path

// If pathfinding is set to basic
if (global.pathfinding)
{
	// [Initialize] Creates a blank path set to "path"
	path = path_add()
}

// [Initialize] Sets the timer to how long the NPC should wait before moving
path_start_timer = -1;
// Says the path is currently completed
path_completed = true

// [Initalize] x value for the target
target_x = x;
// [Initalize] y value for the target
target_y = y;


// Set up for velocity tracking

// [Initialize] Sets the previous x to the current x
pre_pos_x = x
// [Initialize] Sets the previous y to the current y
pre_pos_y = y


// [Initialize] Sets the infected level to 0 (higher numbers means more infected, 9 being the max)
infected_level = 0;
// [Initialize] Timer for how long this NPC has been in the radius of an infected NPC for
infected_timer = 0;