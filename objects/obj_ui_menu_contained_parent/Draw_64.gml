var _menu = instance_find(obj_ui_menu_container, 0)
if (_menu.enabled)
{
	if (has_sprite)
	{
		// Inherit the parent event
		event_inherited();
	}
	// Draw
	draw_function()
}

