//start path if timer hits 0
if (path_start_timer == 0) {
	path_start(path, 1, path_action_stop, true)
}
if (path_start_timer > -1) path_start_timer -= 1

//run when path is finished and timer not running
if (path_position = 1 and path_start_timer == -1) {
	path_start_timer = route[route_index][1]
	
	route_index += 1
	if (route_index == array_length(route)) route_index = 0
	path_delete_point(path, 0)
	var _path_point = instance_find(route[route_index][0], 0)
	path_add_point(path, _path_point.x, _path_point.y, 1000)
}

//Direction
var _vel_x = pre_pos_x - x
var _vel_y = pre_pos_y - y

//left
if (_vel_x > 0) image_index = 2
//right
else if (_vel_x < 0) image_index = 3
//vert or idle
else {
	//up
	if (_vel_y > 0) image_index = 1
	//down
	else if (_vel_y < 0) image_index = 0
	//idle
	else image_index = 0
}

//Change sprite with
//layer_sprite_change(spr_name, 0)
//for animated sprites
//might need to be checked

pre_pos_x = x
pre_pos_y = y