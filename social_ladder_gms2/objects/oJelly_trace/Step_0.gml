x += lengthdir_x(spd,dir);
y += lengthdir_y(spd,dir);

spd -= deceleration;

if spd <= 0 spd = 0;

if fading 
{
	alpha -= 0.01;
}
if alpha <= 0 instance_destroy();
image_alpha = alpha;

if spd == 0
{
	x += random_range(-1,1);
	y += random_range(-1,1);
}