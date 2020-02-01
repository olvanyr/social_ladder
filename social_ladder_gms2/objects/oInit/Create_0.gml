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
global.first_music = mrLab;
global.cutscenes_music = m_Enter___;

global.current_music = 0;
global.new_music = 0;

//experience var 
	global.total_experience = 100;
	global.experience = 0;
	
	// xp needed for trhe skill
	global.xp_wall_jump = 2;
	global.xp_double_jump = 4;
	global.xp_cast = 6;
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



///grass 
global.grass[12] = sGrass12;
global.grass[11] = sGrass11;
global.grass[10] = sGrass10;
global.grass[9] = sGrass09;
global.grass[8] = sGrass08;
global.grass[7] = sGrass07;
global.grass[6] = sGrass06;
global.grass[5] = sGrass05;
global.grass[4] = sGrass04;
global.grass[3] = sGrass03;
global.grass[2] = sGrass02;
global.grass[1] = sGrass01;

global.forest_grass[40] = sGrass12;
global.forest_grass[39] = sGrass11;
global.forest_grass[38] = sGrass10;
global.forest_grass[37] = sGrass09;
global.forest_grass[36] = sGrass08;
global.forest_grass[35] = sGrass07;
global.forest_grass[34] = sGrass06;
global.forest_grass[33] = sGrass05;
global.forest_grass[32] = sGrass04;
global.forest_grass[31] = sGrass03;
global.forest_grass[30] = sGrass02;
global.forest_grass[29] = sGrass01;
global.forest_grass[28] = sGrass_foreste_14;
global.forest_grass[27] = sGrass_foreste_16;
global.forest_grass[26] = sGrass_foreste_15;
global.forest_grass[25] = sGrass_foreste_14;
global.forest_grass[24] = sGrass_foreste_13;
global.forest_grass[23] = sGrass_foreste_12;
global.forest_grass[22] = sGrass_foreste_11;
global.forest_grass[21] = sGrass_foreste_10;
global.forest_grass[20] = sGrass_foreste_09;
global.forest_grass[19] = sGrass_foreste_08;
global.forest_grass[18] = sGrass_foreste_07;
global.forest_grass[17] = sGrass_foreste_06;
global.forest_grass[16] = sGrass_foreste_05;
global.forest_grass[15] = sGrass_foreste_03;
global.forest_grass[14] = sGrass_foreste_02;
global.forest_grass[13] = sGrass_foreste_14;
global.forest_grass[12] = sGrass12;
global.forest_grass[11] = sGrass11;
global.forest_grass[10] = sGrass10;
global.forest_grass[9] = sGrass09;
global.forest_grass[8] = sGrass08;
global.forest_grass[7] = sGrass07;
global.forest_grass[6] = sGrass06;
global.forest_grass[5] = sGrass05;
global.forest_grass[4] = sGrass04;
global.forest_grass[3] = sGrass03;
global.forest_grass[2] = sGrass02;
global.forest_grass[1] = sGrass01;