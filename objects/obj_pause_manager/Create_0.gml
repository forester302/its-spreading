// [Initialize] Sets whether the game is paused or not to false
global.pause = false;
// [Initialize] Sets whether the game should be on menu or not to false
pause_menu = false;
// [Initialize] Sets whether the game should be paused without menu or not to false
pause_game = false;
// [Initialize] Sets whether the game should move to menu if already paused to false
double_pause = false;
// [Initialize] Sets pause surface (kinda it's id) to none
pause_surf = -1;
// [Initialize] Sets buffer value to none
pause_surf_buffer = -1;

// [Initialize] Sets to buttons aren't created
p_buttons_created = false;


// [Initialize] Each variable is set to the room's corresponding value
res_x = scr_get_room_info("x");
res_y = scr_get_room_info("y");