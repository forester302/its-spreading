// If the timer is equal to zero
if (path_start_timer == 0) 
{
	// Starts "path" at a speed of 1, tells it to stop the path once it's completed, and to 
	// start absolutely from the start point and move to the end point
	path_start(path, 1, path_action_stop, true)
}

// If the timer is greater than -1, subtract 1
/// Must be after 'timer == 0' or else it will be one game frame short
if (path_start_timer > -1) path_start_timer -= 1

// If the path is completed and the timer equals -1 (not running)
if (path_position == 1 and path_start_timer == -1)
{
	// While the number of points in "path" is greater than 1
	while (path_get_length(path) > 1)
	{
		// Deletes the first point
		path_delete_point(path, 0)
	}
	
	
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
		path_add_point(path, _path_point_x, _path_point_y, npc_speed)
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
		
		// Add the point to "path" using "npc_speed"
		path_add_point(path, _chosen_station.x, _chosen_station.y, npc_speed);
	}
	
	// Sets the timer to 60 (frames)
	path_start_timer = 60;
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


//Infection

// [Assign] can this NPC be infected this game step
var _infectable = false;

//Loop through NPC instances
for (var _i = 0; _i < instance_number(obj_npc_parent); _i++)
{
	// Get the instance of the NPC
	var _npc_instance = instance_find(obj_npc_parent, _i);
	
	// Skip this NPC
	if (_npc_instance.id = id) continue;
	
	//Calculate distance
	var _distance = point_distance(x, y, _npc_instance.x, _npc_instance.y);
	
	// Work out if can be infected
	var _can_infect = _npc_instance.infected_level > 0 && infected_level == 0;
	// Work out if in range to infect
	var _within_range = _distance <= 100;
	
	if (_can_infect and _within_range)
	{
		// Increment timer
		infected_timer += 1;
		// Can be infected this game frame
		_infectable = true;
	}
}
if (_infectable and infected_timer > global.infection_time)
{
	infected_level = 1;
}
else if (!_infectable)
{
	infected_timer = 0;
}