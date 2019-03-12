if(instance_exists(oPlayer))
{
	if !collision_line(x + 40,y,oPlayer.x + 40,oPlayer.y,oWall,0,0)
	{
		if(distance_to_object(oPlayer) < fov) 
		{
			if (oPlayer.grounded)
			{
				state = "chase";
			}
		}
		else state = "idle";
	}else state = "idle";
}