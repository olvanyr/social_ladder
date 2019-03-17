

// set Enum for the menu

enum menu_page
{
	main,
	settings,
	audio,
	graphics,
	controls,
	height //so I now how many number of ellement I have
}

enum menu_element
{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	image,
	input
}

//creat the "pages" of the menu and store them into ds_grid
ds_menu_main = create_menu_page(
	["NEW GAME",	menu_element.script_runner,	start_game], 
	["CONTINUE",	menu_element.script_runner,	load_game], 
	["SETTINGS",	menu_element.page_transfer,	menu_page.settings],
	["EXIT",		menu_element.script_runner,	exit_game]
);

ds_menu_settings = create_menu_page(
	["FULLSCREEN",	menu_element.toggle,		global.fullscreen,		["ON", "OFF"]], 
	["CONTROLS",	menu_element.page_transfer,	menu_page.controls], 
	["AUDIO",		menu_element.page_transfer,	menu_page.settings],
	["BACK",		menu_element.page_transfer,	menu_page.main]
);

ds_menu_audio = create_menu_page(
	["MASTER",		menu_element.slider,			change_volume,			"mastervolume",				global.mastervolume,		[0,1]],
	["SOUNDS",		menu_element.slider,			change_volume,			"soundsvolume",				global.soundsvolume,		[0,1]],
	["MUSIC",		menu_element.slider,			change_volume,			"musicvolume",				global.musicvolume,			[0,1]],
	["BACK",		menu_element.page_transfer,	menu_page.settings],
);

ds_menu_controls = create_menu_page(
	["",			menu_element.image,			sGamepad],
	["BACK",		menu_element.page_transfer,	menu_page.settings],
);

page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_controls];

var i = 0, array_len = array_length_1d(menu_pages);

repeat(array_len)
{
	menu_option[i] = 0;
	i++;
}