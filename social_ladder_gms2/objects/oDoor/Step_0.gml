
if door_status == "closed"
{
	image_index = 0;
	mask_index = door_sprite;
}else
{
	animation_frame += anim_speed;
	if animation_frame >= sprite_get_number(door_sprite)
	{	
		animation_frame = sprite_get_number(door_sprite)-1;
		mask_index = -1;
		image_speed = 0;
	}
	
}

if door_status == "open"
{
	var door_number = array_length_1d(global.door);
	global.door[door_number] = id;
}