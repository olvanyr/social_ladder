

event_inherited();

attack_range = 0;
knockback = true;
knockback_speed = 0;

gravity_speed = 0.4;
grounded = false;
vsp = 0;
vsp_fraction = 0;

enum sav_variable
{
   x,
   y,
   state
}

global.ennemies_array[self,sav_variable.x] = x;