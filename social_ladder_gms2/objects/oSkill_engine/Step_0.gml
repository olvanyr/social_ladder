//select the corect image for the miasma tree
var image_miasma_tree = sprite_get_number(sMiasma_tree);
var _experience = global.experience / global.total_experience;

image = round(image_miasma_tree * _experience);

show_debug_message( "global.experience : " +string( global.experience));
show_debug_message( "global.xp_wall_jump : " +string( global.xp_wall_jump));
show_debug_message( "global.wall_jump : " +string( global.wall_jump));
show_debug_message( "showcase : " +string( showcase));

// look if an ability can be "purshase" 
if global.experience >= global.xp_wall_jump && global.wall_jump != true && !showcase
{
	new_ability = true;
	ability = "wall_jump";
	exit;
}

if global.experience >= global.xp_double_jump && global.double_jump != true && !showcase
{
	new_ability = true;
	ability = "double_jump";
	exit;
}

if global.experience >= global.xp_cast && global.cast != true && !showcase
{
	new_ability = true;
	ability = "cast";
	exit;
}