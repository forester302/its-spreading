// If paused, skip all this code
if (global.pause_game) {return}
// Else behave like normal
else
{
	// If pathfinding is simple and when the timer hits 0
	if (global.pathfinding and path_start_timer == 0)
	{
		// Starts path, at 10 speed, sets to absolute, and stops when completed
		path_start(path, npc_speed, path_action_stop, true);
		// [Assign] Sets to path is incomplete
		path_completed = false;
	}
	// Else if pathfinding is advanced and when the timer hits -1
	else if (!global.pathfinding and path_start_timer == -1) 
	{	
		// Takes a step (10 pixels) towards the target avoiding solid instances
		mp_potential_step(target_x, target_y, npc_speed, false);
		path_completed = false
	}
	
	
	// If the timer is running, decrements the timer by one
	if (path_start_timer > -1) {path_start_timer -= 1};
	// If pathfinding is simple and the path is finished, sets path is finished to true
	if (global.pathfinding and path_position == 1) {path_completed = true};
	// If pathfinding is advanced and the NPC is at the target
	show_debug_message(floor(target_x))
	show_debug_message(floor(target_y))
	show_debug_message(floor(x))
	show_debug_message(floor(y))
	if ( (!global.pathfinding) and 
		( ( (floor(target_x) + sprite_width) > floor(x) ) and (floor(x) > (floor(target_x) - sprite_width) ) ) and
		( ( (floor(target_y) + (sprite_height / 10) ) > floor(y) and (floor(y) > (floor(target_y) - (sprite_height / 10) ) ) ) ) )
	{
		show_debug_message("here")
		// Sets path is finished to true
		path_completed = true;
	}
	
	// If path is completed and the timer is not running
	if (path_completed and (path_start_timer == -1))
	{
		// [Declare] 1 = station, 0 = random location
		var _path_type;
		// [Initialize] Generates a random number b/w 0 and 9 (inclusive)
		var _rand_num_1 = random_range(0, 9);
	
		// If the random number is less than 6, set the path type to 1
		if (_rand_num_1 < 7) {_path_type = 1;}
		// Else, set the path type to 0
		else {_path_type = 0}
		
		// If the path type is equal to 0
		if (_path_type == 0)
		{
			// Set the position of the path point to inside a wall
			var _path_point_x = instance_find(obj_wall, 0).x;
			var _path_point_y = instance_find(obj_wall, 0).y;
			
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
			
			// Set the target position
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
			
			// Set the target position
			target_x = _chosen_station.x;
			target_y = _chosen_station.y;
		}
		
		// Sets the timer to 60 (frames)
		path_start_timer = 60;
		// Sets the path to not be completed
		path_completed = false
		
		/// Not sure what's going on here (checking for simple, modifying advanced???)
		// If pathfinding is simple
		if (global.pathfinding)
		{
			// The path can be up to 4 times longer than a straight line to the target
			var _factor = 4;
			// Calculates the path to the target
			mp_potential_path(path, target_x, target_y, npc_speed, _factor, false);
		}
	}
	
	
	// Infection of this NPC
	
	// [Initializing] Sets whether this NPC can be infected this frame to false
	var _infectable = false;
	
	// Loop through instances of NPCs
	/// Initializes _i to 0, runs as long as _i is less than the number of NPCs, and adds one to _i each time 
	/// the loop runs
	for (var _i = 0; _i < instance_number(obj_npc_parent); _i++)
	{
		// [Initialize] Sets the instance of the NPC
		var _npc_instance = instance_find(obj_npc_parent, _i);
		// Skips this NPC
		/// Checks if the id of the grabbed NPC is the same as the id of the NPC this code runs on
		if (_npc_instance.id == id) continue;
		
		// [Initialize] Sets the calculated distance between the current NPC and grabbed NPC
		var _distance = point_distance(x, y, _npc_instance.x, _npc_instance.y);
		
		// [Initialize] Sets if this NPC can be infected
		/// Checks if the grabbed NPC is infected and if this NPC isn't
		var _can_infect = (_npc_instance.infected_level > 0) and (infected_level == 0);
		// [Initialize] Sets if this NPC is in range of the other to be infected
		var _infection_radius = global.base_infection_radius + npc_infection_radius
		var _within_range = (_distance <= _infection_radius);
		
		// If the grabbed NPC can infect this and if this NPC is within range
		if (_can_infect and _within_range)
		{
			// Increments timer by one frame
			infected_timer += 1;
			// [Assign] Sets if this NPC can be infected this game frame
			_infectable = true;
		}
	}
	
	// If this NPC is infectable and it's been (infection_time) frames
	if (_infectable and (infected_timer > global.infection_time))
	{
		// [Assign] Sets the infected level of this NPC to 1
		infected_level = 1;
	}
	// If this NPC is not infectable
	else if (!_infectable)
	{
		// [Assign] Reset the timer
		infected_timer = 0;
	}
	
	if (infected_level > 0) 
	{
		self_infected_timer += 1
	}
	if (self_infected_timer >= global.base_longevity_npc + npc_health_level)
	{
		self_infected_timer = 0
		infected_level -= 1
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