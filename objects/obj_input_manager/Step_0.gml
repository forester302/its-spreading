// If escape key was released
if (keyboard_check_released(escape_keyb))
{
	// If the current room is rm_game
	if (room == rm_game)
	{
		// [Assign] Sets it to the opposite of what it currently is
		global.pause_signal = !global.pause_signal;
	}
}

// If space key was released
if (keyboard_check_released(space_keyb))
{
	// If the current room is rm_game
	if (room == rm_game)
	{
		// Skip
	}
	else
	{
		// [Assign] Request fade transition
		global.fade_transition = true;
	}
}