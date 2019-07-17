draw_self();

if instance_exists(oPlayer)
{
	if draw && healthpack != 0
	{
		sprite_animation(sUse,0,0.05,oPlayer.x,oPlayer.y);
	}
}

draw = false;