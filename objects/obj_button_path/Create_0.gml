// Inherit the parent event
event_inherited();


// [Overwrite] Sets the text to be drawn
/// ? : first queries if the bool in front is true; if it is, the left of the colon will run, otherwise
/// the right will
button_text = global.pathfinding ? "Advanced Pathfinding \non" : " Advanced Pathfinding \noff"

// Sets the function to toggle debug mode when the button is released
activate_button = function() 
{
	// Set's debug to the opposite of what it currently is
	global.pathfinding = !global.pathfinding
	button_text = global.pathfinding ? " Advanced Pathfinding \non" : " Advanced Pathfinding \noff"
}