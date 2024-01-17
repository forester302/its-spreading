// Inherit the parent event
event_inherited();

// set the determiner to global.pathfinding
get_determiner = function ()
{
	return global.pathfinding
}

// sets the label to advanced pathfinding
label = "Advanced Pathfinding\n"

// [Overwrite] Sets the text to be drawn
button_text = get_text()

// Sets the function to toggle pathfinding mode when the button is released
activate_button = function() 
{
	// Sets pathfinding to the opposite of what it currently is
	global.pathfinding = !global.pathfinding
	// Sets the text to be drawn
	button_text = get_text()
}