
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

if instance_exists(oPlayer)
{
	if collision_rectangle(x - 30,y - 30,x,y,oPlayer,false,false)
	{
		if oInput.use
		{
			for (var i = 0; i < array_length_1d(global.key); i++)
			{
				
				var own_key = global.key[i];
				if own_key == key
				{
					door_status = "open";
				}
			}
		}
	}
}