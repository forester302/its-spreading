// Inherit the parent event
event_inherited();

// Sets to not use default parent settings for changing sprite on hover
parent_settings_sprite = false;

// [Initiate] Default x and y values
def_pos_x = x;
def_pos_y = y;

// [Initiate] Sets if the mouse is hovering on one side of this button to false
mouse_right_side = false;
mouse_left_side = false;

// [Overwrite]
button_text = "Volume";

// [Overwrite]
text_color = c_teal;


// Sets the function to resume when the button is released
activate_button = function() 
{
	// If the mouse is on the right side of this button
	if (mouse_right_side)
	{
		// If the volume is under or equal to 200%
		if(global.song_volume <= 2)
		{
			// Increase the volume by 5%
			global.song_volume += .05;
		}
	}
	// If the mouse is on the left side of this button
	else if (mouse_left_side)
	{
		// If the volume is above or equal to 0
		if (global.song_volume >= 0)
		{
			// Decrease the volume by 5%
			global.song_volume -= .05;
		}
	}
}