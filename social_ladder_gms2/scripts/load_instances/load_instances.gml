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

if global.save[? "double_jump"] == true
{
	global.double_jump = global.save[? "double_jump"];
}
if global.save[? "wall_jump"] == true
{
	global.wall_jump = global.save[? "wall_jump"];
}
if global.save[? "cast"] == true
{
	global.cast = global.save[? "cast"];
}
