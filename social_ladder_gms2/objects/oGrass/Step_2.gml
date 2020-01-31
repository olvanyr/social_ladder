/// @description Insert description here

if instance_exists(oPlayer)
{
	if abs(oPlayer.x - x) < global.ideal_width	
	{
		xskew = GiggleApproach(xskew,xset,1);

		if(xskew == xset) xset *= -0.5;
	}
}


