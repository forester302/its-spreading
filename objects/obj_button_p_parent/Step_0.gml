// Sets hovering to true if the mouse is on a button
/// device_mouse_whatever_to_gui converts the mouse's position to it's position on the GUI, which is 
/// separate than the room; the (0) is the device being checked, which doesn't matter in our case
hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)

// If the mouse is hovering over a button and left mouse button is pressed down
if (hovering && mouse_check_button_pressed(mb_left)) {
	// Sets to true
	clicked = true;
}

/// This makes sure buttons are only pressed if the player is hovering over and fully presses and releases
// If the left mouse button is released
if (clicked and mouse_check_button_released(mb_left)) {
	// Sets to false
	clicked = false;
	
	// Previous if statement and if the player is hovering
	if (hovering) {
		// Press the button
		activate_button()
	}
}


// This should all be self explanatory, DON'T CHANGE THE ORDER
if (clicked and parent_settings_sprite) {
	image_index = 2;
}
else if (hovering and parent_settings_sprite)
{
	image_index = 1;
}
else if (parent_settings_sprite)
{
	image_index = 0;
}