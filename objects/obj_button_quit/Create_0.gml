// Inherit the parent event
event_inherited();


// [Overwrite]
button_text = ""

// Sets the function to quit the game when the button is released
activate_button = function() 
{
	game_end();
}