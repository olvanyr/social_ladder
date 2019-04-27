if hp <= 0 && game_get_speed(gamespeed_fps) == 60 && state != "dead" && state != "death"
{
	game_set_speed(30,gamespeed_fps);
	alarm[4] = 25; 
	screenshake(4,15);
}

// Inherit the parent event
event_inherited();



if once = true && state == "dead"
{
	
	once = false;

	if instance_exists(oPlayer) && global.save[? save_state] != "dead"
	{
		global.experience += experience;
		repeat (experience)
		{
			instance_create_layer(x + random_range(-4,4), y + random_range(-4,4), "Effects", oExperience);
		}
	}
	set_enemies_map();
	set_global_map();
	save_map();
}

