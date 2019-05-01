event_inherited();

//view trigger
fov = "field of view";
attack_range = "distance where self start attacking";
attack_distance_range = "distance witch self shot";

//health
hp = "amount of health";
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
mask = "sprite to use as mask";


#region state

state = "idle";

// idle
idle = "idle_sprite";
idle_spd = "idle animation speed";

// walk
walk = "walk sprite";
walk_anim_spd = "walk animation speed";
chase_speed = "walk speed";

// knockback & stun
knockback_sprite = "knockback sprite";
stun_time = "time the enemy stay stun";
knockback = 4;
knockback_speed = 0;

// die
die =  "death sprite";

// Mimic variable
transformation = "transformation sprite";

// attack variable for Fist
attack1 = "attack sprite";
attack1_anim_spd = "animation speed";
attack1_frame = "frame where to spawn the hitbox";
attack1_mask = "mask of the attack";
attack1_damage = "damage of the attack";

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