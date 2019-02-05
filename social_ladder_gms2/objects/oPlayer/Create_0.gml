
event_inherited();
image_speed = 0.4;

state = "move";

walk_speed = 0;
max_walk_speed = 2;

acceleration = 0.3;

gravity_speed = 0.2;
jump_speed = -6;
cut_jump_speed = 0.2;

jump_timer = 0;
jump_counter = 0;

slide_speed = 2.5;

grounded = false;
vsp = 0;
vsp_fraction = 0;

half_mask_width = sprite_get_width(sPlayer_mask)/2;
mask_height = sprite_get_height(sPlayer_mask);
buffer = 6;

knockbackable = true;
attack_down_cooldown = 0;


// Depedencies
input = instance_create_layer(0,0,"Instances",oInput)

with instance_create_layer(x,y,"Instances", oCamera)
{
	follow = other;
}