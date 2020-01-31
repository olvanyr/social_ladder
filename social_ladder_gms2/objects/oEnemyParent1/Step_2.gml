// Inherit the parent event
event_inherited();



if once = true && state == "dead"
{
	
	once = false;

	if instance_exists(oPlayer) && global.save[? save_state] != "dead"
	{
		global.experience += experience;
		repeat (experience * 5)
		{
			instance_create_layer(x + random_range(-4,4), y + random_range(-4,4), "Effects", oExperience);
		}
	}
	set_enemies_map();
	set_global_map();
	save_map();
}

