if !layer_exists("Lava")
{
	layer_create(depth_layer.lava,"Lava");
}
layer = layer_get_id("Lava");

timer = 0;