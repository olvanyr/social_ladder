///@description destroy all savable instances, and load new one for json
///@param json

var json = argument0;

/*
with(all)
{
	if ds_map_exists(global.save_map_,object_index)
	{
		instance_destroy();
	}
}

var m = json_decode(json);
var list = m[?"instances"];
for(var i = 0; i < ds_list_size(list); i++)
{
	var map = list[|i];
	save_map_get_instance(map);
}

ds_map_destroy(m);
*/


ds_map_destroy(global.enemies);
global.enemies = ds_map_create();
global.enemies = json_decode(json);

/*
var m = json_decode(json);

var list = ds_list_create();
list = m[?ident];

for(var i = 0; i < ds_list_size(list); i++)
{
	var array;
	array[i] = list[|i];
	global.enemies[?ident] = array;
}

ds_map_destroy(m);

