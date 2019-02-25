/// @desc save the room the player have been in
/*
// creat a root list in witch we will store all the ds_map
var _root_list = ds_list_create();

for (var i = 0; i < array_length_1d(room_list) + 1; i++)
{
	var _map = ds_map_create();
	ds_list_add(_root_list, _map); //save the ds_map to the root ds_list this hasn't actualy realy add the map to the list we only add the "pointer" to theme so wee have to mark this map as a ds_map
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1); //so right now wee just say to gm that the last entry wee add (size of the map who start by 0  -1) IS a ds_map, so now insted of just getting a referencence of the maop inside the list, wee actualy get the map
	
	ds_map_add(_map,i, room_list[i,0] );
	var j = i + 1000;
	ds_map_add(_map,j, room_list[i,1] );
}


// Wrap the root list up in a map ! beacause gms2 "dosen't like" starting with enything othe rthan a ds_map

var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "root", _root_list);

// Save all of this to a string

var _string = json_encode(_wrapper);

save_string_to_file("saveroom.sav", _string);

// Destroy the data by destroying the wrapper, we destroy every list and map

ds_map_destroy(_wrapper);

show_debug_message("Room Save");