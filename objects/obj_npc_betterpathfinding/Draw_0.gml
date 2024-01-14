draw_self()

if (global.debug) {
	draw_set_color(c_blue)
	draw_circle(target_x, target_y, 10, false)
	if (!global.pathfinding)
	{
		draw_line(x, y, target_x, target_y)
	}
	else
	{
		draw_path(path, x, y, true)
	}
}