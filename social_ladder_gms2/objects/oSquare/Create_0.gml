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

fov = 60;

//view trigger
					//fov = "field of view";
attack_range = "distance where self start attacking";
attack_distance_range = "distance witch self shot";

//health
hp = 200;
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
mask = sSquare_mask;


#region state


state = "idle";
last_state = "noone";
form = "normal"; //use to store the current form of square

// idle
idle = sSquare_idle;
idle_diamond = sSquare_idle_diamond;
idle_square = sSquare_idle_square;
idle_spd = 0.1;

idle_wait_time = 120;
set_state_sprite(idle,idle_spd,0);
// walk
walk = sSquare_walk;
walk_anim_spd = 0.5;
chase_speed = 0.8;

// knockback & stun
knockback_sprite = sSquare_idle;
stun_time = 20;
knockback = 4;
knockback_speed = 0;

contact_damage = 4;

// die
die =  sSquare_die;

// shot
shot = sSquare_rotate_end_projectile;
shot_anim_spd = 0.5;
shot_frame = 9;

// attack_pierces

attack_pierces = sSquare_attack_pierces;
attack_pierces_anim_spd = 0.4;
pierces_spd = 3;
left_border = 511;
right_border = 800;
dir = 1;

position = "middle"; // use to track the postion of squarre left right middle

// attack_charge

attack_charge = sSquare_charge;
attack_charge_anim_spd = 0.4;
charge_spd = 5;

//attack rotate
attack1 = sSquare_rotate;
attack1_anim_spd = 0.5;
attack1_frame = 5;
attack1_mask = sSquare_rotate_mask;
attack1_damage = 7;

rotate_end = sSquare_rotate_end;
rotate_projectile = sSquare_rotate_end_projectile;
rotate_projectile_frame = 1;
rotate_projectile_damage = 7;

rotate_end_anim_spd = 0.4;

//squaring
squaring = sSquare_squaring;
diamonding = sSquare_diamonding;
squaring_anim_spd = 0.5;

//decomposing
decomposing = sSquare_decomposing;
recomposing = sSquare_recomposing;
decomposing_anim_spd = 0.5;

//up
up = sSquare_up;
down = sSquare_down;
up_anim_speed = 0.3;
up_spd = 1;
up_down = noone; //stor if th square goes up or down

lvl = 0;
lvl_height = 64;
lvl_ground = 447;
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