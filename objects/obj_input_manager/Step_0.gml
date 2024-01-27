// If escape key was released
if (keyboard_check_released(escape_keyb))
{
	// If the current room is rm_game
	if (room == rm_game2 or room == rm_game2)
	{
		// [Assign] Sets it to the opposite of what it currently is
		global.pause_signal = !global.pause_signal;
	}
}

// If the space bar was released
if (keyboard_check_released(space_keyb))
{
	// If the current room is rm_game
	if (room == rm_game2)
	{
		// [Assign] Sets it to the opposite of what it currently is
		global.pause_game_signal = !global.pause_game_signal;
	}
}

if (keyboard_check_released(f_keyb))
{
	show_debug_message("here")
	if (room == rm_game2)
		global.cough_ability = 1;
		show_debug_message("here")
}
	

// If any key has been released
// or any mouse button has been released
// and the room is rm_logo
if ((keyboard_check_released(vk_anykey) 
	 or mouse_check_button_released(mb_any))
	 and room == rm_logo)
{
	// [Assign] Request fade transition
	global.fade_transition = true;
}


// If scrolled up
if (scroll_up_mouseb == m_scroll_up)
{
	if (mouse_wheel_up())
	{
		global.camera_scroll = 1;
	}
}

// If scrolled down
if (scroll_down_mouseb == m_scroll_down)
{
	if (mouse_wheel_down())
	{
		global.camera_scroll = -1;
	}
}

// If middle mouse is being held down
if (mouse_check_button(middle_mouseb))
{
	global.camera_move++;
}
else if (mouse_check_button_released(middle_mouseb))
{
	global.camera_move = 0;
}