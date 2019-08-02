if creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1 || other.state == "death" || other.state == "roll" || other.state == "dead" || other.state == "wait"
{
	exit;
}


if is_enemy(creator.object_index) && is_enemy(other.object_index) exit;

if !instance_exists(oPlayer) exit;

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
		if is_knockbackable(other)
		{
			other.state = "knockback";
		}
	}
}
	
if creator.object_index == oPlayer
{
	repeat (10)
	{
		instance_create_layer(other.x, other.y - 16, "Effects", oHit_effect);
	}
		
	creator.hit = true;
}
	
if other.state != "roll"
{
	if other.object_index == oPlayer
	{
		// We hit the player
		{
			screenshake(8,6);
			gamepad_set_vibration(0, 1, 1);
			other.alarm[1] = 6;
			other.invincibility = 30 * global.difficulty;
		}
	}else
	{
		//We hit an enemy
		other.alarm[0] = 60;
		screenshake(4,6);
	}
}


ds_list_add(hit_objects, other);


//other.knockback_speed = knockback * sign(oPlayer.x - x);
var knockback_dir = sign(other.x - creator.x);
other.knockback_speed = knockback * knockback_dir;

//show_debug_message("other.object_index : " + string(other.object_index));