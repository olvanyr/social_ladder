/// @description  init the global var of the game

random_set_seed(10);

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

enum depth_layer //forlayer depth
{
	effects			=-2000,
	front			=-1500,
	jelly			=-1000, 
	tiles			=-900,
	walls			=-800,
	lava			=-700,
	enemies			=-200,
	ground_effects	=-100,
	player			=0,
	door			=150,
	lifepack		=500,
	grass_back		=550,
	paralax_front	=750, //don't know ho to change theme automaticaly, so this one is fixted
	paralax_back	=800,//don't know ho to change theme automaticaly, so this one is fixted
	back			=830,
	gradiant		=850,
	background		=900,
	enemy_walls		=2000
}

#region // Menu manager

global.fullscreen = true;
global.mastervolume = 1;
global.soundsvolume = 1;
global.musicvolume = 1;

global.slot = 1;
#endregion


global.start_room = rLab_respawn;
global.start_x = 592;
global.start_y = 511;
/*
global.start_room = rLab_mob_test;
global.start_x = 143;
global.start_y = 607;
*/
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
	oSlugII,
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
global.boss_list = 
[
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
	oSlugII,
	//oWrath,
	//oLegs,
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
global.first_music = mRoom0;
global.cutscenes_music = m_Enter___;

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

// keep track of the gamepad or keyboard
global.control = "keyboard";

//array used to keep dore open
global.door[0] = noone;

//array used to save key
global.key[0] = "";

// menu 
global.key_left					= ord("Q");
global.key_right				= ord("D");
global.key_up					= ord("Z");
global.key_down					= ord("S");
global.key_jump					= ord("Z");
global.key_attack				= ord("V");
global.key_slide				= vk_space;
global.key_cast					= ord("I");
global.key_use					= ord("N");
global.key_use_healthpack		= ord("L");
global.key_pause				= ord("P");