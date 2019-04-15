spd = random_range(3,6);

if instance_exists(oPlayer)
{
	player_x = oPlayer.x;
	player_y = oPlayer.y - 10;
}

direction = point_direction(x, y, player_x, player_y) + random_range(-5,5);
image_angle = direction;
