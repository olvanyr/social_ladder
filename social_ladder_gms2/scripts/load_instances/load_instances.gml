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

global.enemies = json_decode(json);
