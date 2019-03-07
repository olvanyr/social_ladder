if creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1 || other.state == "death" || other.state == "roll"
{
	exit;
}
if object_get_name(creator) == oEnemyParent && object_get_name(other) == oEnemyParent
{
	exit;
}


if other.state != "roll" && other.state != "death"
{
	other.flash = 1;
	other.hp -= damage;
	other.hp = max(other.hp,0);
	//audio_play_sound();
	if knockback != 0
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
		
		if creator.state == "move"
		{
			creator.vsp = -5;
		}
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
}




ds_list_add(hit_objects, other);
other.knockback_speed = knockback * image_xscale;

