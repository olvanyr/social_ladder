

// some constante
down_up_sound = aDown_up_menu;
inputting_sound = aInputting_menu;
pause = true;
tab = 0;
save_setting = false;


enum pause_tab
{
	map,
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
	slots,
	height //so I now how many number of ellement I have
}

ds_menu_settings = create_menu_page(
	["FULLSCREEN",	menu_element.toggle,		change_window_mode,		global.fullscreen,		["ON", "OFF"]],  
	["CONTROLS",	menu_element.page_transfer,	menu_pause_page.controls], 
	["AUDIO",		menu_element.page_transfer,	menu_pause_page.audio],
	["EXIT GAME",		menu_element.script_runner,	exit_game]
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

//I don't know why, but if I don't have a final page It dosen't work (either the last page dose not open or the clean up event crash)
ds_menu_end = create_menu_page(
	["BACK",		menu_element.page_transfer,	menu_pause_page.settings],
);


page = 0;
menu_pages = [ds_menu_settings, ds_menu_audio, ds_menu_controls,ds_menu_end];

var i = 0, array_len = array_length_1d(menu_pages);

repeat(array_len)
{
	menu_option[i] = 0;
	i++;
}

inputting = false;



