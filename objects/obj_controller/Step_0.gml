/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_space) && !instance_exists(obj_fade)) {
	
	var _targetRoom = rm_title;
	
	if (room == rm_title) _targetRoom = rm_game;
	
	scr_fade_to_room (_targetRoom, 60, c_white);
}










