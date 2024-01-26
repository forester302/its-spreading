// If game is paused
if (global.pause_game)
{
    // Only draw self
    draw_self()
}
// Else behave like normal
else
{
    if (infected && (infected_time <= infected_target_time) )
    {
        // every 50 frames
        if (infected_time % 50 == 0)
        {
            // Only works for stations with their origin on top
            // Generate a random point on this station
            var _x = random_range(bbox_left + (sprite_width / 6), bbox_right - (sprite_width / 6));
            var _y = random_range(bbox_top + (sprite_height / 6), bbox_bottom - (sprite_height / 6));
            // Spawn a virus particle at the generated location with a timer of 1 second
            var _virus_object = instance_create_layer(_x, _y, "Particles", obj_infected_particle);
            _virus_object.timer = 60;
        }
        // increment infected time
        infected_time += 1;
    }
    
    if ( (infected_time >= global.base_longevity_station) || (infected_time >= infected_target_time) )
    {
        infected = false;
        infected_time = 0;
    }
}