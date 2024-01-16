// [Initialize] Sets whether the game is paused or not to false
global.pause = false;
// [Initialize] Sets pause surface (kinda it's id) to none
pause_surf = -1;
// [Initialize] Sets buffer value to none
pause_surf_buffer = -1;

// [Initialize] Sets to buttons aren't created
p_buttons_created = false;


// Grabs room info and reads for width and height
/// When we allow different resolutions in the future, this needs to be heavily modified
function getRoomInfo(requested_value)
{
	// [Initialize] Gets info on rm_game, used for width and height
	room_info = room_get_info(rm_game, false, false, false, false, false);
	// [Initialize] Starting at 0, sets to the index of the first occurence of the string
	x_index = string_pos("width", room_info);
	// [Initialize] Copies the specified string between the second and third parameter, then converts from
	// string to int
	x_value = real(string_copy(room_info, (x_index + 8), 4));
	// [Initialize] Look at x_index
	y_index = string_pos("height", room_info);
	// [Initialize] Look at y_index
	y_value = real(string_copy(room_info, (y_index + 9), 4));
	
	// Reads the requested value and returns what's requested
	if (requested_value == "x") {return x_value}
	if (requested_value == "y") {return y_value}
}

// [Initialize] Each variable is set to the room's corresponding value
res_x = getRoomInfo("x");
res_y = getRoomInfo("y");