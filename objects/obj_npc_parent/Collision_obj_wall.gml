// This code runs if this NPC collides with a wall
////////// Make this code arbitrary


// Stops the current path
path_end();

// Moves this NPC down a bit to avoid continuous collision with the wall
////////// Check which side of the NPC collided with a wall
y += 1;

// Says the path is currently completed
path_completed = true;