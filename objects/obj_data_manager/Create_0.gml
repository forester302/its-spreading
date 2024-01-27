// Spreadability level shown to the player
global.spreadability = 1;
// Radius the virus can spread from an npc
global.base_infection_radius = 20;
// 
global.infection_chance_needed = 99;


// Longevity level shown to the player
global.longevity = 1;

// How long the virus lasts in an NPC
global.base_longevity_npc = 1;
// How long the virus lasts on a station
global.base_longevity_station = 600;



// Detectability level shown to the player
global.detectability = 0;

global.won = false

function win() {
	var _object_count = instance_number(obj_npc_parent)
	for (var _i = 0; _i < _object_count; _i++)
	{
		var _instance = instance_find(obj_npc_parent, _i)
		if _instance.infected_level = 0 {
			return
		}
	}
	global.won = true
	
}

global.experience = 0;
