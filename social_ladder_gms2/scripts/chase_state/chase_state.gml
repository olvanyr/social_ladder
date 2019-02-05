if !instance_exists(oPlayer) exit;

image_xscale = sign(oPlayer.x - x);
if (image_xscale == 0) image_xscale = 1;
var direction_facing = image_xscale;
var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
if distance_to_player <= attack_range
{
	state = "attack";
}
else
{
	move_and_collide(direction_facing * chase_speed, 0);
}