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
	enemy
}

enum priority //for audio purpose
{
	very_low,
	low,
	normal,
	high,
	realy_high
}

#region // Menu manager

global.fullscreen = true;
global.mastervolume = 1;
global.soundsvolume = 1;
global.musicvolume = 1;

global.slot = 1;
#endregion

global.start_room = room0;
global.start_x = 224;
global.start_y = 255;

//load audio group
if !audio_group_is_loaded(audiogroup_sound)
{
	audio_group_load(audiogroup_sound);
}
if !audio_group_is_loaded(audiogroup_music)
{
	audio_group_load(audiogroup_music);
}

global.enemy_list = 
[
	oFist,
	oSword,
	oSwordII,
	oRunner,
	oRunnerII,
	oMimic,
	oSlug,
	oWrath,
	oLegs,
	oFlying,
	oScratcher,
	oDistance,
	oSpider,
	oMaggie,
	oJelly,
	oDeer,
	oSquare,
	oSkeleton
]

global.knockbackable = 
[
	oPlayer,
	oFist,
	oSword,
	oSwordII,
	oRunner,
	oRunnerII,
	oMimic,
	oSlug,
	oWrath,
	oLegs,
	oFlying,
	oScratcher,
	oDistance,
	oSpider
]


//save var
global.save = ds_map_create();

// Time var
global.play_time = 0;
global.date = 0;

//music variable
global.current_music = 0;
global.new_music = 0;

//experience var 
	global.experience = 0;

	// spec variable!!!! !!!!! !!!!! actualy wall jump Have to be unlock befor double jump !!!!!!!
	global.wall_jump = false;
	global.double_jump = false;
	global.cast = false;


// addaptative difficulty
global.difficulty = 1;

//array used to keep dore open
global.door[0] = noone;
global.key[0] = "key_door1";