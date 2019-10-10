
if instance_exists(oPlayer)
{
	x = oPlayer.x + random_range(-20,20);
	y = oPlayer.y - 15 + random_range(-20,20);
}

speed = random_range(1,3);

timer = 0;


x_buffer = random_range(-5,5);
y_buffer = random_range(-5,5);