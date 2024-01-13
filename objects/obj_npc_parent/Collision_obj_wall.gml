// This code runs if this NPC collides with a wall
////////// Make this code arbitrary


// Stops the current path
path_end();

// Moves this NPC down a bit to avoid continuous collision with the wall
////////// Check which side of the NPC collided with a wall
y += 1;

// Says the path is currently completed
path_position = 1;

// Deletes the point of the path that would be in the wall (endpoint)
path_delete_point(path, 1);
// Adds this NPC's current position, using npc_speed, to "path"
path_add_point(path, x, y, npc_speed);