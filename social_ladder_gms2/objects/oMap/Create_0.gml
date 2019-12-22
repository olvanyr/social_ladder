// some constante
down_up_sound = aDown_up_menu;
inputting_sound = aInputting_menu;
pause = false;
tab = 0;
save_setting = false;
move_speed = 2;
h_move = 0;
v_move = 0;

c_background = c_gray;

is_gamepad_active = gamepad_is_connected(0);

enum pause_tab
{
	map,
	key,
	settings,
	height
}

load_settings();
//creat the "pages" of the menu and store them into ds_grid
enum menu_pause_page
{
	settings,
	audio,
	controls,
	controls_keyboard,
	height //so I now how many number of ellement I have
}

ds_menu_settings = create_menu_page(
	["FULLSCREEN",			menu_element.toggle,		change_window_mode,		global.fullscreen,		["ON", "OFF"]],  
	["CONTROLS",			menu_element.page_transfer,	menu_pause_page.controls], 
	["CONTROLS KEYBOARD",	menu_element.page_transfer,	menu_pause_page.controls_keyboard], 
	["AUDIO",				menu_element.page_transfer,	menu_pause_page.audio],
	["EXIT GAME",			menu_element.script_runner,	exit_game]
);

ds_menu_audio = create_menu_page(
	["MASTER",		menu_element.slider,		change_volume,			"mastervolume",				global.mastervolume,		[0,1]],
	["SOUNDS",		menu_element.slider,		change_volume,			"soundsvolume",				global.soundsvolume,		[0,1]],
	["MUSIC",		menu_element.slider,		change_volume,			"musicvolume",				global.musicvolume,			[0,1]],
	["BACK",		menu_element.page_transfer,	menu_pause_page.settings],
);
ds_menu_controls = create_menu_page(
	["BACK",		menu_element.page_transfer,	menu_pause_page.settings],
);

ds_menu_controls_keyboard = create_menu_page(
	["UP",				menu_element.input,			"key_up",				global.key_up],
	["LEFT",			menu_element.input,			"key_left",				global.key_left],
	["RIGHT",			menu_element.input,			"key_right",			global.key_right],
	["DOWN",			menu_element.input,			"key_down",				global.key_down],
	["JUMP",			menu_element.input,			"key_jump",				global.key_jump],
	["ATTACK",			menu_element.input,			"key_attack",			global.key_attack],
	["SLIDE",			menu_element.input,			"key_slide",			global.key_slide],
	["CAST",			menu_element.input,			"key_cast",				global.key_cast],
	["USE",				menu_element.input,			"key_use",				global.key_use],
	["USE HEALTHPACK",	menu_element.input,			"key_use_healthpack",	global.key_use_healthpack],
	["PAUSE",			menu_element.input,			"key_pause",			global.key_pause],
	
	["BACK",			menu_element.page_transfer,	menu_pause_page.settings],
);

page = 0;
menu_pages = [ds_menu_settings, ds_menu_audio, ds_menu_controls, ds_menu_controls_keyboard];

var i = 0, array_len = array_length_1d(menu_pages);

repeat(array_len)
{
	menu_option[i] = 0;
	i++;
}

inputting = false;


