
if (file_exists("saveplayer.sav"))
{
	var _wrapper = load_JSON_from_file("saveplayer.sav");
	var _list = _wrapper[? "root"]; // the ? is an accesseur and is a quickest way to acces into a ds map instade of using ds_map_find_value();
	
	for (var i = 0; i < ds_list_size(_list); i++)
	{
		var _map = _list[| i]; // we can write ds_list_find_value(_list,i);		 
		hp			= _map[? "hp"];
		healthpack	= _map[? "healthpack"];
		key1		= _map[? "key1"];
	}
	ds_map_destroy(_wrapper);
}

show_debug_message("Enemies load");