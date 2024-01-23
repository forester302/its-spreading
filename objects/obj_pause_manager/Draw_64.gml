//
if (global.pause)
{
	if (surface_exists(pause_surf))
	{
		if (pause_game)
		{
			draw_set_color(c_black);
			draw_text( (scr_get_room_info("x") / 2), (scr_get_room_info("y") / 16), "PAUSED")
		}
	}
}