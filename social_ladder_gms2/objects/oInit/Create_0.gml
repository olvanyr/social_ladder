/// @description  init the global var of the game


// add an enum to save the variable

enum save
{
	x,
	y,
	state,
	room
}

enum save_room
{
	seen,
}

#region // Menu manager

global.fullscreen = true;
global.mastervolume = 1;
global.soundsvolume = 1;
global.musicvolume = 1;

#endregion

global.start_room = room0;
global.start_x = 224;
global.start_y = 255;
global.key[0] = "key_door1";

//load audio group
if !audio_group_is_loaded(audiogroup_sound)
{
	audio_group_load(audiogroup_sound);
}
if !audio_group_is_loaded(audiogroup_music)
{
	audio_group_load(audiogroup_music);
}

