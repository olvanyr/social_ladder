if !layer_exists("Lifepack")
{
	layer_create(depth_layer.lifepack,"Lifepack");
}

layer = layer_get_id("Lifepack");

pop_up = noone;
image_counter = 0;
draw = false;