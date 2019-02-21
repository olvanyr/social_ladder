var _file_name = room_get_name(room) + string(".sav");


if (file_exists(_file_name))
{
	var _wrapper = load_JSON_from_file(_file_name);
	var _list = _wrapper[? "root"]; // the ? is an accesseur and is a quickest way to acces into a ds map instade of using ds_map_find_value();
	
	for (var i = 0; i < ds_list_size(_list); i++)
	{
		var _map = _list[| i]; // we can write ds_list_find_value(_list,i);
		var _id = _map[? "id"];
		 
		if instance_exists(_id)
		{
			with _id
			{
				if _map[? "state"] == "death"
				{
					state = _map[? "state"];
					x = _map[? "x"];
					y = _map[? "y"];
				}
			}
		}
	}
	ds_map_destroy(_wrapper);
}

show_debug_message("Enemies load");