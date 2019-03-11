///@description destroy all savable instances, and load new one for json
///@param json

var json = argument0;

var decode = json_decode(json);


ds_map_destroy(global.enemies);
global.enemies = ds_map_create();
global.enemies = decode;

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
