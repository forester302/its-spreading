// [Assign] Sets if switched or not to false
switched = false;
// [Assign] Sets target room to 0 (blank)
target_room = -1;

// If fade transition requested and a fade doesn't already exist
if (global.fade_transition && !instance_exists(obj_fade)) 
{
	switch room
	{
		// If current room is logo
		case rm_logo:
			// [Initialize] Sets target room to title
			target_room = rm_title;
			
		break;
	}
	
	// If there's a target room
	if (target_room != -1)
	{
		// Calls the script and passes the room, duration, and color
		scr_fade_to_room(target_room, 60, c_white);
	}

	// [Assign] Sets switched to true
	switched = true;
	// [Assign] Sets fade request to false
	global.fade_transition = false;
}

switch room
{
	// If the current room is logo
	case rm_logo:
		// If it's been 360 frames or more
		if (timer > 240)
		{
			// [Assign] Sets target room to title
			target_room = rm_title;
			// [Assign] Resets timer
			timer = 0;
		}
	
	break;
}

// If scene hasn't switched already and there's a target room
if (!switched && (target_room != -1))
{
	// Calls the script and passes the room, duration, and color
	scr_fade_to_room(target_room, 60, c_white);
	
	// [Assign] Sets switched to true
	/// Should be abitrary
	switched = true;
}

// Increments timer by one
timer++;