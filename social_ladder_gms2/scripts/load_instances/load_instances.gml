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
var data = json_decode(json);
var decode = data[?"default"];

var list = ds_list_create();
list = decode[?ident];
show_debug_message(list);

var array;
array[save.state] = ds_list_find_value(list, save.state);
array[save.x] = list[|save.x];
array[save.y] = list[|save.y];

ds_list_destroy(list);
global.enemies[?ident] = array;

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

