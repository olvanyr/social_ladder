
if !layer_exists("Ground_effects")
{
	layer_create(depth_layer.ground_effects,"Ground_effects");
}
layer_depth(layer_get_id("Effects"), depth_layer.effects);
layer = layer_get_id("Ground_effects");

image_speed = random_range(0.5,1);
image_index = random_range(0,6);
hsp = random_range(-2,2);
vsp = random_range(-2,2);
image_xscale = choose(1,-1);
image_yscale = choose(1,-1);
