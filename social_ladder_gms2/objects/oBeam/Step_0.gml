
if timer < telegraph_time
{
	image_speed = 0;
	repeat(ceil(timer/10))
	{
		with (instance_create_layer(x,y,"Effects",oGround_effect))
		{
			if other.orientation = "h"
			{
				vsp = 0;
			}
			if other.orientation = "v"
			{
				hsp = 0;
			}
		}
	}
}

if timer > telegraph_time
{
	image_speed = 1;
	if orientation = "h"
	{
		image_angle = 0;
		mask = sHorn_beam_mask_h;
	}else 
	{
		image_angle = 90;
		mask = sHorn_beam_mask_v;
	}

	if animation_hit_frame(6)
	{
		create_hitbox(x, y, creator, mask, knockback, 5, damage, image_xscale);
	}

	if animation_end()
	{
		instance_destroy();
	}
}

timer ++;