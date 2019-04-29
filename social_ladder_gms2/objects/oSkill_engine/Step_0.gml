

if global.experience >= 2 && global.wall_jump == false && !showcase
{
	new_ability = true;
	ability = "wall_jump";
	exit;
}

if global.experience >= 2 && global.double_jump == false && !showcase
{
	new_ability = true;
	ability = "double_jump";
	exit;
}

if global.experience >= 2 && global.cast == false && !showcase
{
	new_ability = true;
	ability = "cast";
	exit;
}