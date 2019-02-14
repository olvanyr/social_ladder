event_inherited();

//Init somme variable
image_speed = 0.4;
state = "move";

// walk related variable
walk_speed = 0;
walk_speed_fraction = 0;
max_walk_speed = 2;
acceleration = 0.3;

//gravity related variable
gravity_speed = 0.2;
vsp = 0;
vsp_fraction = 0;
grounded = false;


//jump related variable
jump_speed = -6;
cut_jump_speed = 0.2;
jump_timer = 0;
jump_counter = 0;

//wall jump related variable
wall_jump_speed = 3;
wall_jump_timer = false;
jump_direction = 0;
slide_speed = 2.5;


//Collision mask related variable
half_mask_width = sprite_get_width(sPlayer_mask)/2;
mask_height = sprite_get_height(sPlayer_mask);


//Attack related variable
knockbackable = true;
attack_down_cooldown = 0;
attack_animation_speed = 0.6;


// Depedencies
input = instance_create_layer(0,0,"Instances",oInput)

if !instance_exists(oCamera)
{
	with instance_create_layer(x,y,"Instances", oCamera)
	{
		follow = other;
	}
}