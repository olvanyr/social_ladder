

if global.experience >= 2 && global.wall_jump == false
{
	new_ability = true;
	ability = "wall_jump";
	exit;
}

if global.experience >= 2 && global.double_jump == false
{
	new_ability = true;
	ability = "double_jump";
	exit;
}

if global.experience >= 2 && global.cast == false
{
	new_ability = true;
	ability = "cast";
	exit;
}