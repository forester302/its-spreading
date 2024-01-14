if (path_start_timer == (global.pathfinding ? 0 : -1))
{
	if (!global.pathfinding) 
	{
		mp_potential_step(target_x, target_y, 10, false)
	}
	else {
		path_start(path, 10, path_action_stop, true)
		path_completed = false
	}
}

if (path_start_timer > -1) path_start_timer -= 1
if (global.pathfinding and path_position == 1) path_completed = true
if (!global.pathfinding and floor(target_x) == floor(x) and floor(target_y) == floor(y)) path_completed = true

if (path_completed and path_start_timer == -1)
{
	// [Declare] 1 = station, 0 = random location
	var _path_type;
	// [Initialize] Generates a random number b/w 0 and 9 (inclusive)
	var _rand_num_1 = random_range(0, 9)

	// If the random number is less than 6, set the path type to 1
	if (_rand_num_1 < 7) {_path_type = 1;}
	// Else, set the path type to 0
	else {_path_type = 0}
	
	// If the path type is equal to 0
	if (_path_type = 0)
	{
		// Set the position of the path point to inside a wall
		var _path_point_x = instance_find(obj_wall, 0).x
		var _path_point_y = instance_find(obj_wall, 0).y
		
		// While the path point is invalid (in a wall or station or too close to current NPC position)
		while (true)
		{
			if (place_meeting(_path_point_x, _path_point_y, obj_wall) or
				place_meeting(_path_point_x, _path_point_y, obj_station_parent) or
				(abs(_path_point_x - x) < 200 and abs(_path_point_y - y) < 200))
			{
				// [Assign] Generate random x and y values within rm_game
				_path_point_x = random_range(0, room_width - 1);
				_path_point_y = random_range(0, room_height - 1);
			}
			// If the path point is valid, break (discontinue) the looop
			else break
		}
		
		// Add the point to "path" using "npc_speed"
		target_x = _path_point_x;
		target_y = _path_point_y;
	}
	// If the path type is not equal to 0
	else
	{
		// [Initialize] Generates a random number b/w 0 and the number of stations
		var _rand_station_num = random_range(0, instance_number(obj_station_parent));
		// [Initialize] Gets the station that was picked by the random number
		var _chosen_station = instance_find(obj_station_parent, _rand_station_num);
		
		// Loops while this NPC is at the chosen station
		while (_chosen_station.x == x and _chosen_station.y == y)
		{
			// Look literally ~5 lines above this
			_rand_station_num = random_range(0, instance_number(obj_station_parent));
			_chosen_station = instance_find(obj_station_parent, _rand_station_num);
		}
		
		// target the station
		target_x = _chosen_station.x;
		target_y = _chosen_station.y;
	}
	
	// Sets the timer to 60 (frames)
	path_start_timer = 60;
	path_completed = false
	
	if (global.pathfinding)
	{
		var _factor = 4
		mp_potential_path(path, target_x, target_y, npc_speed, _factor, false)
	}
}

// Deals with the animation and sprite changes of this NPC

// [Initialize] Reads if the x is negative or positive (horizontal direction the NPC is moving)
var _vel_x = pre_pos_x - x
// [Initialize] Reads if the y is negative or positive (vertical direction the NPC is moving)
var _vel_y = pre_pos_y - y

// If the x velocity is positive, sets the NPC's sprite to face left
if (_vel_x > 0) image_index = 2
// If the x velocity is negative, sets the NPC's sprite to face right
else if (_vel_x < 0) image_index = 3
// If the x velocity is zero
else {
	// If the y velocity is positive, sets the NPC's sprite to face up
	if (_vel_y > 0) image_index = 1
	// If the y velocity is negative, sets the NPC's sprite to face down
	else if (_vel_y < 0) image_index = 0
	// If the y velocity is zero, sets the NPC's sprite to face down (idle)
	else image_index = 0
}

//// For Forester
//Change sprite with
//layer_sprite_change(spr_name, 0)
//for animated sprites
//might need to be checked

// [Assign] Sets the previous x to the current x
pre_pos_x = x
// [Assign] Sets the previous y to the current y
pre_pos_y = y