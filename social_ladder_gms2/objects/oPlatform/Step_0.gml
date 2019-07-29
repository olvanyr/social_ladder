if (instance_exists(oPlayer))
{	
	if round(oPlayer.y) >= y || (oPlayer.input.down && oPlayer.vsp == 0)
	{
		mask_index = -1;
	}else mask_index = sPlatform;
	
	
	
}

last_down_input = oPlayer.input.down;
