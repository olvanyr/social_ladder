creator = noone;

if instance_exists(oPlayer)
{
	dir = sign(oPlayer.x - x);
}

spd = 2.5;
hsp = spd *dir;
vsp = 0;

image_xscale = dir;
image_speed = 0.5;

grounded = 0;