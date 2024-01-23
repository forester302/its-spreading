//
if (global.camera_scroll != 0)
{	
	//
	if (global.camera_scroll == 1)
	{
		//
		if (target_width_val > 1031 and target_height_val > 580)
		{
			// 
			target_width_val = width_val - (zoom_speed / 9);
			target_height_val = height_val - (zoom_speed / 16);
		}
	}
	//
	else if (global.camera_scroll == -1)
	{
		//
		if (target_width_val < 1920 and target_height_val < 1080)
		{
			//
			target_width_val = width_val + (zoom_speed / 9);
			target_height_val = height_val + (zoom_speed / 16);
		}
	}
	
//	//
//	pos_to_zoom_x_ratio = (mouse_x - cam_x_val) / (width_val - mouse_x);
//	pos_to_zoom_y_ratio = (mouse_y - cam_y_val) / (height_val - mouse_y);
//	//
//	if (pos_to_zoom_x_ratio <= 1) {pos_to_zoom_x_ratio = cam_move_speed / pos_to_zoom_x_ratio}
//	else {pos_to_zoom_x_ratio *= zoom_speed}
//	if (pos_to_zoom_y_ratio <= 1) {pos_to_zoom_y_ratio = cam_move_speed / pos_to_zoom_x_ratio}
//	else {pos_to_zoom_y_ratio *= zoom_speed}
	
	//
	need_to_scroll = true;
}

//
if (need_to_scroll)
{
	//
	if ( (width_val > target_width_val) && (height_val > target_height_val) )
	{
		//
		width_val -= (zoom_speed / 90);
		height_val -= (zoom_speed / 160);
		
		//	//
		//	cam_x_val += (zoom_speed / 90) * pos_to_zoom_y_ratio;
		//	cam_y_val += (zoom_speed / 160) * pos_to_zoom_x_ratio;
	}
	//
	else if ( (width_val < target_width_val) && (height_val < target_height_val) )
	{
		//
		width_val += zoom_speed / 90;
		height_val += zoom_speed / 160;
			
		//	//
		//	cam_x_val -= zoom_speed / 45//90;
		//	cam_y_val -= zoom_speed / 80//160;
	}
	//
	else {need_to_scroll = false}
	
	//
	camera_set_view_size(view_camera[0], width_val, height_val);
	
	//
	cam_x_val = clamp(cam_x_val, 0, room_x - width_val);
	cam_y_val = clamp(cam_y_val, 0, room_y - height_val);
	
	//
	camera_set_view_pos(view_camera[0], cam_x_val, cam_y_val);
}


//
global.camera_scroll = 0;


//
if (global.camera_move > 0)
{
	//
	if (global.camera_move == 1)
	{
		//
		mouse_x_val = mouse_x;
		mouse_y_val = mouse_y;
	}
	//
	else if (global.camera_move > 1)
	{
		//
		cam_x_val += (mouse_x_val - mouse_x) * cam_move_speed;
		cam_y_val += (mouse_y_val - mouse_y) * cam_move_speed;
		//
		cam_x_val = clamp(cam_x_val, 0, room_x - width_val);
		cam_y_val = clamp(cam_y_val, 0, room_y - height_val);
		
		//
		camera_set_view_pos(view_camera[0], cam_x_val, cam_y_val);
	}
}