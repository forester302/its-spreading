// [Initialize] Sets the default speed of the NPCs
npc_speed = 1.5;
//
work_speed = 1;

// Modifies the radius the virus can spread TO this NPC
npc_infection_radius = 0;
// Modifier for how long the virus lasts in this npc (higher is longer)
npc_health_level = 1000


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
// 
infection_chance_min = 0;

// [Initalize] Timer for how long this NPC has been infected
self_infected_timer = 0;

// set default sprites for animations (overwitten in children to change the sprites)
npc_sprites = [spr_npc_m_walk_down, spr_npc_m_walk_left, spr_npc_m_walk_right, spr_npc_m_walk_up]
npc_idle_sprites = [spr_npc_m_idle_down, spr_npc_m_idle_left, spr_npc_m_idle_right, spr_npc_m_idle_up]