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
