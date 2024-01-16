// Inherit the parent event
event_inherited();

// [Initiate] Default x and y values
def_pos_x = x;
def_pos_y = y;

// [Overwrite]
button_text = "Quit to Desktop"

// [Overwrite]
text_color = c_green;


// Sets the function to quit the game when the button is released
activate_button = function() 
{
	game_end();
}