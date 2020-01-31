if(instance_exists(oPlayer))
{
	if !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0)
	{
		if(distance_to_object(oPlayer) < fov) 
		{
			if (oPlayer.grounded)
			{
				if self.object_index == oMimic
				{
					state = "show";
				}else 
				{
					state = "chase";
					audio_play_sound_at(sndEnemy_test1,x,y,0,100, 300, 1, false, 3);
				}
			}
		}
	}
}