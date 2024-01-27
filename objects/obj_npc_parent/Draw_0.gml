// If debug mode is on
if (global.debug)
{
	var _infection_radius = global.base_infection_radius + npc_infection_radius
	// Draw circles for infection radius
	draw_set_color(c_blue)
	draw_circle(x, y, _infection_radius, true)
	
	// Draw circle for pathfinding target
	draw_circle(target_x, target_y, 10, false)
	
	// If pathfinding is set to simple
	/*
	if (!global.pathfinding)
	{
		// Draws a line to the target (rather than to every point avoiding collision)
		draw_line(x, y, target_x, target_y)
	}
	else
	{
		// Draws the path to target
		draw_path(path, x, y, true)
	}*/
}

// Draws the sprite of this NPC
draw_self();

// Draw progress bar for how long the NPC can stay infected for
if (infected_level > 0)
{
	draw_set_color(c_green)
	var _x1 = x-15
	var _y1 = y-45

	var _x2 = x+15
	var _y2 = y-40

	var _val = 1 - (self_infected_timer / (global.base_longevity_npc + npc_health_level))

	draw_rectangle(_x1, _y1, _x1+(_x2-_x1)*_val, _y2, false)
}

// Draws the status icon depending on the infected level of this NPC at the top right of the NPC
draw_sprite(spr_status_icon, infected_level, x+5, y-45)

