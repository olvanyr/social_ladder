///@description ChangeVolume
///@arg value

var type = menu_option[page];

switch(type)
{
	case 0: audio_master_gain(global.mastervolume); break
	case 1: audio_group_set_gain(audiogroup_sound,global.soundsvolume,0); break
	case 2: audio_group_set_gain(audiogroup_music,global.musicvolume,0); break

}