
if !instance_exists(target)
{
	target = oPlayer;
}
if !instance_exists(target) exit;
var dir = point_direction(x, y, target.x, target.y);
var acceleration = 0.25;
motion_add(dir, acceleration);
var max_speed = 4;
if (speed > max_speed) speed = max_speed; 

image_angle = dir;

if place_meeting(x,y,target)
{
	audio_play_sound(aExpr, 1, false);
	instance_destroy();
}

