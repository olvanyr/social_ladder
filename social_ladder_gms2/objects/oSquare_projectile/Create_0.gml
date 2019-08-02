move_speed = 3;

dir = noone;

mask = sprite_index;

contact_damage = noone;

dir = sign(oPlayer.x - x);
image_xscale = sign(dir);

show_debug_message("projectile dir : " + string(dir))