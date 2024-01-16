// If mouse is hovering and on the right side of the button
if (hovering and mouse_right_side)
{
	// Bold the text
	text_font = fnt_default_bold;
	// Highlights turn up volume
	image_index = 1;	
}
// If mouse is hovering and on the left side of the button
else if (hovering and mouse_left_side)
{
	// Bold the text
	text_font = fnt_default_bold;
	// Highlights turn down volume
	image_index = 2;
}
// If mouse is hovering elsewhere
else 
{
	// Set font to default
	text_font = fnt_default;
	// Sets button to default
	image_index = 0;
}


// Inherit the parent event
event_inherited();