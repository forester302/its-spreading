// Ensure this code only runs once (should be arbitrary)
if variable_global_exists("initialized")
{
	return
}


// Randomizes the seed (aka: what random values are generated) *once* when the game runs
randomize();

// [Initialize] Sets global debug mode to false (off)
global.debug = false

// [Initialize] Sets global pathfinding mode to false (advanced)
global.pathfinding = false

// [Initialize] Sets global initialized to true (yes)
global.initialized = true

// [Initialize] Sets the infection time to 60 frames (1 second)
global.infection_time = 60


// Sets the settings for advanced pathfinding (hover over function and read)
//mp_potential_settings(45, 5, 1, true)
mp_potential_settings(45, 5, 1, true)