// Inherit the parent event
event_inherited();

// function run if the menu is open
draw_function = function ()
{
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
	draw_text(x, y,
	string("Spreadability: {0}\n", global.spreadability) +
	string("Longevity:      {0}\n", global.longevity) +
	string("Detectability:  {0}\n", global.detectability)
	)
}