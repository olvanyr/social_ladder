if !layer_exists("Grass_back")
{
	layer_create(depth_layer.grass_back,"Grass_back");
}

layer = layer_get_id("Grass_back");

var sprite = layer_sprite_create("Grass_back",x,y,sprite_index);
layer_sprite_angle(sprite,image_angle);
layer_sprite_speed(sprite,image_speed);
layer_sprite_index(sprite,image_index);
layer_sprite_xscale(sprite,image_xscale);
layer_sprite_yscale(sprite,image_yscale);
alarm[1] = 1;