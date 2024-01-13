//disable sprite animation
image_speed = 0
//init route
if !variable_instance_exists(id, "route") {
	route = [
		[obj_station_1, 0], 
		[obj_station_2, 0],
	]
}
route_index = 0
path_start_timer = -1

//init path
path = path_add()
path_set_closed(path, false)

//set up intial two points
var _path_point = instance_find(route[route_index][0], 0)
path_add_point(path, x, y, 1000)
path_add_point(path, _path_point.x, _path_point.y, 1000)
path_start(path, 1, path_action_stop, true)

//set up for velocity tracking
pre_pos_x = x
pre_pos_y = y