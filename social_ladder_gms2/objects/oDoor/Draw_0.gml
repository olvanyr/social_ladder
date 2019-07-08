draw_sprite(door_sprite, animation_frame, x,y);

if instance_exists(oPlayer)
{
	
	var dir = oPlayer.image_xscale;
	if collision_rectangle(x - (dir * 30),y - 30,x,y,oPlayer,false,false) && door_status == "closed" 
	{
		if boss == noone
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
			sprite_animation(sUse,-(dir * 25),0.05,x,y);
		}else 
		{
			if boss.state == "dead"
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
				sprite_animation(sUse,-(dir * 25),0.05,x,y);
			}
		}
	}
	
}