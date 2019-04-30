
if !instance_exists(oPlayer) exit;


if abs(oPlayer.x - x) < 2 image_xscale = 0
var direction_facing = image_xscale;

var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);

if distance_to_player <= attack_range
{
	state = "attack";
}

if distance_to_player <= attack_charge_range && distance_to_player >= attack_charge_range - 15
{
	state = "charge";
}

if distance_to_player > attack_range
{
	//avoid some xierd cliping when the player is perfectly above the mob
	image_xscale = sign(oPlayer.x - x);
	if (image_xscale == 0) image_xscale = 1;
	
	move_and_collide(direction_facing * chase_speed, 0);
}