/// @arg next state

var next_state = argument0;

if image_xscale == 1
{
	move_and_collide(roll_speed,0);
}
if image_xscale == -1
{
	move_and_collide(-roll_speed,0);
}
			
if animation_end()
{
	state = next_state;
}