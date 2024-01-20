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
// move down 1 pixel
y += 1