if !layer_exists("Effects")
{
	layer_create(depth_layer.effects,"Effects");
}
set_layer_depth("Effects",depth_layer.effects);


if !layer_exists("Door")
{
	layer_create(depth_layer.door,"Door");
}
set_layer_depth("Door",depth_layer.door);
layer = layer_get_id("Door");

needed_xp = 10;
player_xp = 0;
xp_count = 0;
image_speed = 0;

visual_factor = 5; //nomber of particle generated for one xp