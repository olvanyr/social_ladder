if !layer_exists("Door")
{
	layer_create(depth_layer.door,"Door");
}
set_layer_depth("Door",depth_layer.door);
layer = layer_get_id("Door");

input = noone;

new_ability = false;
ability = noone;
showcase = false;

global.total_experience = 100;

//use to animate srite
image_counter = 0;

counter_pulsse = 0;
counter_use = 0;
pop_up = noone;

// use to showcase the new ability
alpha = 0;

// use to set the image of the miasma tree
image = 0;

// xp needed for trhe skill*
xp_wall_jump = 2;
xp_double_jump = 4;
xp_cast = 6;