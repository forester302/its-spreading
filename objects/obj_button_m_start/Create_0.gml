// Inherit the parent event
event_inherited();


// [Overwrite] Sets the text to be drawn
button_text = ""

// Sets the function to move to rm_game when the button is released
activate_button = function() 
{
	script_execute(scr_fade_to_room, rm_game2, 60, c_white);
}