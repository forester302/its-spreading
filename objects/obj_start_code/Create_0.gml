// Ensure this code only runs once (should be arbitrary)
if variable_global_exists("initialized") return

// Randomizes the seed (aka: what random values are generated) *once* when the game runs
randomize();

// [Initialize] Set global debug mode to false (off)
global.debug = false

// [Initialize] Set global initialized to true (yes)
global.initialized = true


// [Initialize] Sets the infection time to 60 frames (1 second)
global.infection_time = 60