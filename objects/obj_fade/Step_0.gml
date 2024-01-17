// If state is 0
if (state == 0) 
{
	// Increment the timer by one
	timer++;
	
	// If the timer is greater than or equal to the duration
	if (timer >= duration) 
	{
		// Go to the target room
		room_goto(target_room);
		// Set state to 1
		state = 1;
	}
}
// If state is 1
else if (state == 1)
{
	// Decrements the timer by one
	timer--;
	
	// If the timer is less than or equal to 0
	if (timer <= 0) 
	{
		// Destroy the instance of this object
		instance_destroy();
	}
}

// [Assign] Sets alpha to the timer divided by the duration
alpha = timer / duration;











