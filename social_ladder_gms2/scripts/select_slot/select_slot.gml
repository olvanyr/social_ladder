/// @desc set the curent played slot
load_map();

if ds_map_exists(global.save, "room") && global.save[? "room"] != rLab
{
	room_goto(global.start_room);
	instance_create_layer(global.start_x, global.start_y, "Player", oPlayer);
	global.current_music = mRoom0;
	
}else 
{
	room_goto(rCutscenes);
	global.current_music = mRoom0;
}