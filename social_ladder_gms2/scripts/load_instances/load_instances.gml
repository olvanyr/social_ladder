///@desc destroy all savable instances, and load new one for json
///@param json

var json = argument0;

var decode = json_decode(json);


ds_map_destroy(global.save);
global.save = ds_map_create();
global.save = decode;

global.experience = global.save[? "experience"];

global.date = global.save[? "date"];
global.play_time = global.save[? "play_time"];

ability_to_load();
door_to_load();
