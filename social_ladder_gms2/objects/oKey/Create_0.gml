if !layer_exists("Effects")
{
	layer_create(depth_layer.effects,"Effects");
}

layer_depth(layer_get_id("Effects"), depth_layer.effects);
layer = layer_get_id("Effects");



sprite_index = asset_get_index("sKey_" + string(key));


for (var i = 0; i < array_length_1d(global.key); i++)
{
	if global.key[i] == string(key)
	{
		instance_destroy();
	}
}

picked = false;
once = false;