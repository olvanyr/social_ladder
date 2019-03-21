///@desc destroy all savable instances, and load new one for json
///@param json

var json = argument0;

var decode = json_decode(json);


ds_map_destroy(global.enemies);
global.enemies = ds_map_create();
global.enemies = decode;

