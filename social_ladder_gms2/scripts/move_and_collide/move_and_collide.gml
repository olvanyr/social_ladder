/// @description move_and_collide
/// @arg xSpeed
/// @arg ySpeed

if self == oPlayer
{
	mask_index = sPlayer_mask;
}

var wall = oWall;
if is_enemy(self.object_index)
{
	wall = oEnemy_wall;
}

var _xspeed = argument0;
var _yspeed = argument1;

if place_meeting(x + _xspeed, y, wall)
{
	while !place_meeting(x + (sign(_xspeed)/100), y, wall)
	{
		x += (sign(_xspeed)/100);
	}
	_xspeed = 0;

}
x += _xspeed;


if place_meeting(x, y + _yspeed, wall)
{
	while !place_meeting(x, y + sign(_yspeed), wall)
	{
		y += sign(_yspeed);
	}
	
	if sign(_yspeed) == 1
	{
		grounded = true;
	}
	_yspeed = 0;
	vsp = 0;
}
y += _yspeed;


/*  old way, don't remember why I have done it this way
if !place_meeting(x, y + _yspeed, wall)
{
	y += _yspeed;
}
	
if place_meeting(x, y + _yspeed, wall)
{
	if sign(_yspeed) == 1
	{
		move_contact_solid(270, -1);
		grounded = true;
	}
	vsp = 0;
}
*/

if self == oPlayer
{
	mask_index = sPlayer_hit_mask;
}
