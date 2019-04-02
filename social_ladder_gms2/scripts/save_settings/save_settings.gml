
	// Create a root list

	var _root_list = ds_list_create(); //just creat a pointer

	// For every instance, create a map

	var _map = ds_map_create(); //just creat a pointer
	ds_list_add(_root_list,_map); //add pointer to a pointer
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1); // actuali add the data

			ds_map_add(_map, "fullscreen"	, window_get_fullscreen());
			ds_map_add(_map, "MASTERVOLUME"	, global.mastervolume);
			ds_map_add(_map, "SOUNDSVOLUME"	, global.soundsvolume);
			ds_map_add(_map, "MUSICVOLUME"	, global.musicvolume);

	// Wrap the root list up in a map ! beacause gms2 "dosen't like" starting with enything othe rthan a ds_map

	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", _root_list);

	// Save all of this to a string

	var _string = json_encode(_wrapper);

	save_string_to_file("savesetting.json", _string);

	// Destroy the data

	ds_map_destroy(_wrapper);