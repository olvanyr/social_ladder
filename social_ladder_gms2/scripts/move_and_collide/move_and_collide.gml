/// @description move_and_collide
/// @arg xSpeed
/// @arg ySpeed

if self == oPlayer
{
	mask_index = sPlayer_mask;
}

var _xspeed = argument0;
var _yspeed = argument1;
/*
if !place_meeting(x + _xspeed, y, oWall)
{
	x += _xspeed;
}

if place_meeting(x + _xspeed, y, oWall)
{
	if sign(_xspeed) == 1
	{
		var dir = 0;
	}else dir = 180;
	move_contact_solid(dir, -1);
}
*/

if place_meeting(x + _xspeed, y, oWall)
{
	while !place_meeting(x + (sign(_xspeed)/100), y, oWall)
	{
		x += (sign(_xspeed)/100);
	}
	_xspeed = 0;

}else if object_get_parent(object_index) == oEnemyParent
{
	if place_meeting(x + _xspeed, y, oEnemy_wall)
	{
		while !place_meeting(x + sign(_xspeed), y, oEnemy_wall)
		{
			x += sign(_xspeed);
		}
		_xspeed = 0;
	}
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


if self == oPlayer
{
	mask_index = sPlayer_hit_mask;
}
