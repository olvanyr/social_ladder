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
			}
		}
		
		if boss == noone || !instance_exists(boss) || boss.state == "dead"
		{
			if !instance_exists(pop_up1)
			{
				pop_up1 = instance_create_layer(x,y,"Effects",oPop_up);
				with pop_up1
				{
					sprite = sUse;
					y_buffer = -(dir * 40);
					anim_speed = 0.05;
					_x = other.x;
					_y = other.y;
				}
			}
			
			key_sprite = asset_get_index("sKey_"+string(key));
			if sprite_exists(key_sprite)
			{
				if !instance_exists(pop_up2)
				{
					pop_up2 = instance_create_layer(x,y,"Effects",oPop_up);
					with pop_up2
					{
						sprite = other.key_sprite;
						y_buffer = -(dir * 40);
						anim_speed = 0;
						_x = other.x;
						_y = other.y - 80;
					}
				}
			}
		
			if !instance_exists(pop_up0)
			{
				pop_up0 = instance_create_layer(x,y,"Effects",oPop_up);
				with pop_up0
				{
					sprite = sKey_back;
					y_buffer = -(dir * 40);
					anim_speed = 0.05;
					_x = other.x;
					_y = other.y - 70;
				}
			}
		}
	}else 
	{
		instance_destroy(pop_up0);
		instance_destroy(pop_up1);
		instance_destroy(pop_up2);
	}
	
}