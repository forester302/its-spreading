// If the image alpha is greater than 1 or less than 0 or equal to eitehr
if ((image_alpha >= 1) or (image_alpha <= 0))
{
	// [Assign] Inverse fade_in_out
	fade_in_out *= -1;
}

// Adds fade_in_out to current image alpha value
image_alpha += fade_in_out;