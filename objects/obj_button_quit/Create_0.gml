// Inherit the parent event
event_inherited();


// [Overwrite] Sets the text to be blank
button_text = ""

// Sets the function to quit the game when the button is released
activate_button = function() 
{
	game_end();
}