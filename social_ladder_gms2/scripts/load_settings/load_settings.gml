if (file_exists("savesetting.json"))
{
	var _wrapper = load_JSON_from_file("savesetting.json");
	var _list = _wrapper[? "ROOT"]; //= var _list = ds_map_find_value(_wrapper,"ROOT");
	for (var i=0; i < ds_list_size(_list); i++)
	{
	var _map = _list[| i];
		
		if(_map[? "fullscreen"]) 
		{
			window_set_fullscreen(true);
			global.fullscreen = false;
		}
		global.mastervolume	= _map[? "MASTERVOLUME"];
		global.soundsvolume	= _map[? "SOUNDSVOLUME"];
		global.musicvolume	= _map[? "MUSICVOLUME"];
	
	}
	ds_map_destroy(_wrapper);
}