/// @desc Save game

if(keyboard_check_pressed(ord("P")))
{

	// Create a root list

	var _root_list = ds_list_create(); //just creat a pointer

	// For every instance, create a map

	var _map = ds_map_create(); //just creat a pointer
	ds_list_add(_root_list,_map); //add pointer to a pointer
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1); // actuali add the data
	
	

	ds_map_add(_map, "room",	  global.current_room);
	ds_map_add(_map, "kill",	  global.kill);
	ds_map_add(_map, "Current_K", global.current_k);	
	ds_map_add(_map, "k1",		  global.k1);
	ds_map_add(_map, "k2",		  global.k2);
	ds_map_add(_map, "k3",		  global.k3);
	ds_map_add(_map, "current_p2",global.current_p2);



	// Wrap the root list up in a map ! beacause gms2 "dosen't like" starting with enything othe rthan a ds_map

	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", _root_list);

	// Save all of this to a string

	var _string = json_encode(_wrapper);

	//SaveStringToFile("savegame.sav", _string);

	// Destroy the data

	ds_map_destroy(_wrapper);
	
	global.savegame = false;

	show_debug_message("Game Save");
}