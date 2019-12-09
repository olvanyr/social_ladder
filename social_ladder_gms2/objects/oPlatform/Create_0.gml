if !layer_exists("Walls")
{
	layer_create(depth_layer.walls,"Walls");
}else 
{
	layer_depth(layer_get_id("walls"),depth_layer.walls)
}

layer = layer_get_id("Walls");

//use to make the platform have a hitbox at the end of creat, so we can put grass on it
once = false;


max_timer = 180;
timer = max_timer;

image_counter = 0;

last_down_input = 0;

with instance_create_layer(x,y,"Enemy_walls",oEnemy_wall)
{
	
	sprite_index = sPlatform;
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}
