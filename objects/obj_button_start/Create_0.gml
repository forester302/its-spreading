// Inherit the parent event
event_inherited();


// [Overwrite] Sets the text to be drawn
button_text = "Start"

// Sets the function to move to rm_game when the button is released
activate_button = function() 
{
	room_goto(rm_game)
}