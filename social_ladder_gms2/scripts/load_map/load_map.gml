/*
if (file_exists("saveroom.sav"))
{
	var _wrapper = load_JSON_from_file("saveroom.sav");
	var _list = _wrapper[? "root"]; // the ? is an accesseur and is a quickest way to acces into a ds map instade of using ds_map_find_value();
	
	for (var i = 0; i < ds_list_size(_list); i++)
	{
		var _map = _list[| i]; // we can write ds_list_find_value(_list,i);		 
		var j = i + 1000;
				
		oMap.room_list[i,0] = _map[? i];
		oMap.room_list[i,1] = _map[? j];
	}
	ds_map_destroy(_wrapper);
	show_debug_message("room load");
}

