/// @desc save the game

// creat a root list in witch we will store all the ds_map

var _root_list = ds_list_create();

// check if the file is alredy filled
// just copy past the old ds_map into the new one, i don't realy know if it is possible



// for every instance, create a map

with(oEnemyParent) // beacause we do this with the enemy parents, it will happen once for every enemy in the room
{
	var _map = ds_map_create();
	ds_list_add(_root_list, _map); //save the ds_map to the root ds_list this hasn't actualy realy add the map to the list we only add the "pointer" to theme so wee have to mark this map as a ds_map
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1); //so right now wee just say to gm that the last entry wee add (size of the map who start by 0  -1) IS a ds_map, so now insted of just getting a referencence of the maop inside the list, wee actualy get the map
	
	var _id = id; ; //beacause we are in a "with" function this will get the index of the object that the fonction is curently looking at
	ds_map_add(_map,"id", _id);
	ds_map_add(_map,"y", y);
	ds_map_add(_map,"x", x);
	ds_map_add(_map,"state", state);
}

// Wrap the root list up in a map ! beacause gms2 "dosen't like" starting with enything othe rthan a ds_map

var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "root", _root_list);

// Save all of this to a string

var _string = json_encode(_wrapper);

save_string_to_file("saveenemies.sav", _string);

// Destroy the data by destroying the wrapper, we destroy every list and map

ds_map_destroy(_wrapper);

show_debug_message("Enemies Save");
