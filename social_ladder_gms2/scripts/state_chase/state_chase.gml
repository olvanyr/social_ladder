if(instance_exists(oPlayer))
{
	//dose the player is out of view or behind a wall ?
	if collision_line(x ,y,oPlayer.x,oPlayer.y,oWall,0,0) || (distance_to_object(oPlayer) > fov)
	{
		if self.object_index == oMimic
		{
			state = "hide";
		}else state = "idle";
		exit;
	}
	
	if fly != 1 // does the enemy fly
	{
		image_xscale = sign(oPlayer.x - x);
	}else 
	{
		image_xscale = -sign(oPlayer.x - x);
	}
	
	if abs(oPlayer.x - x) < 2 image_xscale = 0
	var direction_facing = image_xscale;
	if (image_xscale == 0) image_xscale = 1;
	
	
	// get the absolute distance to the player
	var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
	
	// if the player is close enought hit him
	if distance_to_player <= attack_range
	{
		state = "attack";
	}
	
	
	// if you have the ability to charge
	if self.object_index == oScratcher
	{
		if distance_to_player <= attack_charge_range && distance_to_player >= attack_charge_range - 15
		{
			state = "charge";
		}

	}
	
	// if you have the ability to shot
	if self.object_index == oDistance
	{
		if distance_to_player <= attack_distance_range && distance_to_player >= attack_distance_range - 10
		{
			state = "shot";
		}
	}
	
	// if the player is to far away to attack him, move forward
	if distance_to_player > attack_range
	{		
		move_and_collide(direction_facing * chase_speed, 0);
	}
	
	// if you have the ability to roll, sometime instead or attacking your roll
	if self.object_index == oSword || self.object_index == oFist
	{
		if distance_to_player <= attack_range + 5 && irandom(4) == 1 && roll_cooldown <= 0
		{
			state = "roll";
		}
	}	
}

