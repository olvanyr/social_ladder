event_inherited();

//view trigger
fov = 200;
attack_range = 60;
attack_distance_range = 80;
accuracy = 100;

//health
hp = 60;
max_hp = hp;

//colision variables
gravity_speed = 0.4;
vsp = 0;
vsp_fraction = 0;
grounded = false;

//XP
experience = 1;


//mask
mask = sSkeleton_mask;


#region state

state = "idle";

// idle
idle = sSkeleton_idle;
idle_spd = 0.2;
timer_idle = 100;

// walk
walk = sSkeleton_run;
walk_anim_spd = 0.4;
chase_speed = 1.3;
chase_timer = 0;
chase_time_remaning = 60;

// knockback & stun
knockback_sprite = sSkeleton_hitstun;
stun_time = 20;
knockback = 4;
knockback_speed = 0;

contact_damage = 3;

// die
die =  sSkeleton_die;

// attack variable for Fist
attack_dash = 0;
attack_dash_acceleration = 0.5;
attack_dash_max_speed = 2;


attack1 = sSkeleton_attack_one;
attack1_anim_spd = 0.7;
attack1_frame = 1;
attack1_mask = sSkeleton_attack_one_mask;
attack1_damage = 3;
attack1_knockback = 6;
attack1_timer = 70;

attack2 = sSkeleton_attack_two; // not needed if the first animation had two attack
attack2_anim_spd = 0.7; // not needed if the first animation had two attack
attack2_frame = 3;
attack2_mask = sSkeleton_attack_two_mask;
attack2_damage = 5;
attack2_knockback = 6;
attack2_timer = 70;

attack3 = sSkeleton_attack_three; // not needed if the first animation had two attack
attack3_anim_spd = 0.7; // not needed if the first animation had two attack
attack3_frame = 4;
attack3_mask = sSkeleton_attack_three_mask;
attack3_damage = 7;
attack3_knockback = 6;
attack3_timer = 70;

// roll

roll = sSkeleton_roll;
roll_cooldown = 0;
roll_anim_speed = 0.8;
roll_speed = 3;

// shot for distance
shot = "sprite of shot";
shot_anim_spd = "speed of the animation";
shot_frame = "frame where to spawn the hitbox";

//jump
jump_up = sSkeleton_dawn_up;
jump_down = sSkeleton_dawn_up;

#endregion
#region text

ybuffer = 10;
line = "";
line_part = "";

c_text = c_black;
font = fMaggie;

text_buffer = 20;

letters_count = 0;
letter_speed = 0.5;
time_bettween_line = 150;
next_line = 0;

timer = 0;

once1 = true;
once2 = true;

lines[0] = "I here to free you";
lines[1] = "The outside world is very hostile";
lines[2] = "But it is yours now";
lines[3] = "you will have to kill\nall of this creature";
#endregion
#region pathfinding
pathfinding_timer = 0;

// inbitialize variable in order to draw grid and path
ds_grid_pathfinding = noone;
path_building = noone;

//move

hsp = 0;

move_spd = 1.7;
jump_spd = -7;
jump_spd_max = jump_spd;

move = 0;

grounded = false

// Variable to follow the path
action = 0;
path_point = 0;
jump_action = 0;

if !instance_exists(oGrid)
{
	instance_create_layer(0,0,"Instances",oGrid);
}

#endregion
#region save and load
once = true; //use to make the sav script happen only once when the enemy is dead

save_x = string(id) + string(save.x);
save_y = string(id) + string(save.y);
save_state = string(id) + string(save.state);

if global.save[?save_state] == "dead"
{
	state = global.save[?save_state];
	x = global.save[?save_x];
	y = global.save[?save_y];
}else set_enemies_map();
#endregion