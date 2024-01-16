// Draws the sprite of this button if the object has a sprite
if (sprite_index > -1)
{
	draw_self();
}


/// Will be removed later
// If the player hovers over the button and the child takes parent settings
if (hovering and parent_settings_sprite)
{
	// Bold the text
	text_font = fnt_default_bold;
}
else if (parent_settings_sprite)
{
	text_font = fnt_default;
}

// Sets the draw text to this font
draw_set_font(text_font);
// Sets the draw text to this color
draw_set_color(text_color);

// Sets the x to be centered with relation to the text
draw_set_halign(fa_center);
// Sets the y to be centered with relation to the text
draw_set_valign(fa_middle);

// Draws the text at the x and y of this button using button_text
draw_text(x, y, button_text);