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
			image_counter = counter_use;
			sprite_animation(sUse,0,0.05,oPlayer.x,oPlayer.y);
			counter_use = image_counter;
		}
	}
}