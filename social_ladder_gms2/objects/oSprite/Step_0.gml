image_alpha += 0.1;

if instance_exists(oPlayer)
{
	if(letters >= length) && !point_in_circle(oPlayer.x,oPlayer.y,other.x,other.y, radius)
	{
		instance_destroy();
		with(oCamera) follow = oPlayer;
	}
}