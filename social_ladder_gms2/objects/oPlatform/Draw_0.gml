draw_sprite(sPlatform, 0, x,y);

if instance_exists(oPlayer)
{
	if place_meeting(x,y - 1, oPlayer)
	{
		timer --;
	}else timer = max_timer;
}

timer = manage_timer(timer);

if timer <= 0
{
	sprite_animation(sDown,0,0.05,x,y);
}
