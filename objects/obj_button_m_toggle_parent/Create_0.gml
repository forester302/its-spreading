// Gets the text that this button will show
function get_text()
{
	return label + (get_determiner() ? "on" : "off")
}

// Determines whether this button is on or off
// Overwrite in children
get_determiner = function ()
{
	return false
}

// The label for the button
// Overwrite in children
label = ""

// Inherit the parent event
event_inherited();

