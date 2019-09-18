if(instance_exists(oPlayer))
{
	// get the absolute distance to the player
	var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
	
	if self.object_index == oSwordII || self.object_index == oSkeleton
	{
		if !grounded 
		{
			jump_spd = 0;
		}else jump_spd = jump_spd_max;
		// Follow the path if path exists
		if path_exists(path_building)
		{
			follow_the_path(path_building);
		}

		if vsp == 0 grounded = true;

		move_and_collide(hsp,0);

		pathfinding_timer ++;

		if instance_exists(oPlayer)
		{
			if pathfinding_timer >= 10 && oPlayer.grounded
			{
				pathfinding_timer = 0;
						if path_exists(path_building) {
						path_delete (path_building);
					}
					path_point = 0 ;
					action = 0 ;
					jump_action = 0 ;

				fill_the_grid(floor(x/oGrid.cell_width), floor(y/oGrid.cell_height), floor(oPlayer.x/oGrid.cell_width), floor(oPlayer.y/oGrid.cell_height));
			}
		}
				
		image_xscale = sign(hsp);
		if image_xscale == 0 image_xscale = 1;
				
		if hsp == 0
		{
			set_state_sprite(idle,idle_spd,0);
		}
				
		if vsp > 0
		{
			set_state_sprite(jump_up,0,1);
		}
		if vsp < 0
		{
			set_state_sprite(jump_up,0,0);
		}				
	}else
	{
		//dose the player is out of view or behind a wall ?
		if collision_line(x ,y,oPlayer.x,oPlayer.y,oWall,0,0) || (distance_to_object(oPlayer) > fov)
		{
			if chase_timer <= 0
			{
				if self.object_index == oMimic
				{
					state = "hide";
				}else state = "idle";
				exit;
			}
		}else chase_timer = chase_time_remaning;
	
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
			if distance_to_player <= attack_distance_range && distance_to_player >= attack_distance_range - 50
			{
				state = "shot";
			}
		}
	
		// if the player is to far away to attack him, move forward
		if distance_to_player > attack_range
		{		
			move_and_collide(direction_facing * chase_speed, 0);
		}
	}
	
	// if the player is close enought hit him
	if distance_to_player <= attack_range
	{
		state = "attack";
	}
	
	// if you have the ability to roll, sometime instead or attacking your roll
	if self.object_index == oSword || self.object_index == oSwordII || self.object_index == oFist || self.object_index == oSkeleton
	{
		if distance_to_player <= attack_range + 5 && irandom(4) == 1 && roll_cooldown <= 0
		{
			state = "roll";
		}
	}	
}

