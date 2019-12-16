draw_self();

if instance_exists(oPlayer)
{
	if draw && healthpack != 0
	{
		if !instance_exists(pop_up)
		{
			pop_up = instance_create_layer(x,y,"Effects",oPop_up);
			with pop_up
			{
				//sprite_animation(sDown,0,0.05,x,y);
				sprite = sUse;
				y_buffer = 0;
				anim_speed = 0.05;
				_x = oPlayer.x;
				_y = oPlayer.y;
			}
		}
	}
	if !draw
	{
		instance_destroy(pop_up);
	}
}

draw = false;