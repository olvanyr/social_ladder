

attack1_frame = 2;
attack2_mask = sScratcher_attack1_mask;
attack2_frame = 6;

event_inherited();

//view trigger
fov = 160;
attack_range = 40;
attack_distance_range = "distance witch self shot";

//health
hp = 50;
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
mask = sScratcher_mask;


#region state

state = "idle";

// idle
idle = sScientist_idle;
idle_spd = 0.2;

// walk
walk = sScratcher_walk;
walk_anim_spd = 0.4;
chase_speed = 0.75;

// knockback & stun
knockback_sprite = sScratcher_knockback;
stun_time = 20;
knockback = 4;
knockback_speed = 0;

contact_damage = 2;


// die
die = sScratcher_die;

// Mimic variable
transformation = "transformation sprite";

// attack variable for Fist
attack1 = sScratcher_attack1;
attack1_anim_spd = 0.4;
attack1_frame = 2;
attack1_mask = sScratcher_attack1_mask;
attack1_damage = 5;

attack2 = "attack sprite"; // not needed if the first animation had two attack
attack2_anim_spd = "animation speed"; // not needed if the first animation had two attack
attack2_frame = 2;
attack2_mask = sScratcher_attack1_mask;
attack2_damage = 5;

// roll

roll = "roll sprite";
roll_cooldown = "cooldawn of the roll";
roll_speed = "speed of the roll";

// last attack of the slug
attack_once = "get if the last attack has alredy happened";
rng = "make the last attack randomly happened";

// charge for the scratcher
charge = sScratcher_attack2;
attack_charge_range = 150;
charge_damage = 10;
knockback_charge = 6;
charge_mask = sScratcher_attack2_mask;
charge_anim_spd = 0.45;
charge_speed = 2.2;

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





