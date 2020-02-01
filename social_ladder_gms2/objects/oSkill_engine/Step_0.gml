//select the corect image for the miasma tree
var image_miasma_tree = sprite_get_number(sMiasma_tree);
var _experience = global.experience / global.total_experience;

image = round(image_miasma_tree * _experience);

// look if an ability can be "purshase" 
if global.experience >= global.xp_wall_jump && global.wall_jump == false && !showcase
{
	new_ability = true;
	ability = "wall_jump";
	exit;
}

if global.experience >= global.xp_double_jump && global.double_jump == false && !showcase
{
	new_ability = true;
	ability = "double_jump";
	exit;
}

if global.experience >= global.xp_cast && global.cast == false && !showcase
{
	new_ability = true;
	ability = "cast";
	exit;
}