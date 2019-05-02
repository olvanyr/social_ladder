if !instance_exists(oPlayer) exit;
var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
var acceleration = 0.25;
motion_add(dir, acceleration);
var max_speed = 4;
if (speed > max_speed) speed = max_speed; 

image_angle = dir;