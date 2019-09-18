sprite_index = -1;


max_timer = 180;
timer = max_timer;

image_counter = 0;

last_down_input = 0;

with instance_create_layer(x,y,"Enemy_walls",oEnemy_wall)
{
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}