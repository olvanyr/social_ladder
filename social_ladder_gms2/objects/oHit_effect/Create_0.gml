if !layer_exists("Effects")
{
	layer_create(depth_layer.effects,"Effects");
}
layer_depth(layer_get_id("Effects"), depth_layer.effects);
layer = layer_get_id("Effects");

direction = random(360);
image_angle = direction;
speed = random_range(5,10);
alarm[0] = random_range(3,5);