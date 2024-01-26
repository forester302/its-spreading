//
room_x = scr_get_room_info("x");
room_y = scr_get_room_info("y");

//
width_val = room_x;
height_val = room_y;
//
target_width_val = width_val;
target_height_val = height_val;

//
view_enabled = true;
view_visible[0] = true;
//
view_camera[0] = camera_create_view(0, 0, room_x, room_y, 0, -1, -1, -1, 0, 0);

//
need_to_scroll = false;

//
zoom_speed = 1500;


//
cam_x_val = 0;
cam_y_val = 0;

//
mouse_x_val = scr_get_room_info("x") / 2;
mouse_y_val = scr_get_room_info("y") / 2;

//
cam_move_speed = 0.1;	


//
check_mouse = 0;

//
static_mouse_x_val = 0;
static_mouse_y_val = 0;

index = 0;