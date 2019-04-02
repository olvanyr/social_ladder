// Inherit the parent event
event_inherited();

if state = "chase"
{
	chase_speed += 0.01;
	if chase_speed > max_chase_speed
	{
		chase_speed = max_chase_speed;
	}
	walk_animation_speed += 0.01;
	if walk_animation_speed > 0.55
	{
		walk_animation_speed = 0.55;
	}
}else 
{
	chase_speed = 1;
	walk_animation_speed = 0.2;
}
