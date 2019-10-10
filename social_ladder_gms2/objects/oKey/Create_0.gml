key = "key_door1";

for (var i = 0; i < array_length_1d(global.key); i++)
{
	if global.key[i] == string(key)
	{
		instance_destroy();
	}
}