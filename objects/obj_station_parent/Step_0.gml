if (infected and infected_time > 0)
{
	// every 50 frames
	if (infected_time % 50 == 0)
	{
		// Only works for stations with their origin on top
		// Generate a random point on this station
		var _x = random_range(bbox_left + (sprite_width / 6), bbox_right - (sprite_width / 6))
		var _y = random_range(bbox_top + (sprite_height / 6), bbox_bottom - (sprite_height / 6))
		// Spawn a virus particle at the generated location with a timer of 1 second
		virus_object = instance_create_layer(_x, _y, "Particles", obj_infected_particle)
		virus_object.timer = 60
	}
	// decrement infected time
	infected_time -= 1
}