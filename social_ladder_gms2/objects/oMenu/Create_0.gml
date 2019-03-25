// set Enum for the menu

enum menu_page
{
	start,
	main,
	settings,
	audio,
	graphics,
	controls,
	slots,
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
	slots,
	input
}

//creat the "pages" of the menu and store them into ds_grid
ds_menu_start = create_menu_page(
["",		menu_element.page_transfer,	menu_page.main], 
);


ds_menu_main = create_menu_page(
	["PLAY",		menu_element.page_transfer,	menu_page.slots], 
	["SETTINGS",	menu_element.page_transfer,	menu_page.settings],
	["EXIT",		menu_element.script_runner,	exit_game]
);

ds_menu_settings = create_menu_page(
	["FULLSCREEN",	menu_element.toggle,		change_window_mode,		global.fullscreen,		["ON", "OFF"]],  
	["CONTROLS",	menu_element.page_transfer,	menu_page.controls], 
	["AUDIO",		menu_element.page_transfer,	menu_page.audio],
	["BACK",		menu_element.page_transfer,	menu_page.main]
);

ds_menu_audio = create_menu_page(
	["MASTER",		menu_element.slider,		change_volume,			"mastervolume",				global.mastervolume,		[0,1]],
	["SOUNDS",		menu_element.slider,		change_volume,			"soundsvolume",				global.soundsvolume,		[0,1]],
	["MUSIC",		menu_element.slider,		change_volume,			"musicvolume",				global.musicvolume,			[0,1]],
	["BACK",		menu_element.page_transfer,	menu_page.settings],
);
ds_menu_controls = create_menu_page(
	["BACK",		menu_element.page_transfer,	menu_page.settings],
);
ds_menu_slots = create_menu_page(
	["SAVE I",		menu_element.slots,			select_slot,	"slot",	1], 
	["SAVE II",		menu_element.slots,			select_slot,	"slot",	2], 
	["SAVE III",	menu_element.slots,			select_slot,	"slot",	3],
	["BACK",		menu_element.page_transfer,	menu_page.main]
);
//I don't know why, but if I don't have a final page It dosen't work (either the last page dose not open or the clean up event crash)
ds_menu_end = create_menu_page(
	["BACK",		menu_element.page_transfer,	menu_page.settings],
);


page = 0;
menu_pages = [ds_menu_start, ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_controls,ds_menu_end,ds_menu_slots];

var i = 0, array_len = array_length_1d(menu_pages);

repeat(array_len)
{
	menu_option[i] = 0;
	i++;
}

inputting = false;