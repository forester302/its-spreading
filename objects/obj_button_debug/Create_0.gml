// Inherit the parent event
event_inherited();


// [Overwrite] Sets the text to be drawn
button_text = global.debug ? "Debug on" : "Debug off"

// Sets the function to toggle debug mode when the button is released
activate_button = function() 
{
	global.debug = !global.debug
	button_text = global.debug ? "Debug on" : "Debug off"
}