/// @arg knockback_sprite
/// @arg next_state
/// @arg knockback_speed

var _knockback_spirte = argument0;
var _next_state = argument1;
var _knockback_friction = 0.4;

set_state_sprite(_knockback_spirte, 0,0);
if object_index != oFlying image_xscale = -sign(knockback_speed);

move_and_collide(knockback_speed,0);

knockback_speed = approach(knockback_speed, 0, _knockback_friction);
if knockback_speed == 0 
{
	knockback_speed = 0;
	state = _next_state;
}
