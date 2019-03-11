
if door_status == "closed"
{
	image_index = 0;
	mask_index = door_sprite;
}else
{
	animation_frame += 0.5;
	if animation_frame >= sprite_get_number(door_sprite)
	{	
		animation_frame = sprite_get_number(door_sprite)-1;
		mask_index = -1;
		image_speed = 0;
	}
	
}