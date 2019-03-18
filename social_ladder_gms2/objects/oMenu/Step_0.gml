if !instance_exists(oInput)
{
	input = instance_create_layer(0,0,"Instances",oInput)
}else input = oInput;


/*
//Pause
if(!global.pause) exit;

instance_deactivate_all(true);
audio_pause_all();

//Take Input in the menu
input_up_p		= keyboard_check_pressed(global.key_up)		|| keyboard_check_pressed(global.default_key_up)	|| gamepad_button_check_pressed(0,gp_padu);
input_down_p	= keyboard_check_pressed(global.key_down)	|| keyboard_check_pressed(global.default_key_down)	|| gamepad_button_check_pressed(0,gp_padd);
input_right_p	= keyboard_check_pressed(global.key_right)	|| keyboard_check_pressed(global.default_key_right) || gamepad_button_check_pressed(0,gp_padr);
input_left_p	= keyboard_check_pressed(global.key_left)	|| keyboard_check_pressed(global.default_key_left)	|| gamepad_button_check_pressed(0,gp_padl);
input_enter_p	= keyboard_check_pressed(global.key_enter)	|| keyboard_check_pressed(global.default_key_enter) || gamepad_button_check_pressed(0,gp_face1);

input_right_p_direct	= keyboard_check_direct(global.key_right)	|| keyboard_check_direct(global.default_key_right)  || gamepad_button_check_pressed(0,gp_padr);
input_left_p_direct	    = keyboard_check_direct(global.key_left)	|| keyboard_check_direct(global.default_key_left)	|| gamepad_button_check_pressed(0,gp_padl);
*/

show_debug_message(global.mastervolume);
//check if gamepad or keyboard are pressed
if(input.roll)
{
	if(!inputting)
	{
		if(page = menu_page.settings) page = menu_page.main;
		else page = menu_page.settings;
	}
}

/*
if(keyboard_check_pressed(vk_anykey)) any_pressed = 0;

for ( var i = gp_face1; i < gp_axisrv; i++ ) {
    if ( gamepad_button_check( 0, i ) ) any_pressed = 1;
}
*/



//Set every menu fonctionality depending of the page
var ds_ = menu_pages[page], ds_height = ds_grid_height(ds_);

if(inputting){
	
	switch(ds_[# 1, menu_option[page]]){
		case menu_element.shift:
			var hinput = input.menu_right - input.menu_left;
			if(hinput != 0){
				//audio
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, array_length_1d(ds_[# 4, menu_option[page]])-1);
			}
		break;
		
		case menu_element.slider:
			var hinput = input.menu_right - input.menu_left;
			if(hinput != 0){
				
				
				ds_[# 4, menu_option[page]] += hinput * 0.05;
				ds_[# 4, menu_option[page]] = clamp(ds_[# 4, menu_option[page]], 0, 1);
				variable_global_set(ds_[# 3, menu_option[page]], ds_[# 4, menu_option[page]]);
				
				
			}
			
		break;
		
		case menu_element.toggle:
		var hinput = input.menu_right - input.menu_left;
			if(hinput != 0){
				//audio
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, 1);
			}
		break;
		
		case menu_element.input:
		if(any_pressed == 0)
		{
			var kk = keyboard_lastkey;
			if(kk != vk_enter){
				if(kk != ds_[# 3, menu_option[page]]) //audio
				ds_[# 3, menu_option[page]] = kk;
				variable_global_set(ds_[# 2, menu_option[page]], kk);
			}
		}
		
		break;
	}
	
} else {
	var ochange = input.menu_down - input.menu_up;
	if(ochange != 0){
		menu_option[page] += ochange;
		if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
		if(menu_option[page] < 0) { menu_option[page] = ds_height-1; }
		//audio
	}
}

if(input.enter){
	switch(ds_[# 1, menu_option[page]]){
		case menu_element.script_runner: script_execute(ds_[# 2, menu_option[page]]); break;
		case menu_element.page_transfer: page = ds_[# 2, menu_option[page]]; break;
		case menu_element.shift:
		case menu_element.slider:
		case menu_element.toggle: if(inputting){ script_execute(ds_[# 2, menu_option[page]], ds_[# 3, menu_option[page]]); }
		case menu_element.input:
			inputting = !inputting;
			alarm[0] = 1;
			break;
	}
	
	//audio
}


/*
#region //loadgame

if(global.loadgame)
{
	if (file_exists("savegame.sav"))
	{
		var _wrapper = LoadJSONFromFile("savegame.sav");
		var _list = _wrapper[? "ROOT"]; //= var _list = ds_map_find_value(_wrapper,"ROOT");
		for (var i=0; i < ds_list_size(_list); i++)
		{
			var _map = _list[| i];
		
				global.current_room = _map[? "room"];
				global.kill = _map[? "kill"];
				global.k1 = _map[? "k1"];
				global.k2 = _map[? "k2"];
				global.k3 = _map[? "k3"];
				global.current_p2 = _map[? "current_p2"];
		}
		ds_map_destroy(_wrapper);
		show_debug_message("Game loaded");
	}
	
	global.loadgame = false;
	room_goto(global.current_room);
	
	global.pause = false;
}


#endregion
#region //save setting

if(global.savesetting)
{

	// Create a root list

	var _root_list = ds_list_create(); //just creat a pointer

	// For every instance, create a map

	var _map = ds_map_create(); //just creat a pointer
	ds_list_add(_root_list,_map); //add pointer to a pointer
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1); // actuali add the data

			ds_map_add(_map, "fullscreen"	, window_get_fullscreen());
			ds_map_add(_map, "UP"			, global.key_up);
			ds_map_add(_map, "LEFT"			, global.key_left);
			ds_map_add(_map, "RIGHT"		, global.key_right);
			ds_map_add(_map, "DOWN"			, global.key_down);
			ds_map_add(_map, "ACTION/ENTER"	, global.key_enter);
			ds_map_add(_map, "JUMP"			, global.key_jump);
			ds_map_add(_map, "ZOOM"			, global.key_zoom);
			ds_map_add(_map, "PAUSE"		, global.key_pause);
			ds_map_add(_map, "MASTERVOLUME"	, global.mastervolume);
			ds_map_add(_map, "SOUNDSVOLUME"	, global.soundsvolume);
			ds_map_add(_map, "MUSICVOLUME"	, global.musicvolume);
			ds_map_add(_map, "RESOLUTION"	, global.resolution);


	// Wrap the root list up in a map ! beacause gms2 "dosen't like" starting with enything othe rthan a ds_map

	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", _root_list);

	// Save all of this to a string

	var _string = json_encode(_wrapper);

	SaveStringToFile("savesetting.sav", _string);

	// Destroy the data

	ds_map_destroy(_wrapper);
	
	global.savesetting = false;

	show_debug_message("Setting Save");
}
#endregion
