// Inherit the parent event
event_inherited();

// [Initiate] Default x and y values
def_pos_x = x;
def_pos_y = y;

// [Overwrite]
button_text = "Quit to Menu";

// [Overwrite]
text_color = c_green;


// Sets the function to quit to the menu when the button is released
activate_button = function() 
{
	room_goto(rm_menu);
}