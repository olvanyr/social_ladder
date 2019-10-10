
if instance_exists(oPlayer)
{
direction =	point_direction(x,y,oPlayer.x + x_buffer,oPlayer.y - 15 + y_buffer);
}


timer ++;

if timer > 25
{
	image_alpha =- 0.1;
}

if image_alpha <= 0
{
	instance_destroy();
}