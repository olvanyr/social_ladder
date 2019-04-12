///@description go to the first room and creat the player

with instance_create_layer(0,0,"Effects", oTransition)
{
	next_room = global.start_room;
	x_next = global.start_x;
	y_next = global.start_y;
	global.current_music = mRoom0;
}


