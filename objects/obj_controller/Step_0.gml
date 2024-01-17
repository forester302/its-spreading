// [Assign] Sets if switched or not to false
var _switched = false;
// [Initialize] Sets target room to 0 (blank)
var _target_room = 0;

// If fade transition requested and a fade doesn't already exist
if (global.fade_transition && !instance_exists(obj_fade)) 
{
	switch room
	{
		// If current room is logo
		case rm_logo:
			// [Initialize] Sets target room to title
			_target_room = rm_title;
	}
	
	// Calls the script and passes the room, duration, and color
	scr_fade_to_room(_target_room, 60, c_white);
	
	// [Assign] Sets switched to true
	_switched = true;
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
			_target_room = rm_title;
			// [Assign] Resets timer
			timer = 0;
		}
}

// If scene hasn't switched already and there's a target room
if (!_switched && (_target_room != 0))
{
	// Switch to target room
	scr_fade_to_room(_target_room, 60, c_white);
	
	// [Assign] Sets switched to true
	/// Should be abitrary
	_switched = true;
}

// Increments timer by one
timer++;