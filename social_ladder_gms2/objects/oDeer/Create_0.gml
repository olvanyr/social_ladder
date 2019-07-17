event_inherited();

//dependencises
if instance_exists(oCamera)
{
	cam = oCamera;
}

// chase
chassing_time = 250;
casting_time = 100;
timer = 0;

fov = 160;

//view trigger
					//fov = "field of view";
attack_range = "distance where self start attacking";
attack_distance_range = "distance witch self shot";

//health
hp = 80;
max_hp = hp;

//colision variables
gravity_speed = 0.4;
vsp = 0;
vsp_fraction = 0;
grounded = false;

//XP
experience = 1;

//dose you fly away ? 
fly = "irandom(3) if 1 yes, other no";

//mask
mask = sDeer_mask;


#region state

state = "idle";

// idle
idle = sDeer_idle;
idle_spd = 0.1;

// walk
walk = sDeer_walk;
walk_anim_spd = 0.8;
chase_speed = 1;

// knockback & stun
knockback_sprite = sDeer_idle;
stun_time = 0;
knockback = 4;
knockback_speed = 0;

contact_damage = 4;

// die
die =  sDeer_die;

// shot for distance
shot = sDeer_cast;
shot_anim_spd = 0.5;
shot_frame = 9;

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