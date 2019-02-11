if(instance_exists(oPlayer))
{
	if !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0)
	{
		if(distance_to_object(oPlayer) < fov)  state = "chase";
		else state = "idle";
	}
}