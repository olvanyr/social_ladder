image = draw_sprite(sPlatform, 0, x,y);

if place_meeting(x,y - 1, oPlayer)
{
	timer --;
}else timer = max_timer;

timer = manage_timer(timer);

if timer <= 0
{
	button_animation(sDown,0);
}
