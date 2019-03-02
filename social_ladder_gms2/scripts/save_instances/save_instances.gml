///@desc return a json string of all the instances

var list = ds_list_create();
with(all) //trought all the object if the object is inside the map, then save the data that are inside the global.save_map
{
	if ds_map_exists(global.save_map_,object_index) // if the object is inside the map, "if it has data to be saved"
	{
		var map = instance_get_save_map(id);
		ds_list_add(list,map); // at this point gms2 dosen't know that what we actualy add to the list is actualy a map
		ds_list_mark_as_map(list,ds_list_size(list)-1) // so we say to gm that the last index of our list is actualy a map 
	}
}

var m = ds_map_create(); //to create json string gm need the ds to be a map, so we have to wrap the map into a list 

ds_map_add_list(m, "instances", list); //ds map work a litle bit differently, we need to ad the list to the map as a list, we can't mark as a list 

var json = json_encode(m);

ds_map_destroy(m);

return json;