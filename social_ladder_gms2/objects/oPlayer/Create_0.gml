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
hsp_fraction = 0;
grounded = false;

//roll related variable
roll_cooldown = 0;
roll_cooldown_max = 30;


//cast related variable
cast_cooldown = 0;

//jump related variable
jump_speed = -6;
cut_jump_speed = -0.2;
jump_timer = 0;
jump_timer_max = 4;
jump_counter = 0;

//wall jump related variable
wall_jump_speed = 1.5;
wall_jump_timer = 0;
wall_jump_timer_max = 15;
jump_direction = 0;
roll_speed = 2.5;


//Collision mask related variable
half_mask_width = sprite_get_width(sPlayer_mask)/2;
mask_height = sprite_get_height(sPlayer_mask);


//Attack related variable
attack_down_cooldown = 0;
attack_down_cooldown_max = 13;
attack_animation_speed = 0.6;

hit = false;

invincibility = -1;

//HUD 
x_buffer = 10;
y_buffer = 10;

x_health_buffer = x_buffer + (3*3); 
y_health_buffer = y_buffer + (2*3); 
health_bar_width = 94*3;
max_health_bar_width = health_bar_width;
health_bar_height = 4*3;

x_healthpack_buffer = x_health_buffer + max_health_bar_width + (12*3);
inter_healthpack_buffer = 7*3;
healthpack_width = 5*3;

//health pack
healthpack = 3;
max_healthpack = healthpack;


//experience related variable
experience = 0;

// Save var
//key1
//wall_jump
//double_jump
//......




