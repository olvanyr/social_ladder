if creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1 || other.state == "death"
{
	exit;
}

if other.state != "roll" && other.state != "death"
{
	other.hp -= damage;
	//audio_play_sound();
	if other.knockbackable == true
	{
		other.state = "knockback";
	}
}




if instance_exists(oPlayer)
{
	if creator.object_index == oPlayer
	{
		repeat (10)
		{
			instance_create_layer(other.x, other.y - 12, "Effects", oHit_effect);
		}
		
		if creator.state = "move"
		{
			creator.vsp = -5;
		}
	}
	
	if other.object_index == oPlayer
	{
		// We hit the player
		if other.state != "roll"
		{
			screenshake(4,8);
			gamepad_set_vibration(0, 1, 1);
			other.alarm[1] = 6;
			if other.hp <= 0
			{
				show_debug_message("player dead");
			}
		}
	}else
	{
		//We hit an enemy
		other.alarm[0] = 60;
		screenshake(2,4);
	}
}




ds_list_add(hit_objects, other);
other.knockback_speed = knockback * image_xscale;

