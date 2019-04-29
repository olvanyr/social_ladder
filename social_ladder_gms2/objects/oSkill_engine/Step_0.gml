//select the corect image for the miasma tree
var image_miasma_tree = sprite_get_number(sMiasma_tree);
var _experience = global.experience / total_experience;

image = round(image_miasma_tree * _experience);

// look if an ability can be "purshase" 
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