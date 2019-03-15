if creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1 || other.state == "death" || other.state == "roll" || other.state == "dead"
{
	exit;
}
if object_get_parent(creator.object_index) == oEnemyParent && object_get_parent(other.object_index) == oEnemyParent
{
	exit;
}


if instance_exists(oPlayer)
{
	if other.state != "roll" && (other.state != "death" || other.state == "dead")
	{
		if other.object_index == oPlayer
		{
			if other.invincibility > 0
			{
				exit;
			}
		}
		other.flash = 1;
		other.hp -= damage;
		other.hp = max(other.hp,0);
		//audio_play_sound();
		if knockback != 0
		{
			other.state = "knockback";
		}
	}

	if creator.object_index == oPlayer
	{
		repeat (10)
		{
			instance_create_layer(other.x, other.y - 12, "Effects", oHit_effect);
		}
		
		creator.hit = true;
	}
	
	if other.state != "roll"
	{
		if other.object_index == oPlayer
		{
			// We hit the player
			{
				screenshake(4,8);
				gamepad_set_vibration(0, 1, 1);
				other.alarm[1] = 6;
				other.invincibility = 6;
			}
		}else
		{
			//We hit an enemy
			other.alarm[0] = 60;
			screenshake(2,4);
		}
	}
}




ds_list_add(hit_objects, other);
other.knockback_speed = knockback * image_xscale;

