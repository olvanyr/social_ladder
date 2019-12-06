draw_sprite(door_sprite, animation_frame, x,y);

if instance_exists(oPlayer)
{
	
	var dir = oPlayer.image_xscale;
	if collision_rectangle(x - (dir * 50),y - 30,x,y,oPlayer,false,false) && door_status == "closed" 
	{
		if boss == noone || !instance_exists(boss)
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
			
			sprite_animation(sKey_back,-(dir * 40),0.05,x,y - 70);
			
			sprite_animation(sUse,-(dir * 40),0.05,x,y);
			
			var key_sprite = asset_get_index("sKey_"+string(key));
			if sprite_exists(key_sprite)
			{
				sprite_animation(key_sprite,-(dir * 40),0,x,y - 80);
			}
			
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