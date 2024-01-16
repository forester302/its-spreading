// If the mouse is on the right half of this button
if ((mouse_x > (x + 0)) and (mouse_x < (x + (sprite_width / 2) + 1)))
{
	// Set right to true
	mouse_right_side = true;
	mouse_left_side = false;
}
// If the mouse is on the left half of this button
else if ((mouse_x > (x - (sprite_width / 2) - 1)) and (mouse_x < x + 1))
{
	// Set left to true
	mouse_right_side = false;
	mouse_left_side = true;
}
// If the mouse is in the middle of this button
else
{
	// Set both to false
	mouse_right_side = false;
	mouse_left_side = false;
}

// If mouse is hovering and on the right side of the button
if (hovering and mouse_right_side)
{
	// Highlights turn up volume
	image_index = 1;	
}
// If mouse is hovering and on the left side of the button
else if (hovering and mouse_left_side)
{
	// Highlights turn down volume
	image_index = 2;
}
// If mouse is hovering elsewhere
else 
{
	// Sets button to default
	image_index = 0;
}


// Inherit the parent event
event_inherited();