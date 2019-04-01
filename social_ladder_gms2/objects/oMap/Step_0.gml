if !instance_exists(oInput)
	{
		input = instance_create_layer(0,0,"Instances",oInput)
}else input = oInput;

show_debug_message(input.start);

if input.start
{
	pause = !pause;
}

var death_count = 0;

with oEnemyParent 
{
	if state != "dead"
	{
		death_count += 1;
	}
}



global.save[? room_get_name(room)] = death_count;

instance_activate_layer("Player");
instance_activate_layer("Enemies");
instance_activate_layer("Effects");

if pause exit;

instance_deactivate_layer("Player");
instance_deactivate_layer("Enemies");
instance_deactivate_layer("Effects");

if input.back pause = !pause;
