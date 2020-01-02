if !layer_exists("Lava")
{
	layer_create(depth_layer.lava,"Lava");
}
set_layer_depth("Lava",depth_layer.lava);
layer = layer_get_id("Lava");

if !layer_exists("Effects")
{
	layer_create(depth_layer.effects,"Effects");
}
set_layer_depth("Effects",depth_layer.effects);
layer = layer_get_id("Effects");

timer = 0;