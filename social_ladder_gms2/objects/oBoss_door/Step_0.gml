if instance_exists(oPlayer)
{
	//if we collide with the player, get the player xp^and start creating some particle
	var dir = oPlayer.image_xscale;
	if collision_rectangle(x - (dir * 50),y - 30,x,y,oPlayer,false,false)
	{
		//get player xp
		player_xp = global.experience * visual_factor;
		//start to create xp particle, if the door is full or the player don't have xp anymore, stop
		if xp_count < player_xp && xp_count < needed_xp * visual_factor
		{
			xp_count ++;
			with instance_create_layer(oPlayer.x,oPlayer.y - 20,"Effects",oExperience)
			{
				target = other;
			}
		}
	}else if xp_count > 0
	{
		//if not colliding and xp count > 0, creat particle from door to player
		if xp_count > 200 xp_count = 200; // 200 is good visualy, but not to heavy fopr the game
		repeat(xp_count)
		{
			with instance_create_layer(x,y,"Effects",oExperience)
			{
				target = oPlayer;
			}
		}
		xp_count = 0;
	}
}

// animate the door in fraction of the xp needed
if image_index < image_number - 1
{
	image_index = floor(image_number * ((xp_count/visual_factor) / needed_xp));
}

//if the player has almost enought xp, we block the animation so the door is not "stuck" full
if global.experience < needed_xp && image_index == image_number - 1 
{
	image_index = image_number-2;
}

//if the door is full, destroy the object, and create an actual door
if global.experience >= needed_xp && image_index == image_number - 1 
{
	with instance_create_layer(x,y,"Door",oDoor)
	{
		door_sprite = sDoor_boss;
		door_status = "open";
		anim_speed = 0.1;
		mask_index = door_sprite;
		
	}
	instance_destroy(self);
}
/*
show_debug_message("xp_count / visual_factor : " + string(xp_count/visual_factor));
show_debug_message("global.xp : " + string(global.experience));