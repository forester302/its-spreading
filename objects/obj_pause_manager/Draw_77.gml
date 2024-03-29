// Disables alpha blending, ensuring everything is opaque
/// 1: Keep this disabled
/// 2: Should be abritrary anyways
//gpu_set_blendenable(false);


// If pause is true
if (global.pause)
{
	if (global.pause_game)
	{
		// Sets the surface target for drawing to the previous variable
		surface_set_target(pause_surf);
		// Draws the current application surface on the new surface from (0, 0)
		draw_surface(application_surface, 0, 0);
		// Resets the surface target for future draw commands
		surface_reset_target()
		
		/// This section is here because this code can get wonky in changing to or from fullscreen, 
		/// defocusing, etc., so it just creates a backup of the surface
		// If the variable holds a proper buffer value (ex: skipped when it equals -1)
		if (buffer_exists(pause_surf_buffer))
		{
			// Deletes the contents of the buffer
			buffer_delete(pause_surf_buffer)
		}
		// [Assign] Backs up the resolution of the surface * 4 using memory allocation
		pause_surf_buffer = buffer_create(res_x * res_y * 4, buffer_fixed, 1);
		// Backsup the surface to the buffer
		buffer_get_surface(pause_surf_buffer, pause_surf, 0);
	}
		
	/// This would happen by default, but Post-Draw targets the back buffer ( whatever that is :/ )
	surface_set_target(application_surface)
	
	// If the pause surface exists
	if (surface_exists(pause_surf))
	{
		// Draw it on the current surface at (0, 0)
		draw_surface(pause_surf, 0, 0);
		
		// If the player paused using the escape key
		if (pause_menu)
		{
			// Draws a rectangle covering the whole screen, filled in, black, and alpha 0.5
			draw_set_alpha(0.9);
			draw_set_color(c_black);
			draw_rectangle(0, 0, (res_x - 1), (res_y - 1), false);
			
			// Resets alpha to default
			draw_set_alpha(1.0);
			
			// If pause buttons are not created
			if (!p_buttons_created)
			{
				// [Initialize] Gets the id of the "Instances" layer
				needed_layer = layer_get_id("Instances");
				// [Initialize] Create an instance of the buttons on the "Instances" layer in the center of 
				//				the screen
				p_resume_button = instance_create_layer((res_x / 2), ((res_y / 2) - 50), needed_layer,
										obj_button_p_resume);
				p_volume_button = instance_create_layer((res_x / 2), (res_y / 2), needed_layer,
										obj_button_p_volume);
				p_menu_button = instance_create_layer((res_x / 2), (res_y / 2 + 50), needed_layer,
										obj_button_p_menu);
				p_quit_button = instance_create_layer((res_x / 2), ((res_y / 2) + 100), needed_layer,
										obj_button_p_quit);
				// [Assign] Pause buttons are now created
				p_buttons_created = true;
			}
		}
	}
	/// Called if the surface was lost for some reason
	else
	{
		// [Assign] Sets to the same-sized surface
		pause_surf = surface_create(res_x, res_y);
		// Sets the surface to the pause surface from the buffer
		buffer_set_surface(pause_surf_buffer, pause_surf, 0);
	}
	
	// Resets the target surface for future draw commands
	surface_reset_target();
}

// If the player pauses while in rm_game
if (global.pause_signal || global.pause_game_signal)
{
	// If pause is false (if the game is not paused)
	if (!global.pause)
	{
		// [Assign] Sets to true
		global.pause = true
		// [Assign] Depending on how the player paused, set to true one of the variables
		if (global.pause_signal)
		{
			pause_menu = true;
			double_pause = false;
		}
		else if (global.pause_game_signal) {global.pause_game = true;}
		
		
		// [Assign] Sets to a new surface with the same height and width as the current surface
		pause_surf = surface_create(res_x, res_y);
		// Sets the surface target for drawing to the previous variable
		surface_set_target(pause_surf);
		// Draws the current application surface on the new surface from (0, 0)
		draw_surface(application_surface, 0, 0);
		// Resets the surface target for future draw commands
		surface_reset_target()
		
		/// This section is here because this code can get wonky in changing to or from fullscreen, 
		/// defocusing, etc., so it just creates a backup of the surface
		// If the variable holds a proper buffer value (ex: skipped when it equals -1)
		if (buffer_exists(pause_surf_buffer))
		{
			// Deletes the contents of the buffer
			buffer_delete(pause_surf_buffer)
		}
		// [Assign] Backs up the resolution of the surface * 4 using memory allocation
		pause_surf_buffer = buffer_create(res_x * res_y * 4, buffer_fixed, 1);
		// Backsup the surface to the buffer
		buffer_get_surface(pause_surf_buffer, pause_surf, 0);
		
		
		// If on the pause menu (escape key)
		if (pause_menu)
		{
			// Deactivates all instances except this one
			instance_deactivate_all(true);
			// Reactivates the needed instances
			instance_activate_object(obj_input_manager);
			instance_activate_object(obj_pause_manager);
			instance_activate_object(obj_sound_manager);
			instance_activate_object(obj_fade_controller);
			instance_activate_object(obj_fade);
			instance_activate_object(obj_camera_manager);
			instance_activate_object(obj_button_p_parent);
		}
		// Else if just paused (space bar)
		else if (global.pause_game)
		{
			// Some instances are deactivated, some are modified directly, others are not
			// obj_station_parent
			// obj_infected_particle
		}
	}
	// If the player paused with escape key or (space bar and without menu)
	else if ( global.pause_signal || (global.pause_game_signal && global.pause_game) )
	{		
		// Activates all instances
		instance_activate_all();
		
		// If the game was paused using the escape key
		if (pause_menu)
		{
			// Destroys pause buttons and sets pause buttons created to false
			instance_destroy(p_quit_button.object_index);
			instance_destroy(p_menu_button.object_index);
			instance_destroy(p_volume_button.object_index);
			instance_destroy(p_resume_button.object_index);
			p_buttons_created = false;
		}
		
		/// Frees the surface from memory
		if (surface_exists(pause_surf))
		{
			surface_free(pause_surf);
		}
		
		/// Frees the buffer from memory
		if (buffer_exists(pause_surf_buffer))
		{
			buffer_delete(pause_surf_buffer);
		}
		
		// [Assign] Sets to true
		global.pause = false;
		// [Assign] If game was paused using escape key, sets to true
		if (global.pause_signal && global.pause_game) {double_pause = true;}
		// [Assign] Sets to false
		pause_menu = false;
		// [Assign] Sets to false
		global.pause_game = false;
	}
	
	// Resets the pause signals (only pause_signal if double_pause is false)
	if (global.pause_signal && !double_pause) {global.pause_signal = !global.pause_signal;}
	else if (global.pause_game_signal) {global.pause_game_signal = !global.pause_game_signal;}
}