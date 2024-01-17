/// @description Insert description here
// You can write your code in this editor

if ((keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) && !instance_exists(obj_fade)) {
	
	var _target_room = rm_title;
	
	script_execute(scr_fade_to_room, _target_room, 60, c_white);
}










