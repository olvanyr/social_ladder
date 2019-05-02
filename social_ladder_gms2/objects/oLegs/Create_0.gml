event_inherited();

//view trigger
fov = 130;
attack_range = 50
attack_distance_range = "distance witch self shot";

//health
hp = 50
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
mask = sLegs_mask;


#region state

state = "idle";

// idle
idle = sLegs_idle;
idle_spd = 0.2;

// walk
walk = sLegs_walk;
walk_anim_spd = 0.6;
chase_speed = 1;

// knockback & stun
knockback_sprite = sLegs_knockback;
stun_time = 1;
knockback = 4;
knockback_speed = 0;

contact_damage = 2;

// die
die =  sLegs_die;

// Mimic variable
transformation = "transformation sprite";

// attack variable for Fist
attack1 = sLegs_attack2;
attack1_anim_spd = 0.4;
attack1_frame = 6;
attack1_mask = sLegs_attack2_mask;
attack1_damage = 15;

attack2 = "attack sprite"; // not needed if the first animation had two attack
attack2_anim_spd = "animation speed"; // not needed if the first animation had two attack
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
attack_charge_range = "fov for the charge attack";
knockback_charge = "knockback dealed";
charge_mask = "mask of the attack";
charge_anim_spd = "spee dof the charge animation";
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