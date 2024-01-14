// If debug mode is on
if (global.debug)
{
	// Draw circles for infection radius
	draw_set_color(c_blue)
	draw_circle(x, y, 100, true)
	
	// Draw circle for target
	draw_circle(target_x, target_y, 10, false)
	if (!global.pathfinding)
	{
		// Draw line to target
		draw_line(x, y, target_x, target_y)
	}
	else
	{
		// Draw path to target
		draw_path(path, x, y, true)
	}
}

// Draws the sprite of this NPC
draw_self()

// Draws the status icon depending on the infected level of this NPC at the top right of the NPC
draw_sprite(spr_status_icon, infected_level, x+5, y-45)