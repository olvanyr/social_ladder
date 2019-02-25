/// @desc save the enemies states

// creat a root list
var _root_list = ds_list_create();

var _array_height = array_height_2d(global.enemies)-1;
show_debug_message(_array_height);


var i = 0;
repeat (_array_height)
{
	var _map = ds_map_create();
	ds_list_add(_root_list, _map); //save the ds_map to the root ds_list this hasn't actualy realy add the map to the list we only add the "pointer" to theme so wee have to mark this map as a ds_map
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1); //so right now wee just say to gm that the last entry wee add (size of the map who start by 0  -1) IS a ds_map, so now insted of just getting a referencence of the maop inside the list, wee actualy get the map
	
	ds_map_add(_map,state, i );
	
	ds_map_add(_map,x, global.enemies[i,save.x] );
	
	//ds_map_add(_map,y, global.enemies[i,save.y] );

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