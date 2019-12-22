draw_self();

if instance_exists(oPlayer)
{
	if oPlayer.grounded
	{
		if draw && healthpack != 0
		{
			if !instance_exists(pop_up)
			{
				pop_up = instance_create_layer(x,y,"Effects",oPop_up);
				with pop_up
				{
					sprite = sUse;
					letter = global.key_use;
					anim_speed = 0.05;
					_x = oPlayer.x;
					_y = oPlayer.y - 60;
					letter_x = oPlayer.x;
					letter_y = oPlayer.y - 60;
				}
			}
		}
		if !draw
		{
			instance_destroy(pop_up);
		}
	}
}

draw = false;