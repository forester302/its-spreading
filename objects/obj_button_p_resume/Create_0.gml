// Inherit the parent event
event_inherited();

// [Initiate] Default x and y values
def_pos_x = x;
def_pos_y = y;

// [Overwrite]
button_text = "Resume";

// [Overwrite]
text_color = c_teal;


// Sets the function to resume when the button is released
activate_button = function() 
{
	// [Assign] Sets it to the opposite of what it currently is
	global.pause_signal = !global.pause_signal;
}