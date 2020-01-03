if !layer_exists("Walls")
{
	layer_create(depth_layer.walls,"Walls");
}else 
{
	layer_depth(layer_get_id("Walls"),depth_layer.walls)
}

layer = layer_get_id("Walls");

if !layer_exists("Effects")
{
	layer_create(depth_layer.effects,"Effects");
}

//use to make the platform have a hitbox at the end of creat, so we can put grass on it
once = false;


max_timer = 180;
timer = max_timer;

pop_up = noone;

image_counter = 0;

last_down_input = 0;

with instance_create_layer(x,y,"Instances",oEnemy_wall)
{
	
	sprite_index = sPlatform;
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}
