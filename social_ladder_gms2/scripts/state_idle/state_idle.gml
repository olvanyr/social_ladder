if(instance_exists(oPlayer))
{
	if !collision_line(x + 20,y,oPlayer.x + 20,oPlayer.y,oWall,0,0)
	{
		if(distance_to_object(oPlayer) < fov) 
		{
			if (oPlayer.grounded)
			{
				if self.object_index == oMimic
				{
					state = "show";
				}else state = "chase";
			}
		}
	}
}