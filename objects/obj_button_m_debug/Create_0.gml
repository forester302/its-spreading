// Inherit the parent event
event_inherited();


// [Overwrite] Sets the text to be drawn
/// ? : first queries if the bool in front is true; if it is, the left of the colon will run, otherwise
/// the right will
button_text = global.debug ? "Debug on" : "Debug off"

// Sets the function to toggle debug mode when the button is released
activate_button = function() 
{
	// Sets debug to the opposite of what it currently is
	global.debug = !global.debug
	button_text = global.debug ? "Debug on" : "Debug off"
}