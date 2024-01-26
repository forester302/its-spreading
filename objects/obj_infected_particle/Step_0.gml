// If game is paused
if (global.pause_game)
{
	//Only freezes and draws self
	image_speed = 0;
	draw_self();
}
// Else behave like normal
else
{
	// Sets image speed to default
	image_speed = 1;
	
	// ten frames before the end start fading out the particle
	if timer < 10
	{
		image_alpha -= 0.1
	}
	// when timer hits 0 destory the particle
	if timer == 0
	{
		instance_destroy(self)
	}
	// decrement the timer
	timer -= 1
	
	// moves around randomly by 1/2 pixel each frame
	y += random_range(-1, 1);
	x += random_range(-1, 1);
}