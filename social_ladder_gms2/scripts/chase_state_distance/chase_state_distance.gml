if !instance_exists(oPlayer) exit;


if fly != 1
{
image_xscale = sign(oPlayer.x - x);
}else image_xscale = -sign(oPlayer.x - x);

if abs(oPlayer.x - x) < 5 image_xscale = 0
var direction_facing = image_xscale;



if (image_xscale == 0) image_xscale = 1;
var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);

if distance_to_player <= attack_range
{
	state = "attack";
}


if distance_to_player <= attack_distance_range && distance_to_player >= attack_distance_range - 10
{
	state = "shot";
}

