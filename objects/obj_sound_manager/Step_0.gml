/// This will need a major upgrade later or specify this object to be for songs
// Checks the current room
switch room
{
	// If the room is rm_menu
	case rm_title:
		// Stop all audio
		audio_stop_all();
		
	// If the room is rm_game	
	case rm_game:
		// If the current song is not the game theme, stop all audio
		if (current_song != snd_temp_theme) {audio_stop_all()}
		// Play the game theme at song_volume, in channel 0, loop it
		audio_play_sound(snd_temp_theme, 0, true, global.song_volume);
		// Set to game theme
		current_song = snd_temp_theme;
}

// Sets the volume of the currently playing song
audio_sound_gain(current_song, global.song_volume, 0);