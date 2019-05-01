
event_inherited();
//view trigger
fov = 100;

attack_range = -5;

attack_distance_range = "distance witch self shot";

//health
hp = 17;
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
mask = sMimic_mask;


#region state

state = "idle";

// idle
idle = sMimic_idle;
idle_spd = 0;

// walk
walk = sMimic_walk;
walk_anim_spd = 0.4;
chase_speed = 1.5;

// knockback & stun
knockback_sprite = sMimic_knockback;
stun_time = 20;
knockback = 4;
knockback_speed = 0;

// die
die = sMimic_die;

// Mimic variable
transformation = sMimic_transformation;

// attack variable for Fist
attack1 = "attack sprite";
attack1_anim_spd = "animation speed";
attack1_frame = "frame where to spawn the hitbox";
attack1_mask = "mask of the attack";
attack1_damage = "damage of the attack";

attack2 = "attack sprite";
attack2_anim_spd = "animation speed";
attack2_frame = "frame where to spawn the hitbox";
attack2_mask = "mask of the attack";
attack2_damage = "damage of the attack";

// roll

roll = "roll sprite";
roll_cooldown = "cooldawn of the roll";
roll_speed = "speed of the roll";

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