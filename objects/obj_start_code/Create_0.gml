//Only run this code once
if variable_global_exists("initialized") return

// Randomizes the seed (aka: what random values are generated) *once* when the game runs
randomize();

// [Assign] Set global debug mode (off)
global.debug = false

// [Assign] Set global initialized (yes)
global.initialized = true