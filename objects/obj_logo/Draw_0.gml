// [Initialize] Sets to draw the video on this object
var _video_data = video_draw();

// [Initialize] Sets to the status of the video (0 means no errors)
var _video_status = _video_data[0];
// If the video is good to go
if (_video_status == 0)
{
	// Begins to play the video in the center of the room
	draw_surface(_video_data[1], ((room_width / 2) - (sprite_width / 2)), 
					((room_height / 2) - ((sprite_height) / 2)));
}