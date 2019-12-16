draw_self();

if new_ability
{
	image_counter = counter_pulsse;
	sprite_animation(sSkill_engine_pulssing,0,0.6,x,y);
	counter_pulsse = image_counter;
	if instance_exists(oPlayer)
	{
		var dir = oPlayer.image_xscale;
		if collision_rectangle(x - (dir * 30),y - 30,x,y,oPlayer,false,false)
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
		}else instance_destroy(pop_up);
	}
}

draw_sprite(sMiasma_tree,image,x,y);