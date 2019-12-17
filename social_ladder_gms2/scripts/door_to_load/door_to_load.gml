if global.save[? "door1"] == true
{
	var array_length = array_length_1d(global.key);
	var door_exists = false;
	for (var i = 0; i < array_length; i++)
	{
		if global.key[i] == "door1"
		{
			door_exists = true;
		}
	}
	if door_exists == false global.key[array_length] = "door1";
}


if global.save[? "factory"] == true
{
	var array_length = array_length_1d(global.key);
	var door_exists = false;
	for (var i = 0; i < array_length; i++)
	{
		if global.key[i] == "factory"
		{
			door_exists = true;
		}
	}
	if door_exists == false global.key[array_length] = "factory";
}
/*
if global.save[? "factory"] == true
{
	var array_length = array_length_1d(global.key)
	global.key[array_length] = "factory";
}