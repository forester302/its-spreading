// [Initialize] Sets to the first parameter (room)
var _room = argument[0];
// [Initialize] Sets to the second paramater (duration)
var _dur = argument[1];
// [Initialize] Sets to the third paramater (color)
var _color = argument[2];

// [Initialize] Sets to a created obj_fade at (0,0)
var _inst = instance_create_depth(0, 0, 0, obj_fade);

// While obj_fade is running
with (_inst)
{
	// [Assign] Sets local variable to _room
	_target_room = _room;
	// [Assign] Sets local variable to _dur
	duration = _dur;
	// [Assign] Sets local variable to _color
	color = _color;
}