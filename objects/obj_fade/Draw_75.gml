// [Initialize] Sets to the width of the player's display
var _gui_width = display_get_gui_width();
// [Initialize] Sets to the height of the player's display
var _gui_height = display_get_gui_height();

// Sets the alpha to alpha
draw_set_alpha(alpha);
// Sets the color to color
draw_set_color(color);

// Draws a filled rectangle at 0, 0, using gui variables for size
draw_rectangle(0, 0, _gui_width, _gui_height, 0);

// Resets alpha back to one
draw_set_alpha(1);
// Resets color back to white
draw_set_color(c_white);












