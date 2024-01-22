hovering = false
clicked = false

activate_button = function()
{
	var _menu = instance_find(obj_ui_menu_container, 0)
	_menu.enabled = !_menu.enabled
}