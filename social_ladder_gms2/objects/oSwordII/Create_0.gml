event_inherited();

//view trigger
fov = 100;
attack_range = 20;
attack_distance_range = "distance witch self shot";

//health
hp = 35;
max_hp = hp;

//colision variables
gravity_speed = 0.4;
vsp = 0;
vsp_fraction = 0;
grounded = false;

//XP
experience = 1;

//dose you fly away ? 
fly = 0;

//mask
mask = sSword_mask;


#region state

state = "idle";

// idle
idle = sSword_idle;
idle_spd = 0.2;

// walk
walk = sSword_walk;
walk_anim_spd = 0.6;
chase_speed = 2;

// knockback & stun
knockback_sprite = sSword_knockback;
stun_time = 20;
knockback = 4;
knockback_speed = 0;

contact_damage = 2;

// die
die = sSword_die;

// Mimic variable
transformation = "transformation sprite";

// attack variable for Fist
attack1 = sSword_attack1;
attack1_anim_spd = 0.4;
attack1_frame = 3;
attack1_mask = sSword_attack1_mask;
attack1_damage = 8;


// roll

roll = sSword_slide;
roll_cooldown = 30;
roll_speed = 2.5;

// last attack of the slug
attack_once = "get if the last attack has alredy happened";
rng = "make the last attack randomly happened";

// charge for the scratcher
charge = "sprite of the charge";
charge_damage = "damage of the attack";
charge_mask = "mask of the attack";
charge_speed = "move speed of the charge";

// shot for distance
shot = "sprite of shot";
shot_anim_spd = "speed of the animation";
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