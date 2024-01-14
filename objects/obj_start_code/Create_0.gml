// Ensure this code only runs once (should be arbitrary)
if variable_global_exists("initialized") return

// Randomizes the seed (aka: what random values are generated) *once* when the game runs
randomize();

// [Assign] Set global debug mode to false (off)
global.debug = false

// [Assign] Set global initialized to true (yes)
global.initialized = true