creator = noone;

if instance_exists(oPlayer)
{
	dir = point_direction(x,y,oPlayer.x,oPlayer.y - 25);
}else dir = 0;

image_angle = dir;

spd = random_range(2,4);
hsp = lengthdir_x(spd,dir);
vsp = lengthdir_y(spd,dir);


image_speed = 0.5;

grounded = 0;