
//goes up after the ennemy cast it
if y >= height
{
	move_speed += move_acceleration;
	
	move_speed = min(move_speed,move_speed_max);
	y -= move_speed;
	
	move_x_speed = min(move_x_speed,move_x_speed_max);
	x -= move_x_speed;
	
}else
{
	move_speed -= move_acceleration;
	
	move_speed = max(move_speed,0);
	y -= move_speed;
	
	
	if move_speed == 0
	{
		
		timer ++;
		
		//start to cast things
		if timer <= casting_time
		{
			
			if timer mod 50 = 0
			{
				with instance_create_layer(x,y - 50,"Effects",oDeer_projectile)
				{
					creator = other.creator;
				}
			}
		}else fade = true;
	}
}
if fade
{
	alpha -= 0.01;
	image_alpha = alpha;
}

if alpha < 0 instance_destroy()

repeat(4)
{
	with (instance_create_layer(x,y - 55,"Effects",oGround_effect))
	{
		image_alpha = other.alpha;
	}
}