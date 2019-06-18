event_inherited();



// chase
chassing_time = 100;
casting_time = 100;
timer = 0;

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
mask = sMaggie_mask;


#region state

state = "idle";

// idle
idle = sMaggie_idle;
idle_spd = 1;

// walk
walk = sMaggie_walk;
walk_anim_spd = 3;
chase_speed = 1;

// knockback & stun
knockback_sprite = sMaggie_idle;
stun_time = 0;
knockback = 4;
knockback_speed = 0;

contact_damage = 4;

// die
die =  sMaggie_die;

// shot for distance
shot = sMaggie_attack;
shot_anim_spd = 1;
shot_frame = "frame where to spawn the hitbox";

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