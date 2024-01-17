// Inherit the parent event
event_inherited();

get_determiner = function ()
{
	return global.debug	
}

label = "Debug "

// [Overwrite] Sets the text to be drawn
/// ? : first queries if the bool in front is true; if it is, the left of the colon will run, otherwise
/// the right will
button_text = get_text()

// Sets the function to toggle debug mode when the button is released
activate_button = function() 
{
	// Sets debug to the opposite of what it currently is
	global.debug = !global.debug
	button_text = get_text()
}