/// @arg death_sprite
var death_sprite = argument0;
set_state_sprite(death_sprite,0.25, 0);
friction = true;

if image_index >= image_number -1
{
	image_index = image_number -1;
}

move_and_collide(knockback_speed,0);

var _knockback_friction = 0.4;
knockback_speed = approach(knockback_speed, 0, _knockback_friction);