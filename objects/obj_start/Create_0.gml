// Ensure this code only runs once (should be arbitrary)
if variable_global_exists("initialized") {exit}
	

// Randomizes the seed (aka: what random values are generated) *once* when the game runs
randomize();


// [Initialize] Sets global debug mode to false (off)
global.debug = false;

// [Initialize] Sets global pathfinding mode to false (advanced)
global.pathfinding = false

// [Initialize] Sets global initialized to true (yes)
global.initialized = true


// Sets the settings for advanced pathfinding (hover over function and read)
//mp_potential_settings(45, 5, 1, true)
mp_potential_settings(45, 5, 1, true)


// [Initialize] Sets whether the user pressed escape in rm_game or not to false
global.pause_signal = false;
// [Initialize] Sets whether the user pressed the space bar in rm_game or not to false
global.pause_game_signal = false;
// [Initialize] Sets whether the game should be paused without menu or not to false
global.pause_game = false;


global.cough_ability = 0;


// [Initialize] Sets whether the user tried to skip a room or not to false
global.fade_transition = false;

// [Initialize] Sets whether the user scrolled in or out to none
global.camera_scroll = 0;
// [Initialize] Sets whether the user is trying to move the camera to none
global.camera_move = 0;


// [Initialize] Set global initialized to true (yes)
global.initialized = true