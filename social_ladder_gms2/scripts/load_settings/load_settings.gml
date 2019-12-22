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
		global.mastervolume			= _map[? "MASTERVOLUME"];
		global.soundsvolume			= _map[? "SOUNDSVOLUME"];
		global.musicvolume			= _map[? "MUSICVOLUME"];
		if ds_map_exists(_map,"up")	global.key_up							= _map[? "up"];
		if ds_map_exists(_map,"left")	global.key_left						= _map[? "left"];
		if ds_map_exists(_map,"right")	global.key_right					= _map[? "right"];
		if ds_map_exists(_map,"down")	global.key_down						= _map[? "down"];
		if ds_map_exists(_map,"attack")	global.key_attack					= _map[? "attack"];
		if ds_map_exists(_map,"slide")	global.key_slide					= _map[? "slide"];
		if ds_map_exists(_map,"cast")	global.key_cast						= _map[? "cast"];
		if ds_map_exists(_map,"use")	global.key_use						= _map[? "use"];
		if ds_map_exists(_map,"use_healthpack")	global.key_use_healthpack	= _map[? "use_healthpack"];
	
	}
	ds_map_destroy(_wrapper);
}

