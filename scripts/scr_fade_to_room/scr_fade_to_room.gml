
var _room = argument[0];
var _dur = argument[1];
var _color = argument[2];

var _inst = instance_create_depth(0, 0, 0, obj_fade);

with (_inst) {
	targetRoom = _room;
	duration = _dur;
	color = _color;
}