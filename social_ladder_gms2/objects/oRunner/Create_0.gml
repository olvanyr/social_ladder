event_inherited();

//view trigger
fov = 100;

attack_range = -5;

//health
hp = 10;
max_hp = hp;

//colision variables
gravity_speed = 0.4;
vsp = 0;
vsp_fraction = 0;
grounded = false;

//XP
experience = 1;

//dose you fly away ? 
fly = irandom(3);

//mask
mask = sRunner_mask;

#region state

state = "idle";

// idle
idle = sRunner_idle;
idle_spd = 0.3;

// walk
walk = sRunner_walk;
walk_anim_spd = 0.2;
chase_speed = 1;

// knockback & stun
knockback_sprite = sRunner_knockback;
stun_time = 20;
knockback = 4;
knockback_speed = 0;

// die
die = sRunner_die;

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