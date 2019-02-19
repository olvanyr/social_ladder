draw_self();

if (instance_exists(oPlayer)) && (!instance_exists(oText))
{
	if (!point_in_circle(oPlayer.x, oPlayer.y, x, y, radius))
	{
		draw_set_alpha(0.5);
		draw_sprite(sMarker,0,x,y - 20);
		draw_set_alpha(1);
	}
}
