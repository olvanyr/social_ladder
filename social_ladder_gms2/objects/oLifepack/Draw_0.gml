draw_self();

if instance_exists(oPlayer)
{
	var dir = oPlayer.image_xscale;
	if collision_rectangle(x - (dir * 30),y - 30,x,y,oPlayer,false,false) && healthpack != 0
	{
		button_animation(sUse,0);
	}
}