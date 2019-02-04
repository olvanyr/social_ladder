if (instance_exists(oPlayer))
{
	if round(oPlayer.y) >= y || oPlayer.input.down
	{
		mask_index = -1;
	}else mask_index = sPlatform;
}