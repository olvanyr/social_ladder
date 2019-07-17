
//goes up after the ennemy cast it
if y >= ystart - 20
{
	move_speed += move_acceleration;
	
	move_speed = min(move_speed,move_speed_max);
	y -= move_speed;
	
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
			
			if timer mod 10 == 0
			{
				with instance_create_layer(x,y - 50,"Effects",oMaggie_projectile)
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