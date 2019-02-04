/// @description move_and_collide
/// @arg xSpeed
/// @arg ySpeed

var _xspeed = argument0;
var _yspeed = argument1;

if place_meeting(x + _xspeed, y, oWall)
{
	while !place_meeting(x + sign(_xspeed), y, oWall)
	{
		x += sign(_xspeed);
	}
	_xspeed = 0;
}

x += _xspeed;


if !place_meeting(x, y + _yspeed, oWall)
{
	y += _yspeed;
}

if place_meeting(x, y + _yspeed, oWall)
{
	if sign(_yspeed) == 1
	{
		move_contact_solid(270, -1);
		grounded = true;
	}
	vsp = 0;
	
}



if vsp != 0 grounded = false;

