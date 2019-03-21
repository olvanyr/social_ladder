// Inherit the parent event
event_inherited();



if once = true && state == "dead"
{
	
	once = false;

	if instance_exists(oPlayer) && global.enemies[? save_state] != "dead"
	{
		oPlayer.experience += experience;
		repeat (experience)
		{
			instance_create_layer(x + random_range(-4,4), y + random_range(-4,4), "Effects", oExperience);
		}
	}
	set_enemies_map();
	save();
}

