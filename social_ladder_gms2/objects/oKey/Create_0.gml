key = "door1";

sprite_index = asset_get_index("sKey_" + string(key));


for (var i = 0; i < array_length_1d(global.key); i++)
{
	if global.key[i] == string(key)
	{
		instance_destroy();
	}
}