event_inherited();

//dependencises
if instance_exists(oCamera)
{
	cam = oCamera;
}

// chase
chassing_time = 100;
casting_time = 100;
charge_time = 40;
timer = 0;

fov = 160;

//health
hp = 10;
max_hp = hp;

//XP
experience = 1;

//mask
mask = sJelly_mask;


#region state

state = "idle";

// do the ennemy let a trace ? 
trace = 0;

// idle
idle = sJelly;
idle_spd = 0.1;

// walk
walk = sJelly;
walk_anim_spd = 0.8;
chase_speed = 1;

// knockback & stun
knockback_sprite = sMaggie_idle;
stun_time = 20;
knockback = 4;
knockback_speed = 5;

contact_damage = 4;

//charge
player_x = 0;
player_y = 0;

charge_speed = 4;

// die
die =  sMaggie_die;

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